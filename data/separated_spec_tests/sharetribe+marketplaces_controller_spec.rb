# encoding: utf-8

require 'spec_helper'

# Override the API with test API
require_relative '../../services/plan_service/api/api'

describe IntApi::MarketplacesController, type: :controller do

  before(:each) do
    PlanService::API::Api.reset!
    PlanService::API::Api.set_environment({active: true})
  end

  after(:each) do
    PlanService::API::Api.reset!
    PlanService::API::Api.set_environment({active: false})
  end

  def expect_trial_plan(cid)
    # Create trial plan
    plan = PlanService::API::Api.plans.get_current(community_id: cid).data
    expect(plan[:expires_at]).not_to eq(nil)
  end

  describe "#create" do
    it "should create a marketplace and an admin user" 


    it "should handle emails starting with info@" 


    it "should handle short emails like fo@barbar.com" 


    it "should handle short first + last names" 


  end

  describe "#create_prospect_email" do
    it "should add given email as prospect email" 

    it "should return with an error when an email is not provided" 

  end
end

