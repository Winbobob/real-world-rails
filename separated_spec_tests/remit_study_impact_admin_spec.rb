require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "StudyImpactAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }
  let!(:impact_type) { FactoryGirl.create(:programme_impact) }

  before do
    sign_in_account(admin_user.email)
    click_link "Study Impacts"
  end

  it "allows you to create a new study impact" 


  context "with an existing study impact" do
    let!(:impact) do
      FactoryGirl.create :study_impact, study: study,
                                        impact_type: impact_type
    end

    before do
      # An easy way to refresh the page
      click_link "Study Impacts"
    end

    it "allows you to edit the study impact" 


    it "allows you to delete the study impact" 

  end
end

