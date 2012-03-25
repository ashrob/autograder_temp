class Student < ActiveRecord::Base

  belongs_to :assignment 
  has_many   :submissions 
  
  def add_submission(submission)
    self.submissions << Submission.create(:body => submission)
  end
  
end
