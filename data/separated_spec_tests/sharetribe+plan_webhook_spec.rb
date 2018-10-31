require 'spec_helper'

# Override the API with test API
require_relative '../services/plan_service/api/api'

describe "plan provisioning", type: :request do

  let(:log_target) {
    PlanService::API::Api.log_target
  }

  before(:each) do
    log_target.clear!
  end

  describe "plans service in use" do

    let(:token) {
      # The token is result of: JWT.encode({sub: :provisioning}, "test_secret")
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwcm92aXNpb25pbmcifQ.c2C--Jce-aYzh3xo0UlRr3yFrqFTEkYPpBWDBypQ07M"
    }

    before(:each) do
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: true)
    end

    after(:each) do
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: false)
    end

    describe "security" do
      it "returns 401 if token doesn't match" 


      it "returns 200 if authorized" 

    end

    describe "invalid JSON" do
      it "returns 400 Bad request, if JSON is invalid" 

    end

    describe "plan creation" do
      it "creates new plans" 

    end
  end

  describe "plans service not in use" do
    before(:each) {
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: false)
    }

    after(:each) {
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: true)
    }

    let(:token) {
      # The token is result of: JWT.encode({sub: :trial_sync}, "test_secret")
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0cmlhbF9zeW5jIn0._E4PCzBCxJSlwZzFKekvkdR-gX4cuKOxrJ7x2DRfFKI"
    }

    it "returns 404 if external plan service is not in use" 

  end

  describe "trials" do

    let(:token) {
      # The token is result of: JWT.encode({sub: :trial_sync}, "test_secret")
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0cmlhbF9zeW5jIn0._E4PCzBCxJSlwZzFKekvkdR-gX4cuKOxrJ7x2DRfFKI"
    }

    before(:each) do
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: true)
    end

    after(:each) do
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: false)
    end

    context "success" do

      it "fetches trials after given time" 


      it "supports pagination" 

    end
  end
end

