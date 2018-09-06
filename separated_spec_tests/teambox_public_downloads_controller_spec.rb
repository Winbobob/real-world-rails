require File.dirname(__FILE__) + '/../spec_helper'

describe PublicDownloadsController do
  render_views
  
  before do
    make_a_typical_project
    @upload = @project.uploads.new({:asset => mock_uploader('semicolons.js', 'application/javascript', "alert('what?!')")})
    @upload.user = @user
    @upload.save!

    @folder = Factory(:folder, :user => @user, :project => @project)
  end
  
  route_matches("/d/aaBBccdd33ffGG44",
    :get, 
    :controller => "public_downloads",
    :action => "download", 
    :token => "aaBBccdd33ffGG44")

  route_matches("/f/hhyy66GGJJeeXXll",
    :get,
    :controller => "public_downloads",
    :action => "folder",
    :token => "hhyy66GGJJeeXXll")

  route_matches("/send/aaBBccdd33ffGG44",
    :get,
    :controller => "public_downloads",
    :action => "download_send",
    :token => "aaBBccdd33ffGG44")
  
  describe "GET #download" do
    it "should display downloads landing page for correct token" 

    
    it "should show file not found page for invalid token" 

  end

  describe "GET #folder" do
    it "should display download folder landing page for correct token" 


    it "should show file not found page for invalid token" 

  end

  describe "GET #send" do
    it "should send a file with correct headers to the browser" 


    it "should return not found for invalid token" 


  end

end

