# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "faps"
  s.version     = '0.0.1'
  s.authors     = ["Onur Uyar"]
  s.email       = ["me@onuruyar.com"]
  s.homepage    = "http://github.com/lemmycaution/fonzo"
  s.summary     = "Router for Facebook Tab/Canvas Apps"
  s.description = "Router for Facebook Tab/Canvas Apps"

  s.files = Dir["{config,lib}/**/*"] + ["MIT-LICENSE", "README.rdoc"]

  s.add_dependency "koala", "~> 1.2"
end