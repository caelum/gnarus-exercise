GnarusActivity
==============

This project rocks and uses MIT-LICENSE. Install

```
gem install gnarus_activity
```

Configuring a new project
=========================

```
gnarus activity my_project
```

You will be prompted about adding <code>devise</code> into your application, then it is up
to you accept it (if you want authentication in your exercises) or not.

Default execution
=================

The default index.html.erb displays a solution field where the user types his response.

Due to the invocation of:

```javascript
gnarus.attemptForm({ solution : function() {},
					 callback : function(result) {},
					 gnarusUri : '',
					 allowsSkip : true }).setup();
```

When clicking in the try button, the solution function is invoked. It should return
the response to send to the rails server for processing.

### Processing the user response

The method <code>ActivityProcessor#process(attempt, params)</code> is invoked.
It should return an Execution with the field succeded=true or false.
Example:

```ruby
class ActivityProcessor
  def self.process(attempt, params)
	isCorrect = params[:solution]=="42"
    attempt.executions.create (
      solution: params[:solution],
      suceeded: isCorrect
	  )
  end
end
```

The default implementation of this method *always* return suceeded = true.

### Showing the response to the user

After processing, the callback is invoked with the result.succeeded.

(1) If it is false, you should display an error message.
(2) If it is true, display what you want. In this case, the page will be AUTOMATICALLY
redirected to the gnarusUri. The exercise finishes


TODO
====

- Ensure that sqlite3 gem is only required on dev and test (heroku doesn't like it)
- the SOLUTION member should be renamed to something more meaningful (response)
- generated template should add gnarus_activity version to gemfile
- update method UPDATE from exercise to be safe
- we are using the index file to show an attempt, nasty. a GET to a better named method
- automatic reload from ActivityProcessor
