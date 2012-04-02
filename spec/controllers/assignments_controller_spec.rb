require 'spec_helper'

describe AssignmentsController do
  #render_views

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
  

  
end

