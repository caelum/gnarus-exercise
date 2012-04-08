module GnarusExercise
  class ExecutionsController < ApplicationController
  
    skip_before_filter :verify_authenticity_token

    def create
      @attempt = Attempt.find params[:attempt_id]
      require 'attempt'
      execution = @attempt.process params
      execution.save
      render :json => execution.to_json(:includes => :attempt)
    end

  end
end