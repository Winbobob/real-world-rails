require 'rails_helper'
require 'api_spec_helper'
require_relative 'shared_examples_for_all'

RSpec.describe API::V1::ExternalUsers::Expense do
  include Rack::Test::Methods
  include ApiSpecHelper

  ALL_EXPENSE_ENDPOINTS = [endpoint(:expenses, :validate), endpoint(:expenses)]

  FORBIDDEN_EXPENSE_VERBS = [:get, :put, :patch, :delete]

  let(:parsed_body) { JSON.parse(last_response.body) }

  describe "v2" do
    let!(:provider)       { create(:provider) }
    let!(:claim)          { create(:claim, source: 'api').reload }
    let!(:expense_type)   { create(:expense_type, :car_travel) }

    let!(:params) do
      {
        api_key: provider.api_key,
        claim_id: claim.uuid,
        expense_type_id: expense_type.id,
        amount: 500.79,
        location: 'London',
        distance: 300.58,
        reason_id: 5,
        reason_text: "Foo",
        mileage_rate_id: 1,
        date: "2018-04-01T12:30:00"
      }
    end

    let(:json_error_response) do
      [
        {"error" => "Choose a type for the expense"},
        {"error" => "Enter a quantity for the expense"},
        {"error" => "Enter a rate for the expense"}
      ].to_json
    end

    context 'sending non-permitted verbs' do
      ALL_EXPENSE_ENDPOINTS.each do |endpoint| # for each endpoint
        context "to endpoint #{endpoint}" do
          FORBIDDEN_EXPENSE_VERBS.each do |api_verb| # test that each FORBIDDEN_VERB returns 405
            it "#{api_verb.upcase} should return a status of 405" 

          end
        end
      end
    end

    # Constant so we can refer to it outside of "it" blocks
    EXPENSE_FIELDS_AND_ERRORS = {
      amount: "Enter an amount for the expense",
      claim_id: "Claim cannot be blank",
      date: "Enter a date for the expense",
      expense_type_id: "Choose a type for the expense",
      reason_id: "Enter a reason for the expense",
      distance: "Enter the distance for the expense"
    }

    describe "POST #{endpoint(:expenses)}" do
      def post_to_create_endpoint
        post endpoint(:expenses), params, format: :json
      end

      include_examples "should NOT be able to amend a non-draft claim"

      context 'when expense params are valid' do

        it "should create expense, return 201 and expense JSON output including UUID" 


        it "should create one new expense" 


        it "should create a new record using the params provided" 

      end

      context 'expense_type_unique_code' do
        let(:unique_code) { expense_type.unique_code }

        it 'should create a new expense record with a expense type specified by unique code' 

      end

      context 'when expense params are invalid' do
        context 'invalid API key' do
          let(:valid_params) { params }
          include_examples "invalid API key create endpoint"
        end

        context "missing expected params" do
          EXPENSE_FIELDS_AND_ERRORS.each do |field, expected_message|
            it "should give the correct error message when #{field} is blank" 

          end
        end

        context 'mutually exclusive params expense_type_id and expense_type_unique_code' do
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

        context 'invalid expense_type_unique_code' do
          it 'should return 400 and a JSON error if no expense type was found' 

        end
      end

    end

    describe "POST #{endpoint(:expenses, :validate)}" do
      def post_to_validate_endpoint
        post endpoint(:expenses, :validate), params, format: :json
      end

      it 'valid requests should return 200 and String true' 


      context 'invalid API key' do
        let(:valid_params) { params }
        include_examples "invalid API key validate endpoint"
      end

      context "missing expected params" do
        EXPENSE_FIELDS_AND_ERRORS.each do |field, expected_message|
          it "should give the correct error message when #{field} is blank" 

        end
      end

      it 'invalid claim id should return 400 and a JSON error array' 

    end
  end
end

