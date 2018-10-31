require 'rails_helper'
require 'api_spec_helper'
require 'support/claim_api_endpoints'
require_relative '../shared_examples_for_all'

RSpec.describe API::V1::ExternalUsers::Claims::AdvocateClaim do
  include Rack::Test::Methods
  include ApiSpecHelper

  let!(:provider)       { create(:provider) }
  let!(:other_provider) { create(:provider) }
  let!(:vendor)         { create(:external_user, :admin, provider: provider) }
  let!(:advocate)       { create(:external_user, :advocate, provider: provider) }
  let!(:other_vendor)   { create(:external_user, :admin, provider: other_provider) }
  let!(:offence)        { create(:offence)}
  let!(:court)          { create(:court)}
  let!(:valid_params)   { {
      :api_key => provider.api_key,
      :creator_email => vendor.user.email,
      :advocate_email => advocate.user.email,
      :case_type_id => FactoryBot.create(:case_type, :retrial).id,
      :case_number => 'A20161234',
      :first_day_of_trial => "2015-01-01",
      :estimated_trial_length => 10,
      :actual_trial_length => 9,
      :trial_concluded_at => "2015-01-09",
      :retrial_started_at => "2015-02-01",
      :retrial_concluded_at => "2015-02-05",
      :retrial_actual_length => "4",
      :retrial_estimated_length => "5",
      :retrial_reduction => "true",
      :advocate_category => 'Led junior',
      :offence_id => offence.id,
      :court_id => court.id } }

  after(:all) { clean_database }

  describe 'vendor' do
    it 'should belong to same provider as advocate' 

  end

  context 'when sending non-permitted verbs' do
    ClaimApiEndpoints.for(:advocate).all.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        ClaimApiEndpoints.forbidden_verbs.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  describe "POST #{ClaimApiEndpoints.for(:advocate).validate}" do
    def post_to_validate_endpoint
      post ClaimApiEndpoints.for(:advocate).validate, valid_params, format: :json
    end

    it 'valid requests should return 200 and String true' 


    context 'invalid API key' do
      include_examples "invalid API key validate endpoint"

      it "should return 401 and JSON error array when it is an API key from another provider's admin" 


    end

    it "should return 400 and JSON error array when creator email is invalid" 


    it "should return 400 and JSON error array when advocate email is invalid" 


    it 'missing required params should return 400 and a JSON error array' 


    it 'returns 400 and JSON error when dates are not in acceptable format' 

  end

  describe "POST #{ClaimApiEndpoints.for(:advocate).create}" do
    def post_to_create_endpoint
      post ClaimApiEndpoints.for(:advocate).create, valid_params, format: :json
    end

    context "when claim params are valid" do
      it "should create claim, return 201 and claim JSON output including UUID, but not API key" 


      it "should exclude API key, creator email and advocate email from response" 


      it "should create one new claim" 


      context "the new claim should" do
        let(:claim) { Claim::AdvocateClaim.active.last }

        before(:each) {
          post_to_create_endpoint
        }

        it "have the same attributes as described in params" 


        it "belong to the advocate whose email was specified in params" 

      end
    end

    context "when claim params are invalid" do
      context 'invalid API key' do
        include_examples "invalid API key create endpoint"

        it "should return 401 and JSON error array when it is an API key from another provider" 

      end

      context "invalid email input" do
        it "should return 400 and a JSON error array when advocate email is invalid" 

        it "should return 400 and a JSON error array when creator email is invalid" 

      end

      context "missing expected params" do
        it "should return a JSON error array when required model attributes are missing" 

      end

      context "existing but invalid value" do
        it "should return 400 and JSON error array of model validation BLANK errors" 


        it "should return 400 and JSON error array of model validation INVALID errors" 

      end

      context "unexpected error" do
        it "should return 400 and JSON error array of error message" 

      end
    end
  end
end

