require 'rails_helper'
require 'api_spec_helper'
require_relative 'shared_examples_for_all'

RSpec.describe API::V1::ExternalUsers::RepresentationOrder do
  include Rack::Test::Methods
  include ApiSpecHelper

  ALL_REP_ORDER_ENDPOINTS = [endpoint(:representation_orders, :validate), endpoint(:representation_orders)]
  FORBIDDEN_REP_ORDER_VERBS = [:get, :put, :patch, :delete]

  let(:representation_order_date) { Date.new(2017, 6, 1) }

  let!(:provider)      { create(:provider) }
  let!(:claim)         { create(:claim, create_defendant_and_rep_order: false, source: 'api', offence: create(:offence, :with_fee_scheme)) }
  let!(:defendant)     { create(:defendant, :without_reporder, claim: claim).reload }
  let!(:valid_params)  {
    {
        api_key: provider.api_key,
        defendant_id: defendant.uuid,
        representation_order_date: representation_order_date.as_json,
        maat_reference: '0123456789'
    }
  }

  context 'when sending non-permitted verbs' do
    ALL_REP_ORDER_ENDPOINTS.each do |endpoint| # for each endpoint
      context "to endpoint #{endpoint}" do
        FORBIDDEN_REP_ORDER_VERBS.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
          it "#{api_verb.upcase} should return a status of 405" 

        end
      end
    end
  end

  describe "POST #{endpoint(:representation_orders)}" do

    def post_to_create_endpoint(submission_date = Date.new(2017, 7, 1))
      Timecop.freeze(submission_date) { post endpoint(:representation_orders), valid_params, format: :json }
    end

    include_examples "should NOT be able to amend a non-draft claim"

    context 'when representation_order params are valid' do
      it "should create fee, return 201 and expense JSON output including UUID" 


      it "should create one new representation_order" 


      context 'MAAT reference' do
        context 'when case type requires MAAT reference' do
          before { claim.case_type.update_column(:requires_maat_reference, true) }

          it 'creates a new representation_order record with all provided attributes' 

        end

        context 'when case type does not require MAAT reference' do
          before { claim.case_type.update_column(:requires_maat_reference, false) }

          it 'creates a new representation_order record with all provided attributes' 

        end
      end
    end

    context 'when params are invalid' do
      context 'invalid API key' do
        include_examples "invalid API key create endpoint"
      end

      context 'missing defendant id' do
        it 'should return 400 and a JSON error array' 

      end

      context 'invalid defendant id' do
        it 'should return 400 and a JSON error array' 

      end
    end

    context 'when a claim has been submitted with an AGFS scheme 10 offence' do
      let(:claim) { create(:claim, create_defendant_and_rep_order: false, source: 'api', offence: create(:offence, :with_fee_scheme_ten)) }
      let(:defendant) { create(:defendant, :without_reporder, claim: claim).reload }

      before do
        allow(Settings).to receive(:agfs_fee_reform_release_date).and_return(Date.new(2018, 4, 1))
        claim.defendants << defendant
      end

      describe 'and the rep_order_date pre-dates the start of the scheme' do
        let(:representation_order_date) { Date.new(2018, 3, 1) }

        before { post_to_create_endpoint(Date.new(2018, 5, 1)) }

        specify { expect_error_response("Representation Order Date is not valid for AGFS scheme ten") }
      end

      describe 'and the rep_order_date post-dates the start of the scheme' do
        let(:representation_order_date) { Date.new(2018, 4, 1) }

        specify { expect{ post_to_create_endpoint(Date.new(2018, 5, 1)) }.to change { RepresentationOrder.count }.by(1) }
      end
    end
  end

  describe "POST #{endpoint(:representation_orders, :validate)}" do

    def post_to_validate_endpoint
      post endpoint(:representation_orders, :validate), valid_params, format: :json
    end

   it 'valid requests should return 200 and String true' 
    it 'missing required params should return 400 and a JSON error array' 


    it 'invalid claim id should return 400 and a JSON error array' 


    it 'returns 400 and JSON error when dates are not in acceptable format' 


  end

end

