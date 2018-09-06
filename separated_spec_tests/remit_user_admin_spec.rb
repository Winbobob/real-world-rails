require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "UserAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }

  before do
    sign_in_account(admin_user.email)
    click_link "Users"
  end

  it "allows you to create a new user" 


  context "with an existing user" do
    let!(:user) { FactoryGirl.create(:normal_user) }

    before do
      # An easy way to refresh the page
      click_link "Users"
    end

    it "allows you to edit the user" 


    it "allows you to delete the user" 


    it "allows you to approve the user" 

  end
end

