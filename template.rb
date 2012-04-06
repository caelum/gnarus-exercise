# clean up rails defaults
remove_file 'public/index.html'
remove_file 'public/images/rails.png'
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
#empty_directory "app/views/gnarus_exercise/attempts"
#run "mkdir -p app/views/gnarus_exercise/attempts"
create_file("app/views/gnarus_exercise/attempts/index.html.erb") do
  "<strong>Your exercise here</strong>"
end

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
