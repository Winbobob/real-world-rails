require 'rails_helper'

module Remote
  describe Remote::CaseWorker do
    describe '.resource_path' do
      it 'returns case_wokers' 

    end
  end

  describe '.all' do
    let(:user) { double Remote::User, api_key: 'my_api_key' }
    let(:query) { { 'query_key' => 'query value'} }
    let(:case_worker_collection) { double 'CaseWorker Collection', map: 'mapped_collection' }

    it 'calls HttpClient to make the query' 

  end
end

