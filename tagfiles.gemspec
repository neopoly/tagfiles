lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tagfiles/version"

Gem::Specification.new do |spec|
  spec.name          = "tagfiles"
  spec.version       = Tagfiles::VERSION
  spec.authors       = ["Peter Suschlik"]
  spec.email         = ["ps@neopoly.de"]
  spec.summary       = "Provides the tagfile helper for Rails"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/neopoly/tagfiles"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.2.10"
end
