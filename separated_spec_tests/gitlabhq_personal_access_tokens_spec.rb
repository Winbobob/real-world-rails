require 'spec_helper'

describe 'Profile > Personal Access Tokens', :js do
  let(:user) { create(:user) }

  def active_personal_access_tokens
    find(".table.active-tokens")
  end

  def no_personal_access_tokens_message
    find(".settings-message")
  end

  def created_personal_access_token
    find("#created-personal-access-token").value
  end

  def disallow_personal_access_token_saves!
    allow_any_instance_of(PersonalAccessToken).to receive(:save).and_return(false)

    errors = ActiveModel::Errors.new(PersonalAccessToken.new).tap { |e| e.add(:name, "cannot be nil") }
    allow_any_instance_of(PersonalAccessToken).to receive(:errors).and_return(errors)
  end

  before do
    sign_in(user)
  end

  describe "token creation" do
    it "allows creation of a personal access token" 


    context "when creation fails" do
      it "displays an error message" 

    end
  end

  describe 'active tokens' do
    let!(:impersonation_token) { create(:personal_access_token, :impersonation, user: user) }
    let!(:personal_access_token) { create(:personal_access_token, user: user) }

    it 'only shows personal access tokens' 

  end

  describe "inactive tokens" do
    let!(:personal_access_token) { create(:personal_access_token, user: user) }

    it "allows revocation of an active token" 


    it "removes expired tokens from 'active' section" 


    context "when revocation fails" do
      it "displays an error message" 

    end
  end
end

