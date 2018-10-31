# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Users::SessionsController do

  before do
    # Don't call out to external url during tests
    allow(controller).to receive(:country_from_ip).and_return('gb')
  end

  describe 'GET new' do

    it "should show sign in / sign up page" 


    it "should create post redirect to / when you just go to /signin" 


    it "should create post redirect to /list when you click signin on /list" 


    context 'if the user is already signed in' do
      let(:user) { FactoryGirl.create(:user) }

      before do
        ActionController::Base.allow_forgery_protection = true
        session[:user_id] = user.id
      end

      after do
        ActionController::Base.allow_forgery_protection = false
      end

      it 'redirects to the homepage' 


      it 'redirects to the redirect parameter' 


    end

  end

  describe 'POST create' do
    let(:user) { FactoryGirl.create(:user) }

    it "should show you the sign in page again if you get the password wrong" 


    it "should show you the sign in page again if you get the email wrong" 


    it "should log in when you give right email/password, and redirect to where you were" 


    it "should not log you in if you use an invalid PostRedirect token, and shouldn't give 500 error either" 


    it "sets a the cookie expiry to nil on next page load" 


    it "does not log you in if you use an invalid PostRedirect token" 


    context "checking 'remember_me'" do
      let(:user) do
        FactoryGirl.create(:user,
                           :password => 'password',
                           :email_confirmed => true)
      end

      def do_signin(email, password)
        post :create, { :user_signin => { :email => email,
                                          :password => password },
                        :remember_me => "1" }
      end

      before do
        # fake an expired previous session which has not been reset
        # (i.e. it timed out rather than the user signing out manually)
        session[:ttl] = Time.zone.now - 2.months
      end

      it "logs the user in" 


      it "sets session[:remember_me] to true" 


      it "clears the session[:ttl] value" 


      it "sets a long lived cookie on next page load" 

    end

    context 'if the user is already signed in' do
      let(:user){ FactoryGirl.create(:user) }

      before do
        ActionController::Base.allow_forgery_protection = true
      end

      after do
        ActionController::Base.allow_forgery_protection = false
      end

      it "signs them in if the credentials are valid" 


      it 'signs them out if the credentials are not valid' 


    end

    it "should ask you to confirm your email if it isn't confirmed, after log in" 


    # TODO: Extract to integration spec
    it 'does not redirect you to another domain' 


    # TODO: Extract to integration spec
    it "should confirm your email, log you in and redirect you to where you were after you click an email link" 


    # TODO: Extract to integration spec
    it "should keep you logged in if you click a confirmation link and are already logged in as an admin" 


  end

  describe 'GET destroy' do
    let(:user) { FactoryGirl.create(:user) }

    it "logs you out and redirect to the home page" 


    it "logs you out and redirect you to where you were" 


    it "clears the session ttl" 


  end

end

