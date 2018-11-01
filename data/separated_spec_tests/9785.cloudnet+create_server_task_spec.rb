require 'rails_helper'
require 'stripe'

describe CreateServerTask do
  before do
    @user     = FactoryGirl.create(:user_onapp)
    @account  = @user.account
    @wizard   = FactoryGirl.create(:server_wizard, :with_wallet, user: @user)
    @card     = @wizard.card
    @invoice  = Invoice.generate_prepaid_invoice([@wizard], @account)
    @initial_balance = @account.wallet_balance
    @payment_receipts = @account.payment_receipts.with_remaining_cost

    allow_any_instance_of(CreateServer).to receive_messages(process: { 'id' => '12345' })
    allow(MonitorServer).to receive(:perform_async).and_return(true)
    server_double = double('Server', id: 123, destroy: true, provisioner_role: 'ping', update_attribute: true, validation_reason: 0, sift_server_properties: {})
    allow(server_double).to receive(:monitor_and_provision).and_return(true)
    allow_any_instance_of(ServerWizard).to receive_messages(save_server_details: server_double)
  end
  
  describe 'Using Wallet funds' do
    it 'should debit funds from Wallet for the full amount' 


    it 'should not build server if Wallet could not be charged' 

    
    it 'should refund Wallet funds if Server could not be created' 


    it 'should debit Wallet for a partial amount if there are credit notes with remaining balances' 


    it 'should debit Wallet for the full amount if there are credit notes with no remaining balances' 


    it 'should not debit from Wallet if there are credit notes with remaining balances larger than amount' 

  end

  describe 'Creating Server' do
    it 'should not have any errors and not do any credit note refunds if server succeeds' 

 
    it 'should fail if the server comes back with nil' 


    it 'should fail if the server comes back with no remote ID' 


    it 'should fail if the server throws a Faraday error' 


    it 'should succeed if nothing fails' 

  end

  describe 'Destroying Server' do
    it "should generate a credit note for time remaining until the server's next invoice" 

  end

  describe 'Charging Wallet' do
    it 'should not do any refunds if Wallet debit succeeds' 


    it 'should do a credit note refund if Wallet debit fails' 

  end

  describe 'Creating Charges' do
    it 'should create one charge for Wallet if there are no credit notes used' 


    it 'should create no charges for billing card if there are Wallet used for entire payment' 


    it 'should create Wallet charges if there are credit notes used for partial payment' 

    
    it 'should create events at Sift' 

  end
end

