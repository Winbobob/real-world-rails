require 'rails_helper'

module Remote
  describe Claim do

    let(:user) { double ::Remote::User }
    let(:query) { { 'my_query_key' => 'my query value' } }

    describe '.resource_path' do
      it 'returns resource path' 

    end

    describe '.user_allocations' do
      it 'calls all by status' 

    end

    describe '.allocated' do
      it 'calls all by status' 

    end

    describe '.unallocated' do
      it 'calls all by status' 

    end

    describe '.archived' do
      it 'calls all by status' 

    end

    describe 'all_by_status'do
      let(:claim_collection) { double 'Claim Collection', map: 'mapped_collection' }
      let(:user) { double Remote::User, api_key: 'my_api_key' }
      let(:query_params) do
        {
          'my_query_key' => 'my query value',
          api_key: 'my_api_key',
          status: 'current'
        }
      end

      it 'calls HttpClient to make the query' 

    end
  end
end

