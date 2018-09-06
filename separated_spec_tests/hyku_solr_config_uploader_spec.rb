RSpec.describe SolrConfigUploader do
  let(:config_dir) { Rails.root.join('solr', 'config') }

  subject { described_class.new('solr_config_uploader_test') }

  describe 'round-tripping data to zookeeper' do
    before do
      subject.delete_all
    end

    it 'creates a path in zookeeper' 

  end
end

