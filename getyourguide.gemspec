# coding: utf-8
require File.expand_path('../lib/getyourguide/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name                   = 'getyourguide'
  spec.version                = GetYourGuide::VERSION
  spec.authors                = ['Rémi Delhaye', 'Maxime Raverdy']
  spec.email                  = ['remi@libertrip.com', 'maxime@libertrip.com']
  spec.summary                = 'A simple ruby on rails client for GetYourGuide partner XML API'
  spec.description            = 'A simple ruby client for GetYourGuide partner XML API'
  spec.homepage               = 'https://github.com/Libertrip/getyourguide'
  spec.license                = 'MIT'
  spec.required_ruby_version  = '~> 2.0'
  spec.post_install_message   = 'Thanks for installing!\n\nOfficial GetYourGuide documentation can be found here: https://partner.getyourguide.com/en/solutions.php#links-xml'

  spec.files                  = `git ls-files -z`.split("\x0")
  spec.executables            = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files             = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths          = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'nokogiri', '~> 1.5', '>= 1.5.0'
  spec.add_runtime_dependency 'httpclient', '~> 2.3', '>= 2.3.1'
end
