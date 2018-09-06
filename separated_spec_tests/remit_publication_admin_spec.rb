require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "PublicationAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }

  before do
    sign_in_account(admin_user.email)
    click_link "Publications"
  end

  it "allows you to create a new publication" 


  context "with an existing publication" do
    let!(:publication) { FactoryGirl.create(:publication, study: study) }

    before do
      # An easy way to refresh the page
      click_link "Publications"
    end

    it "allows you to edit the publication" 


    it "allows you to delete the publication" 

  end
end

