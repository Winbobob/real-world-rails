require 'rails_helper'
require 'api_spec_helper'
require_relative 'shared_examples_for_all'

RSpec.describe API::V1::ExternalUsers::Disbursement do
  include Rack::Test::Methods
  include ApiSpecHelper

  ALL_DISBURSEMENT_ENDPOINTS = [endpoint(:disbursements, :validate), endpoint(:disbursements)]
  FORBIDDEN_DISBURSEMENT_VERBS = [:get, :put, :patch, :delete]

  let(:parsed_body) { JSON.parse(last_response.body) }

  let!(:provider)           { create(:provider) }
  let!(:claim)              { create(:litigator_claim, source: 'api').reload }
  let!(:disbursement_type)  { create(:disbursement_type, :forensic) }

  let!(:params) do
    {
      api_key: provider.api_key,
      claim_id: claim.uuid,
      disbursement_type_id: disbursement_type.id,
      net_amount: 100.01,
      vat_amount: 17.51,
      total: 117.51
    }
  end

  let(:json_error_response) do
    [
      {"error" => "Choose a type for the disbursement"},
      {"error" => "Enter a net amount for the disbursement"},
      {"error" => "Enter a VAT amount for the disbursement"},
      {"error" => "Enter a total amount for the disbursement"}
    ].to_json
  end

  context 'sending non-permitted verbs' do
    ALL_DISBURSEMENT_ENDPOINTS.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        FORBIDDEN_DISBURSEMENT_VERBS.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  # Constant so we can refer to it outside of "it" blocks
  DISBURSEMENT_FIELDS_AND_ERRORS = {
    claim_id: "Claim cannot be blank",
    disbursement_type_id: "Choose a type for the disbursement",
    net_amount: "Enter a net amount for the disbursement",
    vat_amount: "Enter a VAT amount for the disbursement"
    # total: "Enter a total amount for the disbursement", # SET to zero by model if absent
  }

  describe "POST #{endpoint(:disbursements)}" do

    def post_to_create_endpoint
      post endpoint(:disbursements), params, format: :json
    end

    include_examples "should NOT be able to amend a non-draft claim"

    context 'when disbursement params are valid' do
      it "should create disbursement, return 201 and disbursement JSON output including UUID" 


      it "should create one new disbursement" 


      it "should create a new record using the params provided" 

    end

    context 'disbursement_type_unique_code' do
      let(:unique_code) { disbursement_type.unique_code }

      it 'should create a new disbursement record with a disbursement type specified by unique code' 

    end

    context 'when disbursement params are invalid' do
      context 'invalid API key' do
        let(:valid_params) { params }
        include_examples "invalid API key create endpoint"
      end

      context "missing expected params" do
        DISBURSEMENT_FIELDS_AND_ERRORS.each do |field, expected_message|
          it "should give the correct error message when #{field} is blank" 

        end
      end

      context 'mutually exclusive params disbursement_type_id and disbursement_type_unique_code' do
        it 'should return an error if both are provided' 

      end

      context "unexpected error" do
        it "should return 400 and JSON error array of error message" 

      end

      context 'invalid claim id' do
        it 'should return 400 and a JSON error array' 

      end

      context "malformed claim UUID" do
        it "should reject invalid uuids" 

      end

      context 'invalid disbursement_type_unique_code' do
        it 'should return 400 and a JSON error if no disbursement type was found' 

      end
    end
  end

  describe "POST #{endpoint(:disbursements, :validate)}" do
    def post_to_validate_endpoint
      post endpoint(:disbursements, :validate), params, format: :json
    end

    it 'valid requests should return 200 and String true' 


    context 'invalid API key' do
      let(:valid_params) { params }
      include_examples "invalid API key validate endpoint"
    end

    context "missing expected params" do
      DISBURSEMENT_FIELDS_AND_ERRORS.each do |field, expected_message|
        it "should give the correct error message when #{field} is blank" 

      end
    end

    it 'invalid claim id should return 400 and a JSON error array' 


    context 'AGFS claims' do
      let(:claim) { create(:advocate_claim, source: 'api').reload }
      it 'should return 400 and JSON error array' 

    end
  end

end

