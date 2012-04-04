collection @submissions 

attributes :student, :body

child @submissions.students
  attributes :student_key
  
