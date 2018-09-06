RSpec.describe RemoveSolrCollectionJob do
  let(:collection) { 'x' }
  let(:connection_options) { double }
  let(:connection) { double }

  before do
    # Stub connection_options to respond with itself when without('adapter') called
    allow(connection_options).to receive(:without).with('adapter').and_return(connection_options)
  end

  it 'destroys the solr collection' 

end

