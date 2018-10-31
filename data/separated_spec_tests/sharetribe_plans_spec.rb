require 'spec_helper'
# Override the API with test API
require_relative './api'

describe PlanService::API::Plans do

  before(:each) {
    PlanService::API::Api.reset!
  }

  context "external service in use" do
    let(:plans_api) {
      PlanService::API::Api.set_environment(active: true)
      PlanService::API::Api.plans
    }

    describe "#create" do
      context "#get_current" do
        it "creates a new initial trial" 


        it "creates a new plan" 


        it "creates a new plan that never expires" 

      end

      context "error" do
        it "raises error if both plan level and plan name are missing" 


        it "returns error if plan can not be found" 


        it "raises error if features is missing"do
          expect { plans_api.create(
            community_id: 123,
            plan: {
              status: :active,
              member_limit: 1000,
            }) }.to raise_error(ArgumentError)
        end

        it "raises error if status is missing"do
          expect { plans_api.create(
            community_id: 123,
            plan: {
              features: {whitelabel: :true},
              member_limit: 1000,
            }) }.to raise_error(ArgumentError)
        end
      end
    end

    describe "#get_external_service_link" do

      it "creates a link to external service with initial trial" 


      it "creates a link to external service without initial trial" 


    end

    describe "#expired?" do
      it "returns false if plan never expires" 


      it "returns false if plan has not yet expired" 


      it "returns true if plan has expired" 

    end

    describe "#closed?" do
      it "returns false, if plan has not expired" 


      it "returns false, if trial plan" 


      it "returns true, if non-trial plan has expired" 


      it "returns true, for hold plan" 

    end

  end


  context "external service not in use" do
    let(:plans_api) {
      PlanService::API::Api.set_environment(active: false)
      PlanService::API::Api.plans
    }

    it "does not creates a new initial trial" 


    it "does not creates a new plan" 


    it "returns OS plan" 

  end

end

