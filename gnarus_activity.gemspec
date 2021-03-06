$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gnarus_activity/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gnarus_activity"
  s.version     = GnarusActivity::VERSION
  s.authors     = ["Guilherme Silveira", "Ricardo Valeriano"]
  s.email       = ["guilherme.silveira@caelum.com.br", "ricardo.valeriano@gmail.com"]
  s.homepage    = "http://online.caelum.com.br"
  s.summary     = "A plugin structure for external exercises."
  s.description = "Create external exercises by mounting this plugin."

  s.files = Dir["{app,config,db,lib,bin}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.3"

  s.add_development_dependency "sqlite3"

  s.executables << "gnarus"
end
