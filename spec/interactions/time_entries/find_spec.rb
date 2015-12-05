require 'rails_helper'

describe TimeEntries::Find do
  let(:time_entry) { FactoryGirl.create(:time_entry) }
  let(:params) { { id: time_entry.id } }
  subject(:outcome) do
    described_class.run params
  end

  it 'should be present' do
    expect(outcome.present?).to be(true)
  end
  it 'should be valid' do
    expect(outcome.valid?).to be(true)
  end
  it 'should return TimeEntry' do
    expect(outcome.result).to be_a(TimeEntry)
  end
end
