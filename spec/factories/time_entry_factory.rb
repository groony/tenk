FactoryGirl.define do
  factory :time_entry do
    project
    user
    spent_hours 0
    estimate_hours 0
  end
end
