module GnarusExercise
  class StatusController < ApplicationController
  
    skip_before_filter :verify_authenticity_token

    def ping
      render :json => {:status => "alive"}
    end

  end
end