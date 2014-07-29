# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


Gem::Specification.new do |spec|
  spec.name          = "language-select"
  spec.version       = "1.0.6"
  spec.date             = "2014-07-28"
  spec.authors       = ["Viduranga Wijesooriya"]
  spec.email         = ["vpowerrc@gmail.com"]
  spec.summary       = ""
  spec.description   = "Ruby gem to populate language select dropdown list"
  spec.homepage      = "https://github.com/vpowerrc/language-select"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
