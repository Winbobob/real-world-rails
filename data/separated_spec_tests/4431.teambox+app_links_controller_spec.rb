require 'spec_helper'

describe ApiV1::AppLinksController do
  before do
    @user = Factory.create(:confirmed_user)
    @app_link = Factory.create(:app_link, :user => @user, :provider => 'google')
    @app_link2 = Factory.create(:app_link, :user => @user, :provider => 'twitter')
  end

  describe "#index" do
    it "shows app_links the user owns" 


    it "shows app_links with a JSONP callback" 


    it "shows app_links as JSON when requested with the :text format" 


    it "does not show app_links the user doesn't own" 


    it "limits app_links" 


    it "limits and offsets app_links" 

  end

  describe "#create" do
    it "creates an app_link" 

  end

  describe "#show" do
    it "shows an app_link with references" 


    it "should not show an app_link that doesn't belong to the user" 


    it "should not show an app_link which does not exist" 

  end

  describe "#destroy" do
    it "should destroy an app_link" 


    it "should only allow the owner to destroy an app_link" 

  end

end

