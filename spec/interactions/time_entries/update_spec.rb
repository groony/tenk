require 'rails_helper'

describe TimeEntries::Update do
  let(:time_entry) { FactoryGirl.create(:time_entry) }
  let(:hours) { 10 }
  let(:params) { { time_entry: time_entry, scheduled_time: hours } }
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
  it 'should change estimate_hours' do
    expect(outcome.result.estimate_hours).to eq(hours)
  end
end
