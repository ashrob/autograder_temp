require 'spec_helper'

describe AssignmentsController do
  #render_views
  
  describe "check keys" do
    it 'should check if it is a student key' do
    end
    
    it 'should check if it is a professor key' do
    end
  end

  describe "Create an Assignment with an Autograder" do
    before(:each) do
      @fake_assignment = mock(:assignment)
    end
    it 'should create an Assignment instance with the given parameters' do
      Assignment.should_receive(:create!).with(:prof_key => "prof_key", :due_date => "due_date").and_return(@fake_assignment)
      @fake_assignment.should_receive(:add_student_keys).with(["s_key1", "s_key2"])
      @fake_assignment.should_receive(:save!)
      post :create, {:prof_key => "prof_key", :due_date => "due_date", :student_keys => "[s_key1, s_key2]"}
    end
  end
  
  describe "Addition of student keys per assignment" do
    before(:each) do
      @fake_assignment = mock(:assignment)
    end
    it 'should find an assignment by id' do
      Assignment.should_receive(:find_by_id).with("id").and_return(@fake_assignment)
      @fake_assignment.stub(:add_student_keys).with(["s_key1", "s_key2"])
      @fake_assignment.stub(:save!)
      put :add_student_keys, {:id => "id", :student_keys => "[s_key1, s_key2]"}
    end
      
    it 'should add a student-keys' do
      Assignment.stub(:find_by_id).and_return(@fake_assignment)
      @fake_assignment.should_receive(:add_student_keys).with(["s_key1", "s_key2"])
      @fake_assignment.should_receive(:save!)
      put :add_student_keys, {:id => "id", :student_keys => "[s_key1, s_key2]"}
    end 
  end
  
  describe "Deletion of student keys per assignment" do
    before(:each) do
      @fake_assignment = mock(:assignment)
    end
    it 'should find an assignment by id' do
      Assignment.should_receive(:find_by_id).with("id").and_return(@fake_assignment)
      @fake_assignment.stub(:remove_student_keys).with(["s_key1", "s_key2"])
      @fake_assignment.stub(:save!)
      put :remove_student_keys, {:id => "id", :student_keys => "[s_key1, s_key2]"}
    end
      
    it 'should delete a student-keys' do 
      Assignment.stub(:find_by_id).and_return(@fake_assignment)
      @fake_assignment.should_receive(:remove_student_keys).with(["s_key1", "s_key2"])
      @fake_assignment.should_receive(:save!)
      put :remove_student_keys, {:id => "id", :student_keys => "[s_key1, s_key2]"}
    end 
  end
  
  
  describe "Retrive a list of submissions by grading-status and student-key per assignemnt" do 
    before(:each) do
       @fake_assignment = mock(:assignment)
       @fake_submission = [mock('submission1'), mock('submission2')] 
    end
    
    it 'should return a list of submission with the given student-keys' do
       Assignment.stub(:find_by_id).and_return(@fake_assignment)
       @fake_assignment.stub(:find_by_keys).with(["s_key1", "s_key2"]).and_return(@fake_submissions)
       get :find_by_list_of_keys, {:id => "id", :student_keys => "[s_key1, s_key2]"} 
    end
    
    it 'should return a list of submission with the given grading-status' do
      Assignment.stub(:find_by_id).and_return(@fake_assignment)
      @fake_assignment.stub(:find_by_status).with(["A", "B"]).and_return(@fake_submissions)
      get :find_by_grading, {:id => "id", :status => ["A", "B"]} 
    end 
  end
  

  describe "Change due date for assignment" do
    before(:each) do
      @fake_assignment = mock(:assignment)
    end
    it 'should find an assignment and change due date' do
      Assignment.should_receive(:find_by_id).with("id").and_return(@fake_assignment)
      @fake_assignment.stub(:change_due_date).with("04/18/2012")
      @fake_assignment.stub(:save!)
      put :change_due_date, {:id => "id", :due_date=> "04/18/2012", :student_keys => "[s_key1, s_key2]"}
    end
  
  end
  

  describe "Submission for an assignment via a unique key per group/student" do 
    before(:each) do	
    	@fake_assignment = mock(:assignment)
    	@fake_student = mock(:student)
    	@fake_student_list = mock(:student_list)
	    @fake_submission = mock(:submission1)
	    
    end
    
    it 'should make a successful submission with a student key' do
      Assignment.should_receive(:find_by_id).with("id").and_return(@fake_assignment)
      @fake_assignment.stub(:students).and_return(@fake_student_list)
      @fake_student_list.stub(:any?).and_return(true)
      @fake_student_list.stub(:find_by_student_key).with("s_key1").and_return(@fake_student)
      @fake_student.stub(:add_submission).with("submission")
      put :submit, {:id => "id", :student_key => "s_key1", :submission => "submission"}
    end
   
  end

end

