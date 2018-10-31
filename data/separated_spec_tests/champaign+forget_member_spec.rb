# frozen_string_literal: true

require 'rails_helper'

describe ForgetMember do
  let(:member_attributes) do
    {
      more: { 'foo' => 'bar' },
      email: 'foo@example.com',
      actionkit_user_id: '123',
      address1: 'one',
      address2: 'two',
      postal: '1234',
      first_name: 'Foo',
      last_name: 'Bar'
    }
  end

  let(:member) { create(:member, member_attributes) }
  let!(:action) { create(:action, member: member, form_data: { name: 'Boo' }) }
  let!(:authentication) { create(:member_authentication, member: member) }
  let(:braintree_customer) { create(:payment_braintree_customer, email: 'foo@example.com', member: member) }
  let!(:payment_method) {
    create(:payment_braintree_payment_method,
           customer: braintree_customer,
           email: 'foo@example.com')
  }

  context 'success' do
    it 'anonymises member' 


    it 'anonymises actions' 


    it 'destroys authentication' 


    it 'anonymises braintree customer' 


    it 'anonymises braintree payment method' 

  end

  context 'failure' do
    it 'rolls back if a step is unsuccessful' 

  end
end

