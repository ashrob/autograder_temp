class Student < ActiveRecord::Base

  belongs_to :assignment 
  has_many   :submissions 
  
  def add_submission(submission)
    submission = Submission.create(:body => submission)
    self.submissions << submission
    submission.save!
    self.save!
  end
  
  def find_by_student_keys(student_keys)
  end
  
end
