$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fonzo"
  s.version     = "0.0.1"
  s.authors     = ["Onur Uyar"]
  s.email       = ["me@onuruyar.com"]
  s.homepage    = "http://github.com/lemmycaution/fonzo"
  s.summary     = "Router gem for Rails 3.0 Facebook Apps"
  s.description = "Router gem for Rails 3.0 Facebook Apps"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"  
  s.add_dependency 'koala', "~> 1.2"

end
