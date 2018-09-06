require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "DeliveryUpdateInviteAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }
  let!(:delivery_update) { FactoryGirl.create(:delivery_update) }

  before do
    sign_in_account(admin_user.email)
    click_link "Delivery Update Invites"
  end

  it "allows you to create a new delivery update invite" 


  context "with an existing delivery update invite" do
    let!(:invite) do
      FactoryGirl.create :delivery_update_invite,
                         study: study,
                         invited_user: user,
                         inviting_user: admin_user
    end

    before do
      # An easy way to refresh the page
      click_link "Delivery Update Invites"
    end

    it "allows you to edit the delivery update invite" 


    it "allows you to delete the delivery update invite" 

  end
end

