require 'rails_helper'
require 'api_spec_helper'
require 'support/claim_api_endpoints'
require_relative '../../shared_examples_for_all'

describe API::V1::ExternalUsers::Claims::Advocates::InterimClaim do
  include Rack::Test::Methods
  include ApiSpecHelper

  let!(:provider)       { create(:provider) }
  let!(:other_provider) { create(:provider) }
  let!(:vendor)         { create(:external_user, :admin, provider: provider) }
  let!(:advocate)       { create(:external_user, :advocate, provider: provider) }
  let!(:other_vendor)   { create(:external_user, :admin, provider: other_provider) }
  let!(:offence)        { create(:offence, :with_fee_scheme_ten)}
  let!(:court)          { create(:court)}
  let!(:valid_params)   { {
      :api_key => provider.api_key,
      :creator_email => vendor.user.email,
      :advocate_email => advocate.user.email,
      :case_number => 'A20161234',
      :advocate_category => 'Leading junior',
      :offence_id => offence.id,
      :court_id => court.id } }

  after(:all) { clean_database }

  describe 'vendor' do
    it 'should belong to same provider as advocate' 

  end

  context 'when sending non-permitted verbs' do
    ClaimApiEndpoints.for('advocates/interim').all.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        ClaimApiEndpoints.forbidden_verbs.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  describe "POST #{ClaimApiEndpoints.for('advocates/interim').validate}" do
    def post_to_validate_endpoint
      post ClaimApiEndpoints.for('advocates/interim').validate, valid_params, format: :json
    end

    it 'valid requests should return 200 and String true' 


    context 'invalid API key' do
      include_examples "invalid API key validate endpoint"

      it "should return 401 and JSON error array when it is an API key from another provider's admin" 


    end

    it "should return 400 and JSON error array when creator email is invalid" 


    it "should return 400 and JSON error array when advocate email is invalid" 


    it 'missing required params should return 400 and a JSON error array' 

  end

  describe "POST #{ClaimApiEndpoints.for('advocates/interim').create}" do
    def post_to_create_endpoint
      post ClaimApiEndpoints.for('advocates/interim').create, valid_params, format: :json
    end

    context "when claim params are valid" do
      it "should create claim, return 201 and claim JSON output including UUID, but not API key" 


      it "should exclude API key, creator email and advocate email from response" 


      it "should create one new claim" 


      context "the new claim should" do
        let(:claim) { Claim::AdvocateInterimClaim.active.last }

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
        before { valid_params.delete(:case_number) }

        it "should return a JSON error array when required model attributes are missing" 


        it "should not create a new claim" 

      end

      context "existing but invalid value" do
        it "should return 400 and JSON error array of model validation BLANK errors" 


        it "should return 400 and JSON error array of model validation INVALID errors" 

      end

      context "unexpected error" do
        before { valid_params[:court_id] = 1000000000000000000000000000011111 }

        it "should return 400 and JSON error array of error message" 


        it "should not create a new claim" 

      end
    end
  end
end

