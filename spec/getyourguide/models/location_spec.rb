require 'spec_helper'

describe GetYourGuide::Models::Location do
  subject(:location) {
    GetYourGuide::Models::Location.new(
      provider_id: 1,
      name: 'Name',
      country: 'Country',
      start_location: true
    )
  }

  it 'should be a GetYourGuide::Models::Location object' do
    expect(location).to be_an_instance_of(GetYourGuide::Models::Location)
  end

  it 'should have a provider_id' do
    expect(location.provider_id).to eq(1)
    expect(location.provider_id).to be_an_instance_of(Fixnum)
  end

  it 'should have a name' do
    expect(location.name).to eq('Name')
    expect(location.name).to be_an_instance_of(String)
  end

  it 'should have a country' do
    expect(location.country).to eq('Country')
    expect(location.country).to be_an_instance_of(String)
  end

  it 'should have a start_location' do
    expect(location.start_location).to eq(true).or eq(false)
  end
end
