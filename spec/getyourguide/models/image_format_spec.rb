require 'spec_helper'

describe GetYourGuide::Models::ImageFormat do
  subject(:image_format) {
    GetYourGuide::Models::ImageFormat.new(
      provider_id: 1,
      width: 200,
      height: 300,
      comment: 'Comment'
    )
  }

  it 'should be a GetYourGuide::Models::ImageFormat object' do
    expect(image_format).to be_an_instance_of(GetYourGuide::Models::ImageFormat)
  end

  it 'should have a provider_id' do
    expect(image_format.provider_id).to eq(1)
    expect(image_format.provider_id).to be_an_instance_of(Fixnum)
  end

  it 'should have a width' do
    expect(image_format.width).to eq(200)
    expect(image_format.width).to be_an_instance_of(Fixnum)
  end

  it 'should have a height' do
    expect(image_format.height).to eq(300)
    expect(image_format.height).to be_an_instance_of(Fixnum)
  end

  it 'should have a comment' do
    expect(image_format.comment).to eq('Comment')
    expect(image_format.comment).to be_an_instance_of(String)
  end
end
