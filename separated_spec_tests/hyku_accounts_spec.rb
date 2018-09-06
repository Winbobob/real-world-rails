RSpec.describe 'Accounts administration', multitenant: true do
  context 'as an superadmin' do
    let(:user) { FactoryGirl.create(:superadmin) }
    let(:account) do
      FactoryGirl.create(:account, solr_endpoint_attributes: { url: 'http://localhost:8080/solr' },
                                   fcrepo_endpoint_attributes: { url: 'http://localhost:8080/fcrepo' })
    end

    before do
      login_as(user, scope: :user)
      Capybara.default_host = "http://#{Account.admin_host}"
      allow(Apartment::Tenant).to receive(:switch).with(account.tenant) do |&block|
        block.call
      end
    end

    it 'changes the associated cname' 


    it 'changes the account service endpoints' 

  end
end

