module GnarusActivity
  class ExecutionsController < ApplicationController
  
    skip_before_filter :verify_authenticity_token

    def create
      @attempt = Attempt.find params[:attempt_id]
      execution = ::ActivityProcessor.process @attempt, params
      execution.save
      render :json => execution.to_json(:includes => :attempt)
    end

  end
end
