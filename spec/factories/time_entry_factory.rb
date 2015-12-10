# == Schema Information
#
# Table name: time_entries
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  project_id     :integer
#  spent_hours    :float
#  estimate_hours :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

FactoryGirl.define do
  factory :time_entry do
    project
    user
    spent_hours 0
    estimate_hours 0
  end
end
