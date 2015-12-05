require 'rails_helper'

describe User do
  it { should have_many(:projects_users) }
  it { should have_many(:projects) }
  it { should have_many(:time_entries) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end
