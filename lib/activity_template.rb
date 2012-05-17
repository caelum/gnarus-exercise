# clean up rails defaults
remove_file 'public/index.html'
remove_file 'public/images/rails.png'
remove_file 'README.rdoc'
run 'cp config/database.yml config/database.example'
append_file ".gitignore", "config/database.yml"

# gems
gem "gnarus_exercise"

if yes?("Do you want we configure devise for you?")
  gem "devise"
  @devised = true
end

puts "installing gems..."
run "bundle install"

rake "gnarus_exercise:install:migrations", :env => "development"

def copy_template(name)
  origin = File.expand_path("../lib/gnarus_exercise/" + name, __FILE__)
  target = "app/views/gnarus_exercise/" + name
  copy_file origin, target
end

copy_template "attempts/index.html.erb"

if @devised
  puts "generating devise"
  generate "devise:install"
  generate "devise User"
  rake "gnarus_exercise:install:migrations", :env => "development"
end

rake "db:create", :env => "development"
rake "db:migrate", :env => "development"

inject_into_file "config/routes.rb", :before => "\nend" do
"

  mount GnarusExercise::Engine => \"/\", :as => :gnarus
  root :to => \"GnarusExercise::Exercises#index\"

"
end
