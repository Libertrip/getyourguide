require 'spec_helper'

describe GetYourGuide::Models::Activity do
  subject(:category) {
    GetYourGuide::Models::Category.new(
      provider_id: 1,
      name: 'Name'
    )
  }
  subject(:location) {
    GetYourGuide::Models::Location.new(
      provider_id: 1,
      name: 'Name',
      country: 'Country',
      start_location: false
    )
  }
  subject(:image) {
    GetYourGuide::Models::Image.new(
      url: 'https://assets-cdn.github.com/images/modules/open_graph/github-mark.png',
      ssl: true
    )
  }
  subject(:activity) {
    GetYourGuide::Models::Activity.new(
      provider_id: 1,
      title: 'Title',
      abstract: 'Abstract description',
      categories: [category],
      locations: [location],
      starting_point: true,
      indivative_price: 100.50,
      rating: 4.5,
      pictures: [image]
    )
  }

  it 'should be a GetYourGuide::Models::Activity object' do
    expect(activity).to be_an_instance_of(GetYourGuide::Models::Activity)
  end

  it 'should have a provider_id' do
    expect(activity.provider_id).to eq(1)
    expect(activity.provider_id).to be_an_instance_of(Fixnum)
  end

  it 'should have a title' do
    expect(activity.title).to eq('Title')
    expect(activity.title).to be_an_instance_of(String)
  end

  it 'should have a abstract description' do
    expect(activity.abstract).to eq('Abstract description')
    expect(activity.abstract).to be_an_instance_of(String)
  end

  it 'should have a Boolean starting_point' do
    expect(activity.starting_point).to eq(true).or eq(false)
  end

  it 'should have a Float indivative_price' do
    expect(activity.indivative_price).to be_an_instance_of(Float)
  end

  it 'should have a Float rating' do
    expect(activity.rating).to be_an_instance_of(Float)
  end

  it 'should have an Array[GetYourGuide::Models::Category] as categories' do
    expect(activity.categories).to be_an_instance_of(Array)
    expect(activity.categories.first).to be_an_instance_of(GetYourGuide::Models::Category)
  end

  it 'should have an Array[GetYourGuide::Models::Location] as locations' do
    expect(activity.locations).to be_an_instance_of(Array)
    expect(activity.locations.first).to be_an_instance_of(GetYourGuide::Models::Location)
  end

  it 'should have an Array[GetYourGuide::Models::Image] as pictures' do
    expect(activity.pictures).to be_an_instance_of(Array)
    expect(activity.pictures.first).to be_an_instance_of(GetYourGuide::Models::Image)
  end
end
