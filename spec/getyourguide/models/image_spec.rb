require 'spec_helper'

describe GetYourGuide::Models::Image do
  subject(:image) {
    GetYourGuide::Models::Image.new(
      url: 'https://assets-cdn.github.com/images/modules/open_graph/github-mark.png',
      ssl: true
    )
  }

  it 'should be a GetYourGuide::Models::Image object' do
    expect(image).to be_an_instance_of(GetYourGuide::Models::Image)
  end

  it 'should have a String url' do
    expect(image.url).to eq('https://assets-cdn.github.com/images/modules/open_graph/github-mark.png')
    expect(image.url).to be_an_instance_of(String)
  end

  it 'should have a Boolean ssl' do
    expect(image.ssl).to eq(true).or eq(false)
  end
end
