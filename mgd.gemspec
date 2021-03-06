# coding: utf-8
require 'English'
Gem::Specification.new do |s|
  s.required_ruby_version = '>= 2.0.0'
  s.name = 'mgd'
  s.version = '0.2.0'
  s.license = 'MIT'
  s.summary = 'Middleman Github Deploy'
  s.description = 'Automated deployment of your Middleman blog to Github Pages'
  s.author = 'Jan Hovancik'
  s.email = 'conta.srdr@gmail.com'
  s.homepage = 'http://github.com/hovancik/middleman-github-deploy'
  s.files = `git ls-files`.split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files = s.files.grep(%r{/^(test|spec|features)\/})
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  s.add_runtime_dependency('trollop', '2.1.2')
  s.add_runtime_dependency('middleman', '>= 3.0.0')
  s.add_development_dependency 'rdoc', '4.2.2'
  s.add_development_dependency 'minitest', '5.8.4'
  s.add_development_dependency 'rubocop', '0.39.0'
  s.add_development_dependency 'rubocop-rspec', '1.4.1'
end
