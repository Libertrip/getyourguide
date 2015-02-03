require 'spec_helper'

describe GetYourGuide::Models::Destination do
  subject(:destination) {
    GetYourGuide::Models::Destination.new(
      provider_id: 1,
      name: 'Name',
      country: 'Country',
      unlocode: 'FR',
      iata: 'EUR',
      destination_type: 'Destination Type'
    )
  }
  subject(:destination_with_nil_attributes) {
    GetYourGuide::Models::Destination.new(
      provider_id: 1,
      name: 'Name',
      country: 'Country',
      unlocode: nil,
      iata: nil,
      destination_type: 'Destination Type'
    )
  }

  it 'should be a GetYourGuide::Models::Destination object' do
    expect(destination).to be_an_instance_of(GetYourGuide::Models::Destination)
  end

  it 'should have a provider_id' do
    expect(destination.provider_id).to eq(1)
    expect(destination.provider_id).to be_an_instance_of(Fixnum)
  end

  it 'should have a name' do
    expect(destination.name).to eq('Name')
    expect(destination.name).to be_an_instance_of(String)
  end

  it 'should have a country' do
    expect(destination.country).to eq('Country')
    expect(destination.country).to be_an_instance_of(String)
  end

  context 'WITH iata and un/locode' do
    it 'should have a not null iata' do
      expect(destination.iata).to eq('EUR')
      expect(destination.iata).to be_an_instance_of(String)
    end

    it 'should have a not null un/locode' do
      expect(destination.unlocode).to eq('FR')
      expect(destination.unlocode).to be_an_instance_of(String)
    end
  end

  context 'WITHOUT iata and un/locode' do
    it 'should have a null iata' do
      expect(destination_with_nil_attributes.iata).to be_nil
    end

    it 'should have a null un/locode' do
      expect(destination_with_nil_attributes.unlocode).to be_nil
    end
  end

  it 'should have a destination_type' do
    expect(destination.destination_type).to eq('Destination Type')
    expect(destination.destination_type).to be_an_instance_of(String)
  end
end
