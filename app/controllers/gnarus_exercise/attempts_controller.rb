module GnarusExercise
class AttemptsController < ApplicationController
  
  skip_before_filter :verify_authenticity_token

  def update
    @attempt = Attempt.find(params[:id])
    if(@attempt.not_finished)
      @attempt.update_attributes(:solution => params[:path])
    end
    redirect_to @attempt.full_return_uri
  end

  def index
    exercise = Exercise.find(params[:exercise_id])
    @attempt = exercise.attempts.create(params[:attempt])
    @attempt.save
  end

end
end