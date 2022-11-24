# frozen_string_literal: true

require_relative "lib/eol_rb/version"

Gem::Specification.new do |spec|
  spec.name = "eol_rb"
  spec.version = EOL::VERSION
  spec.authors = ["Alejandro Colomina"]
  spec.email = ["ale@coolomina.dev"]

  spec.summary = "A Ruby wrapper for the endoflife.date API"
  spec.description = "Ruby client for endoflife.date API"
  spec.homepage = "https://github.com/Coolomina/eol-rb"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "homepage_uri" => spec.homepage,
    "source_code_uri" => spec.homepage,
    "bug_tracker_uri" => "https://github.com/Coolomina/eol-rb/issues",
    "changelog_uri" => "https://github.com/Coolomina/eol-rb/releases"
  }

  spec.files         = Dir["lib/**/*", "LICENSE.txt", "README.md", "CHANGELOG.md"]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 2.7"

  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rubocop", "~> 1.39"
end
