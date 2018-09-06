RSpec.describe CreateAccount do
  let(:account) { FactoryGirl.build(:sign_up_account) }

  subject { described_class.new(account) }

  describe '#create_tenant' do
    it 'creates a new apartment tenant' 


    it 'initializes the Site configuration with a link back to the Account' 

  end

  describe '#create_account_inline' do
    it 'runs account creation jobs' 

  end

  describe '#save' do
    let(:resource1) { Account.new(name: 'example') }
    let(:resource2) { Account.new(name: 'example') }
    let(:account1) { CreateAccount.new(resource1) }
    let(:account2) { CreateAccount.new(resource2) }

    before do
      allow(account1).to receive(:create_external_resources).and_return true
      allow(account2).to receive(:create_external_resources).and_return true
    end
    it 'prevents duplicate accounts' 

  end
end

