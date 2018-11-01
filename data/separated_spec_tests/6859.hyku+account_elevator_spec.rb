RSpec.describe AccountElevator do
  subject { described_class.new(nil) }

  let(:request) { double(host: 'example.com') }
  let(:bad_request) { double(host: 'new.example.com') }
  let!(:account) { FactoryBot.create(:account, cname: 'example.com') }

  describe '#parse_tenant_name' do
    it 'retrieves the tenant name for the account' 


    it 'returns nil if no tenant is found' 

  end
end

