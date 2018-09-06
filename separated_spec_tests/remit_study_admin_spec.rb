require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "StudyAdmin" do
  let!(:amr_topic) { FactoryGirl.create(:amr_topic) }
  let!(:brucellosis) { FactoryGirl.create(:brucellosis) }
  let!(:randomised_type) { FactoryGirl.create(:randomised_type) }
  let!(:stable_setting) { FactoryGirl.create(:stable_setting) }
  let!(:collaborator1) { FactoryGirl.create(:collaborator) }
  let!(:collaborator2) { FactoryGirl.create(:collaborator) }
  let(:admin_user) { FactoryGirl.create(:admin_user) }

  before do
    sign_in_account(admin_user.email)
    click_link "Studies"
  end

  it "allows you to create a new study" 


  it "allows you to create a new study with multiple countries" 


  it "allows you to create a new study with multiple topics" 


  it "allows you to create a new study with multiple collaborators" 


  context "with an existing study" do
    let!(:accept_status) { FactoryGirl.create(:accept) }
    let!(:study) { FactoryGirl.create(:study) }

    before do
      # An easy way to refresh the page
      click_link "Studies"
    end

    it "allows you to edit the study" 


    it "allows you to delete the study" 


    it "allows you to hide the study" 

  end
end

