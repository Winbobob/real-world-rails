require "rails_helper"

RSpec.describe "GET /oauth/authorize" do
  include Warden::Test::Helpers

  let!(:resource_owner) { create :user }
  let(:organisation) { create :organisation }

  before do
    Warden.test_mode!
    login_as(resource_owner, scope: :user)
  end

  def authorize_url
    oauth_authorization_url(
      client_id: doorkeeper_app.uid,
      redirect_uri: doorkeeper_app.redirect_uri,
      response_type: "code",
      state: "TEST_VALUE"
    )
  end

  context "when the application does not handle its own authorization" do
    context "the user has a role for the application" do
      let!(:doorkeeper_app) {
        create :doorkeeper_application,
        redirect_uri: "https://localhost:34343/auth/callback",
        available_roles: ["viewer"]
      }

      it "redirects to the apps auth callback uri" 

    end

    context "the user has no role for the application" do
      context "the application has not provided a failure URI" do
        let!(:doorkeeper_app) {
          create :doorkeeper_application,
          redirect_uri: "https://redirect.example:34343/auth/callback"
        }

        it "creates a failure URI from the redirect hostname" 

      end

      context "the application has provided a failure URIs" do
        let!(:doorkeeper_app) {
          create :doorkeeper_application,
          redirect_uri: "https://redirect.example:34343/auth/callback",
          failure_uri: "https://redirect.example:34343/failure\r\nhttps://not-redirect.example:34343/failure"
        }

        it "selects the correct failure URI based on the redirect hostname" 

      end
    end
  end

  context "when the application handles it own authorization" do
    let!(:doorkeeper_app) {
      create :doorkeeper_application,
      redirect_uri: "https://localhost:34343/auth/callback",
      handles_own_authorization: true
    }
    let!(:membership) { create :membership, user: resource_owner, organisation: organisation }

    before do
      doorkeeper_app.organisations << organisation
      doorkeeper_app.save!
    end

    context "the user has access to the application" do
      it "redirects to the apps auth callback uri" 

    end

    context "the user does not have access to the application" do
      it "redirects to the failure uri" 

    end
  end
end

