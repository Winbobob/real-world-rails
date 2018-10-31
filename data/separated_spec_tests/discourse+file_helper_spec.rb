require 'rails_helper'
require 'file_helper'

describe FileHelper do

  let(:url) { "https://eviltrout.com/trout.png" }
  let(:png) { File.read("#{Rails.root}/spec/fixtures/images/cropped.png") }

  before do
    stub_request(:any, /https:\/\/eviltrout.com/)
    stub_request(:get, url).to_return(body: png)
  end

  describe "download" do
    it "correctly raises an OpenURI HTTP error if it gets a 404 even with redirect" 


    it "correctly raises an OpenURI HTTP error if it gets a 404" 


    it "returns a file with the image" 


    it "works with a protocol relative url" 


    describe 'when max_file_size is exceeded' do
      it 'should return nil' 


      it 'is able to retain the tmpfile' 

    end

    describe 'when url is a jpeg' do
      let(:url) { "https://eviltrout.com/trout.jpg" }

      it "should prioritize the content type returned by the response" 

    end
  end

end

