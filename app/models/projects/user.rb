# == Schema Information
#
# Table name: projects_users
#
#  id         :integer          not null, primary key
#  project_id :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module Projects
  class User < ActiveRecord::Base
    belongs_to :project
    belongs_to :user
    validates :user, presence: true
    validates :project, presence: true
    validates :user_id, uniqueness: { scope: :project_id }
  end
end
