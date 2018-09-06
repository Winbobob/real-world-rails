require "rails_helper"
require "support/helpers/features/user_accounts"
require "support/shared_examples/features/listing_studies"

RSpec.describe "User studies page" do
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user_studies) do
    FactoryGirl.create_list(:study, 20, principal_investigator: user)
  end
  let!(:other_user_studies) do
    FactoryGirl.create_list(:study, 20, principal_investigator: other_user)
  end

  context "when a user is signed in" do
    let(:expected_studies) { user_studies } # For the shared examples
    let(:path) { user_studies_path(user) }

    before do
      sign_in_account(user.email)
    end

    it "lists the user's studies" 


    it_behaves_like "study listing page"
  end

  it "returns a forbidden page when you try to access another user's page" 


  it "lets an admin access any user's page" 

end

