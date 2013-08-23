# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ppp/version'

Gem::Specification.new do |spec|
  spec.name = "ppp"
  spec.version = PPP::VERSION
  spec.authors = ["Daan van Berkel"]
  spec.email = ["daan.v.berkel.1980@gmail.com"]
  spec.description = %q{PPP demonstrates the connection between computations and games}
  spec.summary = %q{PPP, short for Pirate Power Play, demonstrates in the connection between computations and games.}
  spec.homepage = "https://github.com/dvberkel/Arrrrcamp2013"
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/)
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "travis-lint"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "treetop"
end
