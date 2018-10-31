require 'spec_helper'
# from https://gist.github.com/timocratic/5113293


describe UriValidator do
  let(:dummy_class) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :url
      validates :url, uri: true
    end
  end

  subject { dummy_class.new }

  it 'should be valid for a valid http url' 


  ['http:/www.google.com','<>hi'].each do |invalid_url|
    it "#{invalid_url.inspect} is an invalid url" 

  end

  it 'should be invalid for an unaccepted protocol' 

end

