require 'rails_helper'

describe TimeEntry do
  it { should belong_to(:user) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:spent_hours) }
  it do
    FactoryGirl.create(:time_entry)
    should validate_uniqueness_of(:user_id).scoped_to(:project_id)
  end
end
