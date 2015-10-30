module Pipes
  # Pipe is a mix-in which turns a class into a Pipes building block (Pipe).
  # A Pipe can only have class methods since it can't be instantiated.
  module Pipe
    def self.included(base)
      base.extend(ClassMethods)
    end
 
    # The initializer here is overridden so that you can not instantiate classes
    # that mix in Pipe.
    def initialize
      fail InstanceError, 'Pipes are not supposed to be instantiated'
    end
    module ClassMethods
      def very_complex_method
        ctx.on_start(self, method) unless respond_to?(:_comp?)
        begin
          public_send(method, ctx)
          ctx.on_success(self, method) unless respond_to?(:_comp?)
        rescue StandardError => e
          raise unless !respond_to?(:_comp?) && ctx.on_error(self, method, e)
        end
        ctx.on_start(self, method) unless respond_to?(:_comp?)
        begin
          public_send(method, ctx)
          ctx.on_success(self, method) unless respond_to?(:_comp?)
        rescue StandardError => e
          raise unless !respond_to?(:_comp?) && ctx.on_error(self, method, e)
        end
      end
    end
  end
end
