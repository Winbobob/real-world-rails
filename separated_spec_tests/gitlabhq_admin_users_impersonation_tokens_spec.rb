require 'spec_helper'

describe 'Admin > Users > Impersonation Tokens', :js do
  let(:admin) { create(:admin) }
  let!(:user) { create(:user) }

  def active_impersonation_tokens
    find(".table.active-tokens")
  end

  def no_personal_access_tokens_message
    find(".settings-message")
  end

  before do
    sign_in(admin)
  end

  describe "token creation" do
    it "allows creation of a token" 

  end

  describe 'active tokens' do
    let!(:impersonation_token) { create(:personal_access_token, :impersonation, user: user) }
    let!(:personal_access_token) { create(:personal_access_token, user: user) }

    it 'only shows impersonation tokens' 

  end

  describe "inactive tokens" do
    let!(:impersonation_token) { create(:personal_access_token, :impersonation, user: user) }

    it "allows revocation of an active impersonation token" 


    it "removes expired tokens from 'active' section" 

  end
end

