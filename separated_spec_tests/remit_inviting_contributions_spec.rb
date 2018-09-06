# encoding: utf-8
require "rails_helper"
require "support/helpers/features/user_accounts"

def click_label(text)
  find("label", text: text).click
end

RSpec.describe "Inviting a contributor" do
  let(:user) { FactoryGirl.create(:normal_user) }
  let(:study) { FactoryGirl.create(:study, principal_investigator: user) }

  before do
    sign_in_account(user.email)
    visit study_path(study)
  end

  it "allows you to invite a user" 

end

