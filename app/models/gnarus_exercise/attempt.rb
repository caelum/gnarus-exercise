module GnarusExercise
  class Attempt < ActiveRecord::Base
    belongs_to :exercise
    has_many :executions
    attr_accessible :return_uri, :author_id

    def full_return_uri
       (return_uri || "") + "?answer=" + (solution || "")
    end
    
    def process(params)
      executions.create :solution => params[:solution], :suceeded => params[:suceeded]
    end
    
  end
end
