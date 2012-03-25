object @assignment

attributes :prof_key, :due_date

child :students do
  attributes :std_key
end
