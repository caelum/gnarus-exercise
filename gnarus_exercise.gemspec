$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "gnarus_exercise/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "gnarus_exercise"
  s.version     = GnarusExercise::VERSION
  s.authors     = ["Guilherme Silveira"]
  s.email       = ["guilherme.silveira@caelum.com.br"]
  s.homepage    = "http://online.caelum.com.br"
  s.summary     = "A plugin structure for external exercises."
  s.description = "Create external exercises by mounting this plugin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.2"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
