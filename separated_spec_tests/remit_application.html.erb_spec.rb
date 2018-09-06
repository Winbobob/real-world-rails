require "rails_helper"
require "support/devise.rb"

RSpec.describe "layouts/application.html.erb", type: :view do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let(:normal_user) { FactoryGirl.create(:user) }

  context "signed in user" do
    before do
      sign_in normal_user
      render
    end

    it "shows a sign out link" 


    it "shows a change password link" 


    it "doesn't show an admin dashboard link to normal users" 


    it "shows an admin dashboard link to admin users" 

  end

  context "anonymous user" do
    it "shows a sign in or sign up link" 

  end
end

