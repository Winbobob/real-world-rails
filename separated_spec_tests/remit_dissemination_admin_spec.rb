require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "DisseminationAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }
  let!(:category) { FactoryGirl.create(:working_group_category) }

  before do
    sign_in_account(admin_user.email)
    click_link "Disseminations"
  end

  it "allows you to create a new dissemination" 


  context "with an existing dissemination" do
    let!(:dissemination) do
      FactoryGirl.create :dissemination,
                         study: study,
                         dissemination_category: category
    end

    before do
      # An easy way to refresh the page
      click_link "Disseminations"
    end

    it "allows you to edit the dissemination" 


    it "allows you to delete the dissemination" 

  end
end

