require File.dirname(__FILE__) + '/../scenario_helper.rb'

feature "Organization signs up" do
  before(:each) do
    Organization.last.try :destroy
    Crm.last.try :destroy
    StripeMock.start
  end

  after(:each) do
    StripeMock.stop
  end

  let(:org) { create(:organization, access_token: nil, stripe_publishable_key: nil, stripe_user_id: nil) }
  let(:user) { create(:confirmed_user, organization: org)}

  context "when organization denies access to Stripe account" do
    before do
      login user
    end

    it "redirects to new organization form" 

  end

  context "when organization fills out the form correctly" do
    let(:account) { Stripe::Account.create }
    let(:auth_hash) { {
      'uid' => account.id,
      'info' => { 'stripe_publishable_key' => 'X' },
      'credentials' => { 'token' => 'X' }
    } }

    before do
      OmniAuth.config.mock_auth[:stripe_connect] = auth_hash
    end

    it "redirects to the show page and exposes the organization's API slug" 


    it "allows the organization to fill out credentials" 

  end
end

