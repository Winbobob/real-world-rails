require 'rails_helper'
require 'api_spec_helper'
require_relative 'shared_examples_for_all'

RSpec.describe API::V1::ExternalUsers::DateAttended do
  include Rack::Test::Methods
  include ApiSpecHelper

  ALL_DATES_ATTENDED_ENDPOINTS = [endpoint(:dates_attended, :validate), endpoint(:dates_attended)]
  FORBIDDEN_DATES_ATTENDED_VERBS = [:get, :put, :patch, :delete]

  let!(:provider)     { create(:provider) }
  let!(:claim)        { create(:claim, source: 'api') }
  let!(:fee)          { create(:misc_fee, claim: claim) }
  let!(:from_date)    { claim.earliest_representation_order_date }
  let!(:to_date)      { from_date + 2.days }
  let!(:valid_params) { { api_key: provider.api_key, attended_item_id: fee.reload.uuid, date: from_date.as_json, date_to: to_date.as_json} }

  context 'when sending non-permitted verbs' do
    ALL_DATES_ATTENDED_ENDPOINTS.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        FORBIDDEN_DATES_ATTENDED_VERBS.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  describe "POST #{endpoint(:dates_attended)}" do

    def post_to_create_endpoint
      post endpoint(:dates_attended), valid_params, format: :json
    end

    include_examples "should NOT be able to amend a non-draft claim"

    context 'when date_attended params are valid' do
      it "should create date_attended, return 201 and date_attended JSON output including UUID" 


      it "should create one new date attended" 


      it "should be associated with fee" 


      it 'should create a new record using the params provided' 

    end

    context 'when date_attended params are invalid' do
      context 'invalid API key' do
        # include_examples "invalid API key create endpoint"
      end

      context "missing expected params" do
        it "should return a JSON error array with required model attributes" 

      end

      context 'missing attended item id' do
        it 'should return 400 and a JSON error array' 

      end

      context 'invalid attended item id' do
        it 'should return 400 and a JSON error array' 

      end

      context "malformed attended_item_id UUID" do
        it "rejects malformed uuids" 

      end

      include_examples "malformed or not iso8601 compliant dates", action: :create, attributes: [:date, :date_to]
    end
  end

  describe "POST #{endpoint(:dates_attended, :validate)}" do

    def post_to_validate_endpoint
      post endpoint(:dates_attended, :validate), valid_params, format: :json
    end

     it 'valid requests should return 200 and String true' 
    it 'missing required params should return 400 and a JSON error array' 


    it 'invalid attended item id should return 400 and a JSON error array' 


    include_examples "malformed or not iso8601 compliant dates", action: :validate, attributes: [:date, :date_to]
  end
end

