module GnarusExercise
  class AttemptsController < ApplicationController
  
    skip_before_filter :verify_authenticity_token

    def index
      exercise = Exercise.find(params[:exercise_id])
      @attempt = exercise.attempts.create(params[:attempt])
      @attempt.save
    end

  end
end