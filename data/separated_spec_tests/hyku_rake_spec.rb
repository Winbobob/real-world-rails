require 'rake'

RSpec.describe "Rake tasks" do
  before(:all) do
    Rails.application.load_tasks
  end

  describe "superadmin:grant" do
    let!(:user1) { FactoryGirl.create(:user) }
    let!(:user2) { FactoryGirl.create(:user) }

    before do
      user1.remove_role :superadmin
      user2.remove_role :superadmin
    end

    it 'requires user_list argument' 


    it 'warns when a user is not found' 


    it 'grants a single user the superadmin role' 


    it 'grants a multiple users the superadmin role' 

  end

  describe 'tenantize:task' do
    # Creating full-fledged accounts because switching into a factory
    # account leads to: One of the following schema(s) is invalid:
    # "3af179cd-d433-43ab-9a53-23c38750cf45" "public"
    # This is expensive.
    before(:all) do
      CreateAccount.new(Account.new(name: 'first')).save
      CreateAccount.new(Account.new(name: 'second')).save
    end
    after(:all) do
      Account.find_by(name: 'first').destroy
      Account.find_by(name: 'second').destroy
    end
    before do
      # This omits a tenant that appears automatically created and is not switch-intoable
      allow(Account).to receive(:tenants).and_return(accounts)
    end
    let(:accounts) { Account.where(name: ['first', 'second']) }
    let(:task) { double('task') }

    it 'requires at least one argument' 

    it 'requires first argument to be a valid rake task' 

    it 'runs against all tenants' 

    context 'when run against specified tenants' do
      let(:accounts) { [account] }
      let(:account) { Account.find_by(name: 'first') }

      before do
        ENV['tenants'] = "garbage_value #{account.cname} other_garbage_value"
      end
      after do
        ENV.delete('tenants')
      end
      it 'runs against a single tenant and ignores bogus tenants' 

    end
  end
end

