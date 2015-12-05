require 'rails_helper'

describe TimeEntry do
  it { should belong_to(:users) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:project) }
  it { should validate_presence_of(:spent_hours) }
  it { should validate_presence_of(:estimate_hours) }
end
