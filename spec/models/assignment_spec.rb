require 'spec_helper'

describe Assignment do
  pending "add some examples to (or delete) #{__FILE__}"
  
  describe "add student keys to the assignment" do
    before :each do 
      @assignment = Factory(:assignment)

    end
    it "should create student for each key passed to it in a list" do
      Student.should_receive(:create).with("s_key1")
      Student.should_receive(:create).with("s_key2")
      @assignment.add_student_keys(["s_key1", "s_key2"])
    end
    
    it "should remove a student for each key passed to it in a list" do
      Student.should_receive(:destroy).with("s_key1")
      Student.should_receive(:destroy).with("s_key2")
      @assignment.remove_student_keys(["s_key1", "s_key2"])
    end
    
    it "should change the due date with the new date enter" do
    end
    
    it "should grade each submission submitted by student" do
    end
    
    it "should add the professor solution" do
    end
     
  
end

