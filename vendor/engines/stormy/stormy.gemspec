$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stormy/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stormy"
  s.version     = Stormy::VERSION
  s.authors     = ["Pascal Rettig"]
  s.email       = ["pascal@cykod.com"]
  s.homepage    = "http://github.com/cykod/stormy"
  s.summary     = "Minimal Blog/CMS Engine"
  s.description = "Minimal Blog/CMS Engine"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0.beta"
  s.add_dependency "haml", ">= 3.1.7"
  s.add_dependency "mongoid", ">= 3.0.0" 
  s.add_dependency "mongoid-paperclip"
  s.add_dependency "redcarpet"
  s.add_dependency "i18n"

  # s.add_dependency "jquery-rails"

end
