require 'rails_helper'
require 'api_spec_helper'
require 'support/claim_api_endpoints'

describe API::V2::CaseWorkers::Claim do
  include Rack::Test::Methods
  include ApiSpecHelper
  include DatabaseHousekeeping

  after(:all) { clean_database }

  let(:get_claims_endpoint) { '/api/case_workers/claims' }
  let(:case_worker) { create(:case_worker) }
  let(:external_user) { create(:external_user) }
  let(:pagination) { {} }
  let(:params) do
    {
      api_key: case_worker.user.api_key
    }.merge(pagination)
  end

  def do_request(my_params = params)
    get get_claims_endpoint, my_params, format: :json
  end

  describe 'GET claims' do
    it 'should return 406 Not Acceptable if requested API version via header is not supported' 


    it 'should require an API key' 


    it 'should return a JSON with the required information' 


    context 'when accessed by a ExternalUser' do
      before { do_request(api_key: external_user.user.api_key )}

      it 'returns unauthorised' 

    end

    context 'filtering the correct dataset' do
      before(:all) do
        @lgfs_sub_ff_vb10 = create_lgfs_submitted_fixed_fee
        @lgfs_sub_ff_vb20 = create_lgfs_submitted_fixed_fee_vb20
        @lgfs_sub_gf_vb10 = create_lgfs_submitted_grad_fee
        @lgfs_sub_gf_vb30 = create_lgfs_submitted_grad_fee_vb30
      end

      after(:all) { clean_database }

      let(:params) do
        {
          api_key: case_worker.user.api_key,
          direction: 'asc',
          filter: 'all',
          limit: 25,
          page: 0,
          scheme: 'lgfs',
          search: '',
          sorting: 'last_submitted_at',
          status: 'unallocated',
          value_band_id: 0
        }
      end

      it 'returns all lgfs_claims' 


      it 'returns only lgfs claims in value band 10' 


      it 'returns all lgfs fixed fee claims' 


      it 'returns all graduated fee claims' 



      def do_request_and_extract_claim_ids(my_params = params)
        response = do_request(my_params)
        body = JSON.parse(response.body, symbolize_names: true)
        body[:items].map{ |item| item[:id] }
      end

      def create_lgfs_submitted_fixed_fee
        create :litigator_claim, :submitted, :fixed_fee
      end

      def create_lgfs_submitted_fixed_fee_vb20
        claim = create_lgfs_submitted_fixed_fee
        create(:fixed_fee, :lgfs, claim: claim, amount: 25_000.0)
        claim.save!
        claim
      end

      def create_lgfs_submitted_grad_fee
        create :litigator_claim, :submitted, :graduated_fee
      end

      def create_lgfs_submitted_grad_fee_vb30
        claim = create_lgfs_submitted_grad_fee
        create(:graduated_fee, claim: claim, amount: 125_000.0)
        claim.save!
        claim
      end
    end


    context 'pagination' do
      def pagination_details(response)
        JSON.parse(response.body, symbolize_names: true).fetch(:pagination)
      end

      context 'default' do
        it 'should paginate with default values' 

      end

      context 'custom values' do
        let(:pagination) { { limit: 5, page: 3 } }

        it 'should paginate with default values' 

      end
    end
  end
end

