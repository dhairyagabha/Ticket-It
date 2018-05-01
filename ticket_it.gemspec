$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ticket_it/version"
# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ticket_it"
  s.version     = TicketIt::VERSION
  s.authors     = ["Dhairya Gabhawala"]
  s.email       = ["gabhawaladhairya@gmail.com"]
  s.homepage    = "https://ticketit-sample.herokuapp.com"
  s.summary     = "TicketIt is an open source rails mountable engine to make ticketing system integration easy and customizable."
  s.description = "Description of TicketIt."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"
  s.add_dependency "turbolinks", "~> 5.0.0"
  s.add_dependency "paperclip", "~> 6.0.0"
  s.add_development_dependency "pg"
end
