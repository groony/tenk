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
    belongs_to :project, required: true
    belongs_to :user, required: true, class_name: ::User
    validates :user_id, uniqueness: { scope: :project_id }
  end
end
