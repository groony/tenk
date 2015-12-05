# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_many :projects_users, class_name: Projects::User
  has_many :projects, through: :projects_users
  has_many :time_entries
  validates :first_name, presence: true
  validates :last_name, presence: true
end
