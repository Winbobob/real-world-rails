# encoding: utf-8
require 'rails_helper'

describe UsersController do
render_views
  
  before(:each) do
    @user = FactoryGirl.create(:user, login: "vdaubry", city: "paris", country: "france")
  end
  
  describe "GET show" do
    context "user exists" do
      it "sets user" 

      
      it "is case insensitive" 

    end
    
    context "user doesn't exists" do
      it "returns 404" 

    end
  end
  
  describe "GET search" do
    context "user exists" do
      it "sets user" 

      
      it "search case insensitive" 


      it "search trim whitespace" 

    end
    
    context "user doesn't exists" do
      it "redirects to users index" 

    end
    
    context "empty user" do
      it "redirects to users index" 

    end
  end
  
  describe "GET index" do
    it "returns presenter" 

    
    context "country as city" do
      it "should not fail" 

    end
    
    context "invalid type" do
      it "should not fail" 

    end
  end
end

