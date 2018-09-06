require 'rails_helper'
require Rails.root.join('spec', 'services', 'omniauth_responses')

describe "signing in with omniauth" do
  # TODO: why is this needed, they load in the app just fine
  include Devise::Controllers::UrlHelpers
  include Devise::OmniAuth::UrlHelpers

  before do
    OmniAuth.config.test_mode = true
  end

  context "with a valid facebook auth" do
    let(:facebook_response) { OmniauthResponses.facebook_response }

    before do
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(facebook_response)
    end

    it 'creates a user and authentication if the user does not exist' 


    it 'creates a new authentication if the user already exists' 

  end

  context "with a valid google_oauth2 auth" do
    let(:google_oauth2_response) { OmniauthResponses.google_oauth2_response }

    before do
      OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new(google_oauth2_response)
    end

    it 'creates a user and authentication if the user does not exist' 


    it 'creates a new authentication if the user already exists' 

  end

  context "with a valid twitter auth" do
    let(:twitter_response) { OmniauthResponses.twitter_response }

    before do
      OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(twitter_response)
    end

    it 'creates a user and authentication after the user provides an email' 

  end

  context "with a valid meetup auth" do
    let(:meetup_response) { OmniauthResponses.meetup_response }

    before do
      OmniAuth.config.mock_auth[:meetup] = OmniAuth::AuthHash.new(meetup_response)
    end

    it 'creates a user and authentication after the user provides an email' 

  end

  context "with a valid github auth" do
    let(:github_response) { OmniauthResponses.github_response }

    before do
      OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new(github_response)
    end

    it 'creates a user and authentication after the user provides an email' 

  end

  describe "when an existing user already owns an authentication" do
    let(:facebook_response) { OmniauthResponses.facebook_response }

    before do
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new(facebook_response)
    end

    it "does not error" 

  end

  describe "parsing the name attribute" do
    it "assigns blank first name and last name if name is not present" 


    it "assigns blank first name and last name if name is an empty string" 


    it "assigns just the first name if the 'name' attribute has no spaces" 

  end

  it 'retains the original return_to location when signing in' 

end

