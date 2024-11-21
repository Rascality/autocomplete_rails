$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'rs_autocomplete_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'rs_autocomplete_rails'
  s.version     = RsAutocompleteRails::VERSION
  s.authors     = ['Justin Tomich', 'David Sowry']
  s.email       = ['justin@tomich.org', 'sowry@rascality.nz']
  s.homepage    = 'https://github.com/Rascality/autocomplete_rails'
  s.summary     = "Fork of autocomplete_rails with addded rails 6+ support."
  s.description = "Fork of autocomplete_rails with addded rails 6+ support."
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '>= 4.0', '< 9'

  s.add_development_dependency 'factory_bot', '~> 4.10.0', '>= 4.10.0'
  s.add_development_dependency 'rspec-rails', '~> 3.1'
  s.add_development_dependency 'rspec-mocks', '~> 3.1'
  s.add_development_dependency 'shoulda-matchers', '~> 2.8'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'appraisal'
end
