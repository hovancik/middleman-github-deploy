require 'English'
Gem::Specification.new do |s|
  s.required_ruby_version = '>= 2.5.0'
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
  s.add_runtime_dependency 'optimist', '~> 3.0', '>= 3.0.1'
  s.add_runtime_dependency 'middleman', '~> 4.4'
  s.add_runtime_dependency 'middleman-autoprefixer', '~> 2.7'
  s.add_development_dependency 'rdoc', '~> 6.5'
  s.add_development_dependency 'execjs', '2.7'
  s.add_development_dependency 'minitest', '~> 5.18'
end
