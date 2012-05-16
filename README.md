GnarusExercise
==============

This project rocks and uses MIT-LICENSE. Install

```
gem install gnarus_exercise
```

Configuring a new project
=========================

```
gnarus_activity my_exercise
```

You will be prompted about adding <code>devise</code> into your application, then it is up
to you accept it (if you want authentication in your exercises) or not.


TODO
====

- update method UPDATE from exercise to be safe
- rename to gnarus-exercise
- we are using the index file to show an attempt, nasty. a GET to a better named method
- automatic reload from ActivityProcessor
- includes a javascript with a *gnarus* object and, if a attemptForm function not
  exists, provide one which will be enough for testing purpouses.
