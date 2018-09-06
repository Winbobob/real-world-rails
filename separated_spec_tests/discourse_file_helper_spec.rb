require 'rails_helper'
require 'file_helper'

describe FileHelper do

  let(:url) { "https://eviltrout.com/trout.png" }
  let(:png) { Base64.decode64("R0lGODlhAQABALMAAAAAAIAAAACAAICAAAAAgIAAgACAgMDAwICAgP8AAAD/AP//AAAA//8A/wD//wBiZCH5BAEAAA8ALAAAAAABAAEAAAQC8EUAOw==") }

  before do
    stub_request(:any, /https:\/\/eviltrout.com/)
    stub_request(:get, url).to_return(body: png)
  end

  describe "download" do

    it "correctly raises an OpenURI HTTP error if it gets a 404 even with redirect" 


    it "correctly raises an OpenURI HTTP error if it gets a 404" 


    it "returns a file with the image" 


    it "works with a protocol relative url" 

  end

end

