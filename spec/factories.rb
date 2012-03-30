# coding: utf-8

FactoryGirl.define do 
  factory :assignment do 
    due_date Time.now
    prof_key 'professor_a'
    created_at Time.now
  end
end

def some_assignment
  Assignment.find(:first) || Factory(:assignment)
end
