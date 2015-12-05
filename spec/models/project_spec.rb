require 'rails_helper'

describe Project do
  it { should have_many(:users) }
  it { should have_many(:projects_users) }
  it { should validate_presence_of(:name) }
end
