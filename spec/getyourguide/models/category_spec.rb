require 'spec_helper'

describe GetYourGuide::Models::Category do
  subject(:category) {
    GetYourGuide::Models::Category.new(
      provider_id: 1,
      name: 'Name'
    )
  }

  it 'should be a GetYourGuide::Models::Category object' do
    expect(category).to be_an_instance_of(GetYourGuide::Models::Category)
  end

  it 'should have a provider_id' do
    expect(category.provider_id).to eq(1)
    expect(category.provider_id).to be_an_instance_of(Fixnum)
  end

  it 'should have a name' do
    expect(category.name).to eq('Name')
    expect(category.name).to be_an_instance_of(String)
  end
end
