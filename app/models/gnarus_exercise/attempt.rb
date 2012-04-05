module GnarusExercise
  class Attempt < ActiveRecord::Base
    belongs_to :exercise
    attr_accessible :return_uri, :solution

    def not_finished
      solution.nil?
    end
    def full_return_uri
       (return_uri || "") + "?answer=" + (solution || "")
    end
  end
end
