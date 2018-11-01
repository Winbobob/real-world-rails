require File.dirname(__FILE__) + "/../spec_helper"

class StubController < ActionController::Base
  include LoginSystem

  def rescue_action(e); raise e; end
  def index; render text: 'just a test'; end
end

class NoLoginRequiredController < StubController;  no_login_required; end

class LoginRequiredController < StubController; end

class NoLoginRequiredChildController < NoLoginRequiredController; end

class LoginRequiredGrandChildController < NoLoginRequiredChildController; login_required; end

class PrivilegedUsersOnlyController < LoginRequiredController
  only_allow_access_to :edit, :new,
                       when: [:admin, :designer],
                       denied_url: '/login_required',
                       denied_message: 'Fun.'
  def edit; render text: 'just a test'; end
  def new; render text: 'just a test'; end
end

class AdminOnlyController < LoginRequiredController
    only_allow_access_to :edit,
                         when: :admin,
                         denied_url: '/login_required',
                         denied_message: 'Fun.'
    def edit; render text: 'just a test'; end
end

class ConditionalAccessController < LoginRequiredController
    attr_writer :condition
    only_allow_access_to :edit, if: :condition?,
                         denied_url: '/login_required',
                         denied_message: 'Fun.'

    def edit; render text: 'just a test'; end
    def condition?
      @condition ||= false
    end
end

describe 'Login System:', type: :controller do
  #dataset :users

  describe NoLoginRequiredController do
    it "should not require authentication" 

  end

  describe LoginRequiredController do
    it "should authenticate with user in session" 


    it "should not authenticate without user in session" 


    it "should store location" 

  end

  describe StubController do

    describe ".authenticate" do
      it "should attempt to login from cookie" 

    end

    describe ".login_from_cookie" do
      before do
        Time.zone = 'UTC'
        allow(Radiant::Config).to receive(:[]).with('session_timeout').and_return(2.weeks)
      end

      it "should not login user if no cookie found" 


      describe "with session_token" do
        before do
          @user = users(:admin)
          expect(User).to receive(:find_by_session_token).and_return(@user)
          @cookies = { session_token: 12345 }
          allow(controller).to receive(:cookies).and_return(@cookies)
        end

        after do
          expect(controller.send(:login_from_cookie)).to eq(@user)
        end

        it "should remember user" 


        it "should update cookie" 


      end
    end
  end

  describe NoLoginRequiredChildController do
    it "should inherit no_login_required" 

  end

  describe LoginRequiredGrandChildController do
      it "should override parent with login_required" 

  end

  describe LoginRequiredGreatGrandChildController = Class.new(LoginRequiredGrandChildController) { } do
    it "should inherit login_required" 

  end

  describe PrivilegedUsersOnlyController do
    it "should only allow access when user in allowed roles" 


    it "should deny access when user not in allowed roles" 


    it "should allow access to unrestricted actions when users not in roles" 

  end

  describe AdminOnlyController do
    it "should not allow access when user not in default roles" 

  end

  describe ConditionalAccessController do

    it "should allow access if condition is true" 


    it "should not allow access if condition is false" 

  end

end

