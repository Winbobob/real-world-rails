require 'spec_helper'

describe ApplicationController do
  controller do
    def events
      render plain: ''
    end
    def new
      render plain: ''
    end
    def new_user
      render plain: ''
    end
    def new_password
      render plain: ''
    end
    def signout
      render plain: ''
    end
    def edit_password
      render plain: ''
    end
  end

  before do
    @routes.draw do
      match "/events" => "anonymous#events", :as => :events, via: [:get, :post, :delete, :put]
      get "/users/sign_in" => "anonymous#new", :as => :user_session
      get "/users/sign_up" => "anonymous#new_user", :as => :new_user_registration
      get "/users/password/new" => "anonymous#new_password", :as => :new_user_password
      get "/users/sign_out" => "anonymous#signout", :as => :destroy_user_session
      get "/users/password/edit" => "anonymous#edit_password", :as => :edit_user_password
    end
  end

  describe "store a location if not a blacklisted url" do
    it "should store the path in the session if a get request" 

  end
  describe "do not store a location if url okay but not a get request" do
    it "should not store the path in the session if a put request" 

    it "should not store the path in the session if an xhr request" 

    it "should not store the path in the session if a delete request" 

    it "should not store the path in the session if a post request" 

  end
  describe "do not store a location if a blacklisted url" do
    it "doesn't accept sign in path" 

    it "doesn't accept sign up path" 

    it "doesn't accept new user password path" 

    it "doesn't accept sign in" 

    it "doesn't accept sign in" 

  end
end

