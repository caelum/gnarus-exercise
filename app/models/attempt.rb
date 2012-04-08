module GnarusExercise
  class Attempt < ActiveRecord::Base
    def process(params)
      puts "default process in place"
      executions.create :solution => params[:path], :suceeded => true
    end
  end
end
