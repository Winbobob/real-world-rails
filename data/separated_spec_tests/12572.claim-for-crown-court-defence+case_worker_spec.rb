require 'rails_helper'

describe API::V2::CaseWorker do
  include Rack::Test::Methods

  after(:all) { clean_database }

  let(:get_case_workers_endpoint) { '/api/case_workers' }
  let(:case_workers) { create_list(:case_worker, 3) }
  let(:external_user) { create(:external_user) }
  let(:sorting) { {} }
  let(:params) do
    {
      api_key: api_key
    }.merge(sorting)
  end
  let(:api_key) { case_workers.first.user.api_key }

  def do_request
    get get_case_workers_endpoint, params, format: :json
  end

  describe 'GET case workers' do
    it 'should return 406 Not Acceptable if requested API version via header is not supported' 


    it 'should require an API key' 


    context 'when accessed by a ExternalUser' do
      let(:api_key) { external_user.user.api_key }

      it 'returns unauthorised' 

    end

    it 'should return a JSON with the required information' 


    context 'sorting' do
      def get_case_workers_ids
        response = do_request
        body = JSON.parse(response.body, symbolize_names: true)
        body.map { |cw| cw[:id] }
      end

      context 'default' do
        it 'should sort by ID ASC by default' 

      end

      context 'custom sorting' do
        let(:sorting) { {sorting: 'id', direction: 'desc'} }

        it 'should sort with specified params' 

      end
    end
  end
end

