require 'rails_helper'
require 'api_spec_helper'
require_relative 'shared_examples_for_all'

RSpec.describe API::V1::ExternalUsers::Defendant do
  include Rack::Test::Methods
  include ApiSpecHelper

  ALL_DEFENDANT_ENDPOINTS = [endpoint(:defendants, :validate), endpoint(:defendants)]
  FORBIDDEN_DEFENDANT_VERBS = [:get, :put, :patch, :delete]

  # NOTE: need to specify claim.source as api to ensure defendant model validations applied
  let!(:provider)      { create(:provider) }
  let!(:claim)         { create(:claim, source: 'api').reload }
  let!(:valid_params)  { {api_key: provider.api_key, claim_id: claim.uuid, first_name: "JohnAPI", last_name: "SmithAPI", date_of_birth: "1980-05-10"} }

  let(:json_error_response) do
    [
      {'error' => "Enter a date of birth for the defendant"},
      {'error' => "Enter a first name for the defendant"},
      {'error' => "Enter a last name for the defendant"}
    ].to_json
  end

  context 'when sending non-permitted verbs' do
    ALL_DEFENDANT_ENDPOINTS.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        FORBIDDEN_DEFENDANT_VERBS.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  describe "POST #{endpoint(:defendants)}" do
    def post_to_create_endpoint
      post endpoint(:defendants), valid_params, format: :json
    end

    include_examples "should NOT be able to amend a non-draft claim"

    context "when defendant params are valid" do

      it "should create defendant, return 201 and defendant JSON output including UUID" 


      it "should exclude API key from response" 


      it "should create one new defendant" 


      it "should create a new record using the params provided" 


    end

    context "when defendant params are invalid" do
      context 'invalid API key' do
        include_examples "invalid API key create endpoint"
      end

      context "missing expected params" do
        it "should return a JSON error array with required model attributes" 

      end

      context "malformed claim UUID" do
        it "rejects malformed uuids" 

      end
    end

  end

  describe "POST #{endpoint(:defendants, :validate)}" do
    def post_to_validate_endpoint
      post endpoint(:defendants, :validate), valid_params, format: :json
    end

    it 'valid requests should return 200 and String true' 


    context 'invalid API key' do
      include_examples "invalid API key validate endpoint"
    end

    it 'missing required params should return 400 and a JSON error array' 


    it 'invalid claim id should return 400 and a JSON error array' 


    it 'returns 400 and JSON error when dates are not in acceptable format' 

  end

end

