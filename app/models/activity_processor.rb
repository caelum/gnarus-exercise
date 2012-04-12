class ActivityProcessor
  def self.process(attempt, params)
    attempt.executions.create :solution => params[:solution], :suceeded => true
  end
end
