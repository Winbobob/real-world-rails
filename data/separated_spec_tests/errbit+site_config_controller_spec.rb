describe SiteConfigController, type: 'controller' do
  it_requires_admin_privileges for: {
    index:  :get,
    update: :put
  }

  let(:admin) { Fabricate(:admin) }

  before { sign_in admin }

  describe '#index' do
    it 'has an index action' 

  end

  describe '#update' do
    it 'updates' 


    it 'redirects to the index' 


    it 'flashes a confirmation' 


    it 'updates apps that are using site wide notice fingerprinter' 

  end
end

