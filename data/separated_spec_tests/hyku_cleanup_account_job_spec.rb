RSpec.describe CleanupAccountJob do
  let!(:account) do
    FactoryGirl.create(:account, solr_endpoint_attributes: { collection: 'x' },
                                 fcrepo_endpoint_attributes: { base_path: '/x' },
                                 redis_endpoint_attributes: { namespace: 'x' })
  end

  before do
    allow(RemoveSolrCollectionJob).to receive(:perform_later)
    allow(account.fcrepo_endpoint).to receive(:switch!)
    allow(ActiveFedora.fedora.connection).to receive(:delete)
    allow(Apartment::Tenant).to receive(:drop).with(account.tenant)
  end

  it 'destroys the solr collection' 


  it 'destroys the fcrepo collection' 


  it 'deletes all entries in the redis namespace' 


  it 'destroys the tenant database' 


  it 'destroys the account' 

end

