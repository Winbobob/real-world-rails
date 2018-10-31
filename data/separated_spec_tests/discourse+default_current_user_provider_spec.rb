require 'rails_helper'
require_dependency 'auth/default_current_user_provider'

describe Auth::DefaultCurrentUserProvider do

  class TestProvider < Auth::DefaultCurrentUserProvider
    attr_reader :env
    def initialize(env)
      super(env)
    end
  end

  def provider(url, opts = nil)
    opts ||= { method: "GET" }
    env = Rack::MockRequest.env_for(url, opts)
    TestProvider.new(env)
  end

  it "can be used to pretend that a user doesn't exist" 


  context "server api" do

    it "raises errors for incorrect api_key" 


    it "finds a user for a correct per-user api key" 


    it "raises for a user pretending" 


    it "raises for a user with a mismatching ip" 


    it "allows a user with a matching ip" 


    it "finds a user for a correct system api key" 


    it "finds a user for a correct system api key with external id" 


    it "finds a user for a correct system api key with id" 


    context "rate limiting" do
      before do
        RateLimiter.enable
      end

      after do
        RateLimiter.disable
      end

      it "rate limits api requests per api key" 

    end

  end

  it "should not update last seen for ajax calls without Discourse-Visible header" 


  it "should not update last seen for suspended users" 


  it "should update ajax reqs with discourse visible" 


  it "should update last seen for non ajax" 


  it "correctly rotates tokens" 


  context "rate limiting" do

    before do
      RateLimiter.enable
    end

    after do
      RateLimiter.disable
    end

    it "can only try 10 bad cookies a minute" 

  end

  it "correctly removes invalid cookies" 


  it "logging on user always creates a new token" 


  it "sets secure, same site lax cookies" 


  it "correctly expires session" 


  it "always unstage users" 


  context "user api" do
    let :user do
      Fabricate(:user)
    end

    let :api_key do
      UserApiKey.create!(
        application_name: 'my app',
        client_id: '1234',
        scopes: ['read'],
        key: SecureRandom.hex,
        user_id: user.id
      )
    end

    it "can clear old duplicate keys correctly" 


    it "allows user API access correctly" 


    context "rate limiting" do

      before do
        RateLimiter.enable
      end

      after do
        RateLimiter.disable
      end

      it "rate limits api usage" 

    end
  end
end

