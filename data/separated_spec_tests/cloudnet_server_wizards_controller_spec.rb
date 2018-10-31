require 'rails_helper'

describe ServerWizardsController do
  
  before(:each) do
    sign_in_onapp_user
    @account  = @current_user.account
    @wizard   = FactoryGirl.create(:server_wizard, :with_wallet, user: @current_user)
    @invoice  = Invoice.generate_prepaid_invoice([@wizard], @account)
    @server   = FactoryGirl.create(:server)
    @payment_receipts = @account.payment_receipts.with_remaining_cost
  end
  
  describe 'creating server' do
    
    context 'before creating' do      
      it 'should preset the server wizard to step 2' 

    end

    context 'submitting a create' do
      before :each do
        allow_any_instance_of(CreateServer).to receive_messages(process: { 'id' => '12345', 'identifier' => 'abc123', 'memory' => 1024, 'cpus' => 2, 'disk_size' => 10 })
        allow(MonitorServer).to receive(:perform_async).and_return(true)
        # allow_any_instance_of(ServerWizard).to receive(:save_server_details).and_return(@server)
        allow_any_instance_of(Account).to receive(:card_fingerprints).and_return(['abcd12345'])
        helpdesk = double('Helpdesk', new_ticket: true)
        allow(Helpdesk).to receive(:new).and_return(helpdesk)
        allow(helpdesk).to receive(:new_ticket).and_return(true)
      end

      it 'should create server using Wallet funds' 

      
      it 'should create server with SSH keys installed' 

      
      it 'should create server and put in validation' 


      it 'should handle errors if creating server fails' 

    end
  end
end

