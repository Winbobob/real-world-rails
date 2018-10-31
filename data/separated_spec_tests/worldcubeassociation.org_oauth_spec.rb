# frozen_string_literal: true

require "rails_helper"

RSpec.describe "oauth api" do
  include Capybara::DSL

  let(:user) { FactoryBot.create :user_with_wca_id }

  it 'can authenticate with grant_type password' 


  context "grant_type authorization" do
    let(:oauth_app) { FactoryBot.create(:oauth_application, redirect_uri: "urn:ietf:wg:oauth:2.0:oob\n#{oauth_authorization_url}") }

    it 'can authenticate with grant_type authorization' 


    it "requires that redirect_uri matches" 


    it 'can use refresh token' 


    context "with dangerously_allow_any_redirect_uri set" do
      before(:each) do
        oauth_app.update!(dangerously_allow_any_redirect_uri: true)
      end

      it "allows any redirect_uri" 

    end
  end

  it 'can authenticate with response_type token (implicit authorization)' 


  def verify_access_token(access_token)
    integration_session.reset! # posting to oauth_token_path littered our state
    get api_v0_me_path, headers: { "Authorization" => "Bearer #{access_token}" }
    expect(response).to be_success
    json = JSON.parse(response.body)
    # We just do a sanity check of the /me route here. There is a more
    # complete test in api_controller_spec.
    expect(json['me']['id']).to eq(user.id)
    expect(json['me']['dob']).to eq(nil)
    expect(json['me']['email']).to eq(user.email)
  end
end

