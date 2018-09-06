require 'spec_helper'

describe UserSessionsController do
  describe "#create" do
    context "when login fails" do
      it "should display a message with login failure and render the login template" 

    end
  end

  describe "#destroy" do
    let(:user)         { FactoryGirl.create(:user) }
    let(:user_session) { UserSession.create email: user.email, password: 'password' }

    before do
      subject.stubs(:current_user_session).returns(user)
    end

    it "should display a message with logout success and render the login template" 

  end
end

