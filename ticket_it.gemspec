$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ticket_it/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ticket_it"
  s.version     = TicketIt::VERSION
  s.authors     = ["Dhairya Gabhawala"]
  s.email       = ["gabhawaladhairya@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TicketIt."
  s.description = "TODO: Description of TicketIt."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"

  s.add_development_dependency "pg"
end
