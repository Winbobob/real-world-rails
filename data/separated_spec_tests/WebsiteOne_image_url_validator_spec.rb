require 'spec_helper'


describe ImageUrlValidator do
  let(:dummy_class) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :image_url
      validates_with ImageUrlValidator
    end
  end

  subject { dummy_class.new }

  it 'should be valid for a valid image url' 


  it 'should reject non-URLs' 



  it 'should reject an invalid file format' 


  ['http://github.com/AgileVentures/WebsiteOne','<>hi'].each do |invalid_url|
    it "#{invalid_url.inspect} is an invalid url" 

  end
end

