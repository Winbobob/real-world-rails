require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "StudyNoteAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }

  before do
    sign_in_account(admin_user.email)
    click_link "Study Notes"
  end

  it "allows you to create a new study note" 


  context "with an existing study note" do
    let!(:note) { FactoryGirl.create(:study_note, study: study) }

    before do
      # An easy way to refresh the page
      click_link "Study Notes"
    end

    it "allows you to edit the study note" 


    it "allows you to delete the study note" 

  end
end

