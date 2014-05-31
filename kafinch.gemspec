# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kafinch/version'

Gem::Specification.new do |spec|
  spec.name          = "kafinch"
  spec.version       = Kafinch::VERSION
  spec.authors       = ["Bradley Skaggs"]
  spec.email         = ["bskaggs@acm.org"]
  spec.summary       = %q{Send IRC chatroom activity to Kafka.}
  spec.description   = %q{Kafinch sits in one or more chatrooms on a server and sends messages to Apache Kafka.}
  spec.homepage      = "https://github.com/bskaggs/kafinch"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_runtime_dependency "cinch"
  spec.add_runtime_dependency "poseidon"
  spec.add_runtime_dependency "thor"
end
