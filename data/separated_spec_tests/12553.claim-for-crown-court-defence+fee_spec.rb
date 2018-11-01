require 'rails_helper'
require 'api_spec_helper'
require_relative 'shared_examples_for_all'
require_relative 'shared_examples_for_fees'

RSpec.describe API::V1::ExternalUsers::Fee do
  include Rack::Test::Methods
  include ApiSpecHelper

  ALL_FEE_ENDPOINTS = [endpoint(:fees, :validate), endpoint(:fees)]
  FORBIDDEN_FEE_VERBS = [:get, :put, :patch, :delete]

  def create_claim(*args)
    # TODO: this should not require build + save + reload
    # understand what the factory is doing to solve this
    claim = build(*args)
    claim.save
    claim.reload
  end

  let!(:provider)         { create(:provider) }

  let!(:basic_fee_type) { create(:basic_fee_type) }
  let!(:basic_fee_dat_type) { create(:basic_fee_type, :dat) }
  let!(:misc_fee_type)      { create(:misc_fee_type) }
  let!(:misc_fee_xupl_type) { create(:misc_fee_type, :miupl) }
  let!(:fixed_fee_type)     { create(:fixed_fee_type) }
  let!(:interim_fee_type)   { create(:interim_fee_type) }
  let!(:graduated_fee_type) { create(:graduated_fee_type) }
  let!(:transfer_fee_type)  { create(:transfer_fee_type) }

  before { seed_fee_schemes }

  let!(:claim)            { create(:claim, source: 'api').reload }
  let(:valid_params)      { { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: misc_fee_type.id, quantity: 3, rate: 50.00 } }
  let(:json_error_response) { [ {"error" => "Type of fee not found by ID or Unique Code" } ].to_json }

  context 'sending non-permitted verbs' do
    ALL_FEE_ENDPOINTS.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        FORBIDDEN_FEE_VERBS.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  describe "POST #{endpoint(:fees)}" do
    def post_to_create_endpoint
      post endpoint(:fees), valid_params, format: :json
    end

    include_examples "should NOT be able to amend a non-draft claim"

    context 'when fee params are valid' do

      it "should create fee, return 201 and fee JSON output including UUID" 


      it "should create one new fee" 


      it 'should create a new fee record with all provided attributes except amount' 


      context 'fee_type_unique_code' do
        let(:unique_code) { misc_fee_type.unique_code }

        it 'should create a new fee record with a fee type specified by unique code' 

      end

      context 'with fee amount provided' do
        it 'should ignore amount for all fee types that are calculated (all except PPE/NPW)' 

      end

      context 'basic fees' do
        let!(:valid_params) { { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: basic_fee_type.id, quantity: 1, rate: 210.00 } }
        let(:json) { JSON.parse(last_response.body) }
        let(:fee) { Fee::BaseFee.find_by(uuid: json['id']) }

        it 'should return 200 and fee JSON output including UUID' 


        it 'should update, not create, one basic fee' 


        it 'should raise error if basic fee does not exist on claim' 


        it 'should update quantity, rate and amount' 


        context 'agfs scheme 10' do
          let(:first_day_of_trial) { Settings.agfs_fee_reform_release_date }
          let(:actual_trial_length) { 5 }
          let(:trial_concluded_at) { first_day_of_trial + actual_trial_length.days }
          let(:case_type) { build(:case_type, :trial) }
          let(:basic_fees) {
            [
              build(:basic_fee, :baf_fee, quantity: 0, rate: 0.0, case_numbers: ''),
              build(:basic_fee, :dat_fee, quantity: 0, rate: 0.0, case_numbers: '')
            ]
          }
          let(:defendants) { [build(:defendant, representation_orders: [build(:representation_order, representation_order_date: first_day_of_trial)])] }
          let!(:claim) { create_claim(:advocate_claim, source: 'api', first_day_of_trial: first_day_of_trial, trial_concluded_at: trial_concluded_at, actual_trial_length: actual_trial_length, case_type: case_type, defendants: defendants, basic_fees: basic_fees) }
          let(:valid_params) { { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: basic_fee_dat_type.id, quantity: 2, rate: 600.00 } }

          it 'should return 200 and fee JSON output including UUID' 


          it 'should update quantity, rate and amount' 

        end
      end

      context 'basic fees of type case uplift' do
        let!(:fee) { create(:basic_fee, :noc_fee, claim: claim, quantity: 0, rate: 0.0, case_numbers: '') }
        let!(:valid_params) { { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: fee.fee_type_id, quantity: 2, rate: 201.01, case_numbers: 'T20170001,T20170002' } }

        context 'when valid' do
          it 'updates the basic fee with the provided quantity, rate, case_numbers and calculated amount' 

        end
      end

      context 'fixed fees of type case uplift' do
        let!(:claim) { create(:advocate_claim, :with_fixed_fee_case, source: 'api') }
        let!(:fixed_fee_noc_type) { create(:fixed_fee_type, :fxnoc) }
        let!(:valid_params) { { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: fixed_fee_noc_type.id, quantity: 1, rate: 201.01, case_numbers: 'T20170001' } }

        context 'when valid' do
          it 'creates the fixed fee with the provided quantity, rate, case_numbers and calculated amount' 

        end
      end

      context 'misc fees of type defendant uplift' do
        context "LGFS fees" do
          let(:claim) { create(:litigator_claim, source: 'api') }
          let!(:valid_params) { { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: misc_fee_xupl_type.id, amount: 210 } }

          it 'creates the misc fee with the provided amount' 

        end
      end
    end

    context "fee type specific errors" do
      let!(:valid_params) do
        { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: misc_fee_type.id, quantity: 3, rate: 50.00 }
      end

      it 'basic (code BAF) fee should raise basic fee errors' 


      it 'uncalculated fees (PPE/NPW) should raise an error when rate provided' 


      context 'quantity is forbidden' do
        context 'for interim fee disbursement only' do
          let!(:interim_fee_type) { create(:interim_fee_type, :disbursement_only) }
          let!(:valid_params) { {api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: interim_fee_type.id, quantity: 3, rate: 50.00} }

          it 'should raise error if quantity is provided' 

        end

        context 'for interim fee warrant only' do
          let!(:interim_fee_type) { create(:interim_fee_type, :warrant) }
          let!(:valid_params) { {api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: interim_fee_type.id, quantity: 3, rate: 50.00} }

          it 'should raise error if quantity is provided' 

        end
      end

      context 'quantity as decimal or integer' do
        let!(:special_preparation_fee) { create(:misc_fee_type, :spf) }
        let(:parsed_response) { JSON.parse(last_response.body) }

        it 'decimal quantity should raise error if fee type does NOT accept decimal quantities' 


        it 'decimal quantity should NOT raise error if fee type accepts decimals quantities' 

      end

      # NOT exhaustive
      context 'Fee Category' do
        before (:each) { valid_params.delete(:rate) }

        context 'advocate claim' do
          it 'basic fees should raise basic fee errors from translations' 


          it 'misc fees should raise misc fee errors from translations' 


          it 'fixed fees should raise fixed fee errors from translations' 

        end

        context 'litigator (interim) claim' do
          let!(:claim) { create(:interim_claim, source: 'api').reload }

          it 'interim fees should raise interim fee errors from translations' 

        end

        context 'litigator (final) claim' do
          let!(:claim) { create(:litigator_claim, source: 'api').reload }

          it 'graduates fees should raise graduated fee errors from translations' 

        end

        context 'litigator (transfer) claim' do
          let!(:claim) { create(:transfer_claim, source: 'api').reload }

          it 'transfer fees should raise transfer fee errors from translations' 

        end
      end
    end

    context 'when fee params are invalid' do
      context 'invalid API key' do
        include_examples "invalid API key create endpoint"
      end

      context "missing expected params" do
        it "should return a JSON error array with required model attributes" 

      end

      context 'mutually exclusive params fee_type_id and fee_type_unique_code' do
        it 'should return an error if both are provided' 

      end

      context "unexpected error" do
        it "should return 400 and JSON error array of error message" 

      end

      context 'missing claim id' do
        it 'should return 400 and a JSON error array' 

      end

      context 'invalid claim id' do
        it 'should return 400 and a JSON error array' 

      end

      context 'malformed claim UUID' do
        it 'should reject invalid claim id' 

      end

    end

  end

  describe "POST #{endpoint(:fees, :validate)}" do

    def post_to_validate_endpoint
      post endpoint(:fees, :validate), valid_params, format: :json
    end

    context 'non-basic fees' do
      include_examples "fee validate endpoint"
    end

    context 'basic fees' do
      let!(:valid_params) { { api_key: provider.api_key, claim_id: claim.uuid, fee_type_id: basic_fee_type.id, quantity: 1, rate: 210.00 } }
      include_examples "fee validate endpoint"
    end

    context 'when fee params are invalid' do
      context 'invalid API key' do
        include_examples "invalid API key validate endpoint"
      end
    end
  end

end

