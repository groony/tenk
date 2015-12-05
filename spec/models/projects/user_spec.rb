require 'rails_helper'

describe Projects::User do
  it { should belong_to(:project) }
  it { should validate_presence_of(:project) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:user) }
  it do
    FactoryGirl.create(:projects_user)
    should validate_uniqueness_of(:user_id).scoped_to(:project_id)
  end
end
