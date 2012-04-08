module GnarusExercise
  class Execution < ActiveRecord::Base
    attr_accessible :attempt, :solution, :suceeded
    belongs_to :attempt
  end
end
