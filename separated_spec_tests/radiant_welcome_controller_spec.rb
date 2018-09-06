require File.dirname(__FILE__) + "/../../spec_helper"

describe Radiant::Admin::WelcomeController do
  routes { Radiant::Engine.routes }
  #dataset :users

  it "should redirect to page tree on get to /admin/welcome" 


  it "should render the login screen on get to /admin/login" 


  it "should set the current user and redirect when login was successful" 


  it "should render the login template when login failed" 


  describe "remember me" do

    before do
      Radiant::Config['session_timeout'] = 2.weeks
      @user = users(:admin)
      allow(controller).to receive(:current_user).and_return(@user)
    end

    after do
      post :login, username_or_email: "admin", password: "password", remember_me: 1
    end

    it "should remember user" 


    it "should set cookie" 

  end

  describe "with a logged-in user" do
    before do
      login_as :admin
    end

    it "should clear the current user and redirect on logout" 


    it "should forget user on logout" 


    it "should not show /login again" 


    describe "and a stored location" do
      before do
        session[:return_to] = '/stored/path'
        post :login, username_or_email: "admin", password: "password"
      end

      it "should redirect" 


      it "should clear session[:return_to]" 

    end
  end

  describe "without a user" do
    it "should gracefully handle logout" 

  end

end

