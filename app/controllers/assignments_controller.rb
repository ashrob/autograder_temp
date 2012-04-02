class AssignmentsController < ApplicationController

  respond_to :json, :xml
  
  #for debugging, no spec needed
  def show
    @assignment = Assignment.find_by_id(params[:id])
  end
  
  
  def create 
    @assignment = Assignment.create!(:prof_key => params[:prof_key], :due_date => params[:due_date])
    if(params[:student_keys] != nil)
       student_keys = params[:student_keys][1..-2].split(',').each{|e| e.strip!}
       #student_keys.each {|std_key| @assignment.students += [Student.create!(:student_key => std_key)]}
       @assignment.add_student_keys(student_keys)
    end
    @assignment.save!()
  end
  
  
  def add_student_keys
    @assignment = Assignment.find_by_id(params[:id])
    if(params[:student_keys] != nil)
       @student_keys = params[:student_keys][1..-2].split(',').each{|e| e.strip!}
       @assignment.add_student_keys(@student_keys)
    end
    @assignment.save!()
  end
  
  def remove_student_keys
    @assignment = Assignment.find_by_id(params[:id])

    if(params[:student_keys] != nil)
       @student_keys = params[:student_keys][1..-2].split(',').each{|e| e.strip!}
       @assignment.remove_student_keys(@student_keys)
    end

    @assignment.save!()
  end
  
  def change_due_date
    @assignment = Assignment.find_by_id(params[:id])
    if(params[:due_date] != nil)
      @assignment.change_due_date(params[:due_date])
      
    end 
    @assignment.save!() 
  end
  
  def submit
    @assignment = Assignment.find_by_id(params[:id])
    if(@assignment.students.any? {|std| std.student_key == params[:student_keys]})
      @student = @assignment.students.find_by_student_key(params[:student_keys])
      @student.add_submission(params[:submission])
      render :submit_successful 
    else
      render :submit_fail
    end
  end
  
  
  def find_by_list_of_keys
    @assignment = Assignment.find_by_id(params[:id])
    @submissoin = @assignment.find_by_keys(params[:student_keys])
   
  end
  
  def find_by_grading
    @assignment = Assignment.find_by_id(params[:id])
    @submission = @assignment.find_by_status(params[:status])
  end
  
  
end
