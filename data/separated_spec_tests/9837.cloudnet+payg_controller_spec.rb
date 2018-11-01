require 'rails_helper'

RSpec.describe PaygController, :type => :controller do
  
  before(:each) { 
    sign_in_onapp_user 
    @billing_card = FactoryGirl.create(:billing_card, account: @current_user.account)
    @billing_card.update primary: true, fraud_verified: true
  }
  
  describe '#add_funds' do
    it 'should render add funds' 

  end
  
  describe '#confirm_card_payment' do
    it 'should render card confirm content' 

    
    it 'should not render card confirm content' 

    
  end
  
  describe '#card_payment' do
    before(:each) do
      @payments = double(Payments, auth_charge: { charge_id: 12_345 }, capture_charge: { charge_id: 12_345 })
      allow(Payments).to receive_messages(new: @payments)
    end
    
    it 'should not process Wallet top-up because not fraud safe' 

    
    it 'should process Wallet top-up using card payment' 

    
    it 'should not process if billing card not present' 

    
    it 'should raise Stripe error' 

    
    it 'should mark invoices as paid on top-up' 

    
    it 'should render on error' 

  end
  
  describe '#paypal_request' do    
    it 'should redirect to paypal' do      
      @payg_topup_paypal_request_task = double(PaygTopupPaypalRequestTask, process: true, popup_uri: 'https://www.sandbox.paypal.com/incontext?token=12345')
      allow(PaygTopupPaypalRequestTask).to receive_messages(new: @payg_topup_paypal_request_task)
      
      get :paypal_request, { amount: '5' }
      expect(@payg_topup_paypal_request_task).to have_received(:process)
      expect(@payg_topup_paypal_request_task).to have_received(:popup_uri)
      expect(response).to redirect_to('https://www.sandbox.paypal.com/incontext?token=12345')
    end
    
    it 'should render paypal request' 

  end
  
  describe '#paypal_success' do
    it 'should process PaygTopupPaypalResponseTask' 

  end
  
  describe '#paypal_failure' do
    it 'should render paypal failure' do      
      get :paypal_failure
      expect(response).to be_success
      expect(response).to render_template('payg/_paypal_failure')
    end
  end
  
end

