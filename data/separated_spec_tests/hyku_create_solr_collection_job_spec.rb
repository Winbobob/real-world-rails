RSpec.describe CreateSolrCollectionJob do
  let(:account) { FactoryGirl.create(:account) }
  let(:client) { double }

  before do
    allow(Blacklight.default_index).to receive(:connection).and_return(client)
  end

  describe '#perform' do
    it 'creates a new collection for an account' 


    it 'is idempotent' 

  end

  describe CreateSolrCollectionJob::CollectionOptions do
    describe '#to_h' do
      subject { described_class.new(data).to_h }

      let(:data) do
        {
          collection: { config_name: 'hyku', blank: '' },
          num_shards: 1,
          replication_factor: 5,
          rule: 'asdf',
          blank: ''
        }
      end

      it 'removes blank values' 


      it 'collapses nested hashes' 


      it 'camelizes key values' 

    end
  end
end

