# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ggake/version'

Gem::Specification.new do |spec|
  spec.name          = "ggake"
  spec.version       = Ggake::VERSION
  spec.authors       = ["Giles Alexander"]
  spec.email         = ["giles.alexander@gmail.com"]
  spec.description   = %q{A collection of useful Rake utilities}
  spec.summary       = spec.description
  spec.homepage      = "http://github.com/gga/ggake"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rake"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "fog"
end
