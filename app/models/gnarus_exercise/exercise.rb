module GnarusExercise
  class Exercise < ActiveRecord::Base
    attr_accessible :author_id, :content
    has_many :attempts
    belongs_to :author, :class_name => User if defined?(User)
  end
end
