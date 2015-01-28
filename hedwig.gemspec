# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hedwig/version'

Gem::Specification.new do |spec|
  spec.name          = "hedwig"
  spec.version       = Hedwig::VERSION
  spec.authors       = ["Jared Hoyt"]
  spec.email         = ["jaredhoyt@gmail.com"]
  spec.summary       = %q{TripAdvisor API wrapper}
  spec.description   = %q{Hedwig is an API wrapper for TripAdvisor's Content API.}
  spec.homepage      = "http://github.com/jaredhoyt/hedwig"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
