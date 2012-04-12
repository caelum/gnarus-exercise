GnarusExercise
==============

This project rocks and uses MIT-LICENSE.

Configuring a new project
=========================

```
rails new my_exercise -m https://raw.github.com/caelum/gnarus-exercise/master/template.rb
```

You will be prompted about adding <code>devise</code> into your application, then it is up
to you accept or not (if you want to auth your exercises). The template will handle all configuration required for you.


TODO
====

- update method UPDATE from exercise to be safe
- rename to gnarus-exercise
- we are using the index file to show an attempt, nasty. a GET to a better named method
- an easier way to override the processing of an answer instead of rewriting attemp.rb (require 'attempt.rb' in random places is nasty)
