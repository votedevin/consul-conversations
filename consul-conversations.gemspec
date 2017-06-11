$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "consul/conversations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "consul-conversations"
  s.version     = Consul::Conversations::VERSION
  s.authors     = ["Semyon Pupkov"]
  s.email       = ["mail@semyonpupkov.com"]
  s.homepage    = "https://github.com/votedevin/consul-conversations"
  s.summary     = "Conversations for consul app based on pol.is app."
  s.description = s.summary
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0"
  s.add_dependency "cancancan"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "combustion"
end
