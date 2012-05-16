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
create_file("app/views/gnarus_exercise/attempts/index.html.erb") do
  %Q(<span><%= @attempt.exercise.title %></span><br />

<form id="exercise" method="POST" action="<%= exercise_attempt_executions_url(@attempt.exercise, @attempt)%>">
	<input name="solution" id="solution" value="" />
	<input type="button" id="try" value="Verificar">
	<input type="button" id="skip" value="Ignorar e continuar">
</form>

<div id="result"></div>

<script>
$(function() {
	var form = gnarus.attemptForm(extractSolution, showToUser, '<%=@attempt.return_uri%>');
	form.setup();
	$('#skip').click(form.skip);
});

function showToUser(r) {
  successMessage = "sucesso"
  errorMessage = "no no"
	$('#result').html(r.suceeded ? successMessage : errorMessage);
}

function extractSolution() {
	return {solution : $('#solution').val()};
}
</script>)
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
