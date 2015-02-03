require 'spec_helper'

describe GetYourGuide::Models::TopCategory do
  subject(:top_category) {
    GetYourGuide::Models::TopCategory.new(
      provider_id: 1,
      name: 'Name',
      link: 'Link',
      picture: 'Picture',
      rating: 'Rating'
    )
  }

  it 'should be a GetYourGuide::Models::TopCategory object' do
    expect(top_category).to be_an_instance_of(GetYourGuide::Models::TopCategory)
  end

  it 'should have a provider_id' do
    expect(top_category.provider_id).to eq(1)
    expect(top_category.provider_id).to be_an_instance_of(Fixnum)
  end

  it 'should have a name' do
    expect(top_category.name).to eq('Name')
    expect(top_category.name).to be_an_instance_of(String)
  end

  it 'should have a link' do
    expect(top_category.link).to eq('Link')
    expect(top_category.link).to be_an_instance_of(String)
  end

  it 'should have a picture' do
    expect(top_category.picture).to eq('Picture')
    expect(top_category.picture).to be_an_instance_of(String)
  end

  it 'should have a rating' do
    expect(top_category.rating).to eq('Rating')
    expect(top_category.rating).to be_an_instance_of(String)
  end
end
