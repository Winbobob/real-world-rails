describe Api::ConfigController do
  describe 'GET #show' do
    let(:organization) { create(:organization) }
    let(:token) { double :accessible? => true, :acceptable? => true, resource_owner_id: organization.id }

    before do
      allow(controller).to receive(:doorkeeper_token) {token}
    end

    it 'responds with 200' 

  end
end

