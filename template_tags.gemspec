# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "template_tags/version"

Gem::Specification.new do |spec|
  spec.name          = "template_tags"
  spec.version       = TemplateTags::VERSION
  spec.authors       = ["Sebastian Skałacki"]
  spec.email         = ["skalee@gmail.com"]

  spec.summary       = %q{Simple view helper for Rails which makes embedding} +
                       %q{ client-side templates in views bit easier.}
  spec.licenses      = %w[Ruby MIT ISC]
  spec.homepage      = "https://github.com/skalee/template_tags"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "railties", ">= 4.0", "< 6.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "combustion", "~> 0.5.3"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "rspec-rails", "~> 3.6"
end
