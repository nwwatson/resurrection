$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "resurrection/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "resurrection"
  s.version     = Resurrection::VERSION
  s.authors     = ["Nicholas Watson"]
  s.email       = ["nicholas.w.watson@icloud.com"]
  s.homepage    = "https://github.com/nwwatson/resurrection"
  s.summary     = "Resurrect models from the dead with ease"
  s.description = "A concern for models that follow ActiveModel::Model providing soft delete functionality"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "> 4.0"

  s.add_development_dependency 'rspec-rails', '~> 3.2.0'
  s.add_development_dependency 'rspec-its', '~> 1.1.0'
  s.add_development_dependency 'shoulda-matchers', '~> 2.8.0'
  s.add_development_dependency 'database_cleaner', '~> 1.4.0'
  s.add_development_dependency 'guard-rspec', '~> 4.5.0'
end
