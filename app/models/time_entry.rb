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

class TimeEntry < ActiveRecord::Base
  belongs_to :user, required: true
  belongs_to :project, required: true
  validates :spent_hours, presence: true
end
