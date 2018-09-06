require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "StudyInviteAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }

  before do
    sign_in_account(admin_user.email)
    click_link "Study Invites"
    # Clear out welcome mails for new users
    ActionMailer::Base.deliveries = []
  end

  it "allows you to create a new study invite" 


  context "with an existing study invite" do
    let!(:invite) { FactoryGirl.create(:study_invite, study: study) }
    let!(:new_user) { FactoryGirl.create(:user) }

    before do
      # An easy way to refresh the page
      click_link "Study Invites"
    end

    it "allows you to edit the study invite" 


    it "allows you to delete the study invite" 

  end
end

