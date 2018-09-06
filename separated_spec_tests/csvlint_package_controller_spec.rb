require 'spec_helper'

describe PackageController, type: :controller do

  before(:each) do
    mock_client = double(Pusher::Channel)
    allow(Pusher).to receive(:[]) { mock_client }
    allow(mock_client).to receive(:trigger)
  end

  describe "POST 'create'" do

    it "redirects to root if no URL is supplied" 


    it "redirects to root if an invalid url is supplied" 


    it "redirects to root if a relative url is supplied" 


    it "redirects to root if a non-http[s] url is supplied" 


    it "creates a validation and redirects if a sensible url is supplied" 


    it "supports multiple urls" 


    it "supports multiple files" 


    it "supports multiple zip urls" 


    it "supports multiple zip files" 


    it "supports data URLs" 


    it "supports multiple data URLs" 


    it "supports single zip files as data URLs" 


    it "supports multiple zip files as data URLs" 


    it "supports schema uploads as data URLs" 


  end

  describe "POST 'create' HTML" do

    it "has no warnings or errors for valid CSV" 


    it "has warnings or errors for warning CSV" 


    it "has errors for error CSV" 


  end

end

