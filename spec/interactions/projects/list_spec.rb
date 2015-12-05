require 'rails_helper'

describe Projects::List do
  before do
    FactoryGirl.create(:project)
  end

  let(:params) { { page: 1 } }

  subject(:outcome) do
    described_class.run params
  end

  it 'should be present' do
    expect(outcome.present?).to be(true)
  end
  it 'should be valid' do
    expect(outcome.valid?).to be(true)
  end
  it 'should return Relation' do
    expect(outcome.result).to have_at_least(1).items
  end
end
