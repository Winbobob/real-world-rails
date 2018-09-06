require 'spec_helper'

# Override the API with test API
require_relative '../services/plan_service/api/api'

describe MarketplaceLookup do
  let(:app) { ->(env) {['200', {'Content-Type' => 'text/plain'}, [env.to_json]]} }
  let(:request) { Rack::MockRequest.new(MarketplaceLookup.new(app))}

  describe "current_marketplace" do
    it 'gets the right community by subdomain' 


    it 'gets the right community by full domain even when matching subdomain exists' 

  end

  describe "current_plan" do
    before(:each) {
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: true)
    }

    after(:each) {
      PlanService::API::Api.reset!
      PlanService::API::Api.set_environment(active: false)
    }

    let(:plans_api) {
      PlanService::API::Api.plans
    }

    it 'it adds the right plan' 


    it "leaves current_plan nil if the marketplace doesn't exist" 

  end
end

