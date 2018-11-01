require 'rails_helper'
require 'api_spec_helper'

RSpec.describe API::V2::MI::InjectionErrors do
  include Rack::Test::Methods
  include ApiSpecHelper
  include DatabaseHousekeeping
  include ActiveSupport::Testing::TimeHelpers

  let(:case_worker_admin) { create(:case_worker, :admin) }
  let(:external_user) { create(:external_user) }
  let(:default_params) { { api_key: api_key } }
  let(:params) { default_params }

  describe 'GET injection_errors' do
    def do_request
      get '/api/mi/injection_errors', params, format: :json
    end

    context 'when accessed by a CaseWorker' do
      let(:api_key) { case_worker_admin.user.api_key }

      before do
        seed_injection_data
        do_request
      end

      context 'and there is no data available' do
        let(:seed_injection_data) do
          # in this case does nothing, just a placeholder
        end

        context 'and no output format is provided' do
          let(:params) { default_params }

          it 'returns success' 


          it 'returns JSON' 


          it 'returns an empty response' 

        end

        context 'and JSON is requested as the output format' do
          let(:params) { default_params.merge(format: 'json') }

          it 'returns success' 


          it 'returns JSON' 


          it 'returns an empty response' 

        end

        context 'and CSV is requested as the output format' do
          let(:params) { default_params.merge(format: 'csv') }

          it 'returns success' 


          it 'returns JSON' 


          it 'returns a file with just the headers' 

        end
      end

      context 'when data is available' do
        let!(:yesterday_successful_injections) {
          travel_to(1.day.ago.utc) do
            create_list(:injection_attempt, 3)
          end
        }
        let!(:yesterday_failed_injections) {
          travel_to(1.day.ago.utc) do
            [
              create_list(:injection_attempt, 5, :with_errors),
              create_list(:injection_attempt, 2, :with_errors,
                          error_messages: { errors: [ { error: "Cannot calculate the fee BLA" } ] }),
              create_list(:injection_attempt, 1, :with_errors,
                          error_messages: { errors: [ { error: "The supplier account code ..." } ] }),
            ]
          end
        }
        let!(:yesterday_injections) { yesterday_successful_injections + yesterday_failed_injections }
        let(:yesterday_injection_categories) { %w[SUPPLIER_NUMBER#INVALID_ERROR FEE#CALCULATION_ERROR UNCATEGORIZED_ERROR] }
        let(:older_date) { 2.months.ago.to_date }
        let!(:older_date_successful_injections) {
          travel_to(older_date) do
            create_list(:injection_attempt, 2)
          end
        }
        let!(:older_date_failed_injections) {
          travel_to(older_date) do
            [
              create_list(:injection_attempt, 1, :with_errors),
              create_list(:injection_attempt, 3, :with_errors,
                          error_messages: { errors: [ { error: "No defendant found for Rep Order Number BLA" } ] }),
              create_list(:injection_attempt, 1, :with_errors,
                          error_messages: { errors: [ { error: "Expense Date Incurred ..." } ] }),
              create_list(:injection_attempt, 2, :with_errors,
                          error_messages: { errors: [ { error: "A claim already exists for these case details" } ] }),
            ]
          end
        }
        let!(:older_date_injections) { older_date_successful_injections + older_date_failed_injections }
        let(:older_date_injection_categories) { %w[REP_ORDER#DEFENDANT_NOT_FOUND EXPENSE#DATE_INCURRED_ERROR CLAIM#ALREADY_EXISTS_ERROR UNCATEGORIZED_ERROR] }
        let(:seed_injection_data) {
          [yesterday_injections, older_date_injections]
        }

        context 'with no date provided' do
          it 'returns success' 


          it 'returns JSON' 


          it 'retrieves injection errors data from the previous day' 


          context 'and with CSV output format' do
            let(:params) { default_params.merge(format: 'csv') }

            it 'returns success' 


            it 'returns JSON' 


            it 'returns a file with the headers and the data retrieved' 

          end
        end

        context 'with a date provided' do
          let(:params) { default_params.merge(date: older_date.to_s(:db)) }

          it 'returns success' 


          it 'returns JSON' 


          it 'retrieves injection errors data from the provided date' 


          context 'and with CSV output format' do
            let(:params) { default_params.merge(date: older_date.to_s(:db), format: 'csv') }

            it 'returns success' 


            it 'returns JSON' 


            it 'returns a file with the headers and the data retrieved' 

          end
        end
      end
    end

    context 'when accessed by an user that has no permissions' do
      let(:api_key) { external_user.user.api_key }

      it 'returns unauthorised' 

    end
  end
end

