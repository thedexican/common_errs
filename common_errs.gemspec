# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'common_errs/version'

Gem::Specification.new do |spec|
  spec.name          = "common_errs"
  spec.version       = CommonErrs::VERSION
  spec.authors       = ["thedexican"]
  spec.email         = ["kevin@dexterinteractive.com"]
  spec.summary       = %q{Simple Error Management mixin}
  spec.description   = %q{Simple API to manage non ActiveRecord errors}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
