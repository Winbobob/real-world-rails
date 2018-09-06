require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "User accounts" do
  describe "Signing up" do
    context "when you have an MSF email address" do
      it "Lets you sign up for an account" 


      it "Lets you confirm your account" 


      it "Lets you resend a confirmation email" 

    end

    context "when you have a non-MSF email address" do
      let!(:admin) { FactoryGirl.create(:admin_user) }

      before do
        ActionMailer::Base.deliveries = []
      end

      it "Lets you sign up for an account" 


      it "Lets you confirm your account" 


      it "Lets you resend a confirmation email" 

    end
  end

  describe "Signing in" do
    let(:user) { FactoryGirl.create(:confirmed_user) }
    let(:admin_user) { FactoryGirl.create(:admin_user) }

    context "when your account is approved" do
      it "Lets you sign in" 


      it "Redirects users to the homepage if they have no studies" 


      it "Redirects users to their study page if they have any studies" 


      it "Redirects admin users to the dashboard" 


      it "Lets you reset your password if you've forgotten it" 

    end

    context "when your account is not approved" do
      it "doesn't let you sign in" 

    end
  end

  describe "Changing account details" do
    let(:user) { FactoryGirl.create(:confirmed_user) }

    before(:each) do
      sign_in_account(user.email)
      click_link "Change your password"
    end

    it "Lets you change your password" 


    it "Lets you change your email address" 


    it "Lets you change your name" 


    it "Lets you delete your account" 

  end

  describe "Signing out" do
    let(:user) { FactoryGirl.create(:confirmed_user) }

    it "Lets you sign out" 

  end
end

