require 'rails_helper'
require 'api_spec_helper'
require 'support/claim_api_endpoints'
require_relative '../shared_examples_for_all'

RSpec.describe API::V1::ExternalUsers::Claims::InterimClaim do
  include DatabaseHousekeeping
  include Rack::Test::Methods
  include ApiSpecHelper

  let!(:provider)       { create(:provider, :lgfs) }
  let!(:other_provider) { create(:provider, :lgfs) }
  let!(:vendor)         { create(:external_user, :admin, provider: provider) }
  let!(:litigator)      { create(:external_user, :litigator, provider: provider) }
  let!(:other_vendor)   { create(:external_user, :admin, provider: other_provider) }
  let!(:offence)        { create(:offence, :miscellaneous)}
  let!(:court)          { create(:court)}
  let!(:valid_params)   { {
    :api_key => provider.api_key,
    :creator_email => vendor.user.email,
    :user_email => litigator.user.email,
    :supplier_number => provider.lgfs_supplier_numbers.first.supplier_number,
    :case_type_id => FactoryBot.create(:case_type, :trial).id,
    :case_number => 'A20161234',
    :offence_id => offence.id,
    :court_id => court.id,
  } }

  after(:all) { clean_database }

  describe 'vendor' do
    it 'should belong to same provider as litigator' 

  end

  context 'when sending non-permitted verbs' do
    ClaimApiEndpoints.for(:interim).all.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        ClaimApiEndpoints.forbidden_verbs.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  context 'authentication / endpoint / user errors' do

    include_examples 'invalid API key validate endpoint'

    it 'should return 401 and JSON error array when it is an API key from another provider\'s admin' 


    it 'should return 400 and JSON error array when creator email is invalid' 


    it 'should return 400 and JSON error array when user email is invalid' 


    it 'missing required params should return 400 and a JSON error array' 

  end

  describe 'POST api/external_users/claim/interim' do

    context 'valid parameters' do
      describe 'the newly created claim should ....' do
        it 'should have the same attributes as were submitted' 


        it 'should belong to the litigator whose email was specified in the params' 

      end
    end

    context 'invalid parameters' do

      context 'invalid email input' do
        it 'should return 400 and a JSON error array when user email is invalid' 

        it 'should return 400 and a JSON error array when creator email is invalid' 

      end

      context 'missing expected params' do
        it 'should return a JSON error array when required model attributes are missing' 

      end

      context 'existing but invalid value' do
        it 'should return 400 and JSON error array of model validation BLANK errors' 


        it 'should return 400 and JSON error array of model validation INVALID errors' 

      end

    context 'unexpected error' do
      it 'should return 400 and JSON error array of error message' 

    end

  end


  end


  def post_to_create_endpoint
    post ClaimApiEndpoints.for(:interim).create, valid_params, format: :json
  end


  def post_to_validate_endpoint
    post ClaimApiEndpoints.for(:interim).validate, valid_params, format: :json
  end


end


