# encoding: utf-8

Gem::Specification.new do |spec|
  spec.name    = 'codequest_pipes'
  spec.version = '0.1.0'

  spec.author      = 'codequest'
  spec.email       = 'hello@codequest.com'
  spec.description = 'Pipes provides a Unix-like way to chain business objects'
  spec.summary     = 'Unix-like way to chain business objects (interactors)'
  spec.homepage    = 'https://github.com/codequest-eu/codequest_pipes'
  spec.license     = 'MIT'

  spec.files      = `git ls-files`.split($RS)
  spec.test_files = spec.files.grep(/^spec/)

  spec.add_development_dependency 'bundler', '>= 1.6.9'
  spec.add_development_dependency 'rake', '~> 10.3'
end
