# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chronosphere/version'

Gem::Specification.new do |gem|
  gem.name          = "chronosphere"
  gem.version       = Chronosphere::VERSION
  gem.authors       = ["Peter Souter"]
  gem.email         = ["p.morsou@gmail.com"]
  gem.description   = %q{A command line tool for various calendar and date tasks}
  gem.summary       = %q{Chronosphere is a CLI for dates and calendar tasks.}
  gem.homepage      = "https://github.com/petems/chronosphere"
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "thor", "~> 0.18.1"
  gem.add_dependency "middleware" , "~> 0.1.0"
  gem.add_dependency "shellout", "~> 0.5"
  gem.add_dependency "chronic", "~> 0.10.2"

  gem.add_development_dependency "rake", "~> 10.1.0"
  gem.add_development_dependency "rspec-core", "~> 2.13.0"
  gem.add_development_dependency "rspec-expectations", "~> 2.13.0"
  gem.add_development_dependency "rspec-mocks", "~> 2.13.0"
  gem.add_development_dependency "timecop", "0.7.0"
end
