require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "DeliveryUpdateAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }
  let!(:status) { FactoryGirl.create(:delivery_update_status) }

  before do
    sign_in_account(admin_user.email)
    click_link "Delivery Updates"
  end

  it "allows you to create a new delivery update" 


  context "with an existing delivery update" do
    let!(:update) do
      FactoryGirl.create :delivery_update,
                         study: study,
                         user: user
    end

    before do
      # An easy way to refresh the page
      click_link "Delivery Updates"
    end

    it "allows you to edit the delivery update" 


    it "allows you to delete the delivery update" 

  end
end

