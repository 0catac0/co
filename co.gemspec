# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'co/version'

Gem::Specification.new do |spec|
  spec.name          = "co"
  spec.version       = Co::VERSION
  spec.authors       = ["0catac0"]
  spec.email         = ["taco@yavin4.nl"]
  spec.summary       = %q{Command organizer}
  spec.description   = %q{Use co to remember and organize shell commands.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "sqlite3"
end
