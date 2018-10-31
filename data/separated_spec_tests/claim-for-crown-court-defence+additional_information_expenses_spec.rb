require 'rails_helper'
require 'api_spec_helper'

RSpec.describe API::V2::MI::AdditionalInformationExpenses do
  include Rack::Test::Methods
  include ApiSpecHelper
  include DatabaseHousekeeping
  include ActiveSupport::Testing::TimeHelpers

  let(:case_worker_admin) { create(:case_worker, :admin) }
  let(:external_user) { create(:external_user) }
  let(:default_params) { { api_key: api_key, start_date: start_date, end_date: end_date } }
  let(:invalid_params) { { api_key: api_key, start_date: '--', end_date: '31 Jan 2018' } }
  let(:missing_params) { { api_key: api_key } }
  let(:params) { default_params }
  let(:start_date) { Date.new(2018, 01, 01).to_s(:db) }
  let(:end_date) { Date.new(2018, 01, 31).to_s(:db) }
  let(:create_data?) { false }
  let(:run_date) { Date.today }

  describe 'GET additional_travel_expense_information' do
    def populate_expense_data
      Claim::BaseClaim.delete_all
      travel_to(Date.new(2018, 01, 15)) do
        create(:litigator_claim, :submitted, travel_expense_additional_information: Faker::Lorem.paragraph(1)) do |lgfs_claim|
          create(:expense, :with_calculated_distance, date: 3.days.ago, claim: lgfs_claim)
        end
        create(:litigator_claim, :submitted, travel_expense_additional_information: Faker::Lorem.paragraph(1)) do |lgfs_claim|
          create(:expense, date: 3.days.ago, claim: lgfs_claim)
        end
      end
      travel_to(Date.new(2018, 02, 14)) do
        create(:litigator_claim, :submitted, travel_expense_additional_information: Faker::Lorem.paragraph(1)) do |lgfs_claim|
          create(:expense, :with_calculated_distance, date: 3.days.ago,claim: lgfs_claim)
        end
        create(:litigator_claim, :submitted, travel_expense_additional_information: Faker::Lorem.paragraph(1)) do |lgfs_claim|
          create(:expense, :with_calculated_distance_decreased, date: 3.days.ago,claim: lgfs_claim)
        end
        create(:litigator_claim, :submitted, travel_expense_additional_information: Faker::Lorem.paragraph(1)) do |lgfs_claim|
          create(:expense, date: 4.days.ago,claim: lgfs_claim)
        end
      end
    end

    def do_request
      populate_expense_data if create_data?
      travel_to(run_date) do
        get '/api/mi/additional_travel_expense_information', params, format: :json
      end
    end

    context 'when accessed by a CaseWorker' do
      let(:api_key) { case_worker_admin.user.api_key }

      before do
        do_request
      end

      context 'and there is no data available' do
        context 'and dates are in the wrong format' do
          let(:params) { invalid_params }

          it 'returns an error' 


          it 'returns a specific error message' 

        end

        context 'and dates are not provided' do
          let(:params) { missing_params }

          it 'returns an error' 


          it 'returns an empty array' 

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
        let(:create_data?) { true }

        it 'returns success' 


        it 'returns JSON' 


        it 'retrieves travel expense data from the provided date' 


        context 'and no date provided' do
          let(:params) { missing_params }

          let(:run_date) { Date.new(2018, 02, 15) }

          it 'retrieves yesterdays data (14 Feb 2018' 

        end

        context 'and with CSV output format' do
          let(:params) { default_params.merge(format: 'csv') }

          it 'returns success' 


          it 'returns CSV' 


          it 'returns a file with the headers and the data retrieved' 

        end
      end
    end

    context 'when accessed by an user that has no permissions' do
      let(:api_key) { external_user.user.api_key }

      it 'returns unauthorised' 

    end
  end
end

