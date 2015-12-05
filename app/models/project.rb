# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Project < ActiveRecord::Base
  has_many :projects_users, class_name: Projects::User
  has_many :users, through: :projects_users
  validates :name, presence: true
end
