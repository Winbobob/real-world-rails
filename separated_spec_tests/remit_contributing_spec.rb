# encoding: utf-8
require "rails_helper"
require "support/helpers/features/user_accounts"
require "support/matchers/have_latest_activity"
require "support/matchers/match_activity"

def click_label(text)
  find("label", text: text).click
end

RSpec.describe "Contributing to a study" do
  let!(:document_type) { FactoryGirl.create(:protocol_doc_type) }
  let!(:dissemination_category) { FactoryGirl.create(:field) }
  let!(:msf_policy_impact_type) { FactoryGirl.create(:msf_policy_impact) }
  let!(:programme_impact_type) { FactoryGirl.create(:programme_impact) }
  let!(:user) { FactoryGirl.create(:normal_user) }
  let!(:study) { FactoryGirl.create(:study, principal_investigator: user) }

  before do
    PublicActivity.enabled = true
    sign_in_account(user.email)
    visit study_path(study)
  end

  after do
    PublicActivity.enabled = false
  end

  it "allows you to contribute a document" 


  it "allows you to contribute a note" 

end

