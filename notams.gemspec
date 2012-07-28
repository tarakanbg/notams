# -*- encoding: utf-8 -*-
require File.expand_path('../lib/notams/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Svilen Vassilev"]
  gem.email         = ["svilen@rubystudio.net"]
  gem.description   = %q{Retrieves the currently active NOTAMs for an airport or a region. Supports multiple airports/regions in one request. Pulls data from FAA website.}
  gem.summary       = %q{Retrieves the currently active NOTAMs for an airport or a region}
  gem.homepage      = "https://github.com/tarakanbg/notams"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "notams"
  gem.require_paths = ["lib"]
  gem.version       = Notams::VERSION

  gem.add_development_dependency "rspec"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "libnotify"
  gem.add_development_dependency "guard-rspec"
  gem.add_dependency "nokogiri", "~> 1.5.5"

end
