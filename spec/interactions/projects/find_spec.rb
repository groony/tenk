require 'rails_helper'

describe Projects::Find do
  let(:project) { FactoryGirl.create(:project) }
  let(:params) { { id: project.id } }
  subject(:outcome) do
    described_class.run params
  end

  it 'should be present' do
    expect(outcome.present?).to be(true)
  end
  it 'should be valid' do
    expect(outcome.valid?).to be(true)
  end
  it 'should return Project' do
    expect(outcome.result).to be_a(Project)
  end
end
