require 'spec_helper'

module Spree
  class GatewayWithPassword < PaymentMethod
    preference :password, :string, default: 'password'
  end

  describe Admin::PaymentMethodsController, type: :controller do
    stub_authorization!

    let(:payment_method) { GatewayWithPassword.create!(name: 'Bogus', preferred_password: 'haxme') }

    # regression test for #2094
    it 'does not clear password on update' 


    it 'saves payment method preferences on update' 


    context 'tries to save invalid payment' do
      it "doesn't break, responds nicely" 

    end

    it 'can create a payment method of a valid type' 


    it 'can not create a payment method of an invalid type' 

  end
end

