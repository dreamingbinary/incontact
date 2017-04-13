# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "incontact_client/version"

Gem::Specification.new do |spec|
  spec.name = "incontact_client"
  spec.version = InContactClient::VERSION
  spec.authors = ["Brian Tennity"]
  spec.email = ["btennity@customink.com"]
  spec.description = "A Ruby gem to access the InContact API"
  spec.summary = spec.description
  spec.homepage = "https://github.com/customink/incontact_client"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "hashie"
  spec.add_dependency "retryable"
end
