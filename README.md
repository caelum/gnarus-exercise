GnarusExercise
==============

This project rocks and uses MIT-LICENSE.

Configuring a new project without user ownership
================================================

rails new my_exercise
cd my_exercise
echo "gem 'gnarus_exercise'" >> Gemfile
bundle install
rake gnarus_exercise:install:migrations
rake db:create db:migrate
mkdir app/views/gnarus_exercise
mkdir app/views/gnarus_exercise/attempts
echo "Your exercise here" >> app/views/gnarus_exercise/attempts/index.html.erb
rm public/index.html

Adding user ownership
=====================

echo "gem 'devise'" >> Gemfile
bundle install
rails g devise:install
rails g devise User
rake gnarus_exercise:install:migrations
rake db:create db:migrate

Add your routes
===============

mount GnarusExercise::Engine => "/", :as => :gnarus

root :to => "GnarusExercise::Exercises#index"


TODO
====

- regenerate the gem (the current one is outdated by the actual code status)
- extract a rails template
- update method UPDATE from exercise to be safe
- exercisecontroller entire code should work with/without devise
- no need to override gnarusexercises:exercise would be lovely
- eval solution?

