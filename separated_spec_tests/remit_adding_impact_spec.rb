# encoding: utf-8
require "rails_helper"
require "support/helpers/features/user_accounts"
require "support/matchers/have_latest_activity"
require "support/matchers/match_activity"

def click_label(text)
  find("label", text: text).click
end

RSpec.shared_examples_for "Adding impact to a study" do
  before do
    PublicActivity.enabled = true
  end

  after do
    PublicActivity.enabled = false
  end

  it "allows you to contribute a publication manually" 


  it "allows you to contribute a publication by DOI number" 


  it "allows you to contribute a dissemination" 


  it "allows you to add an other category dissemination without js" 


  it "allows you to contribute a single impact" 


  it "allows you to contribute multiple impacts" 

end

RSpec.describe "Adding impact to a study" do
  let!(:user) { FactoryGirl.create(:normal_user) }
  let!(:study) { FactoryGirl.create(:study, principal_investigator: user) }
  let!(:dissemination_category) { FactoryGirl.create(:field) }
  let!(:msf_policy_impact_type) { FactoryGirl.create(:msf_policy_impact) }
  let!(:programme_impact_type) { FactoryGirl.create(:programme_impact) }

  context "as a logged in user" do
    let(:expected_user) { user }
    before do
      sign_in_account(user.email)
      visit study_path(study)
      find(:xpath, "//a[@href='#{study_outputs_new_path(study)}']").click
    end

    it_behaves_like "Adding impact to a study"
  end

  context "as a user invited by email" do
    let!(:invited_user) { FactoryGirl.create(:user) }
    let(:expected_user) { invited_user }
    let!(:study_invite) do
      FactoryGirl.create(:study_invite, study: study,
                                        invited_user: invited_user,
                                        inviting_user: user)
    end

    before do
      path = study_outputs_new_path(study)
      visit "#{path}?token=#{invited_user.invite_token}"
    end

    it_behaves_like "Adding impact to a study"
  end
end

