require "rails_helper"
require "support/helpers/features/user_accounts"

RSpec.describe "DocumentAdmin" do
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:study) { FactoryGirl.create(:study) }
  let!(:document_type) { FactoryGirl.create(:protocol_doc_type) }

  before do
    sign_in_account(admin_user.email)
    click_link "Documents"
  end

  it "allows you to create a new document" 


  context "with an existing document" do
    let!(:document) do
      FactoryGirl.create :document, study: study, document_type: document_type
    end

    before do
      # An easy way to refresh the page
      click_link "Documents"
    end

    it "allows you to edit the document" 


    it "allows you to delete the document" 

  end
end

