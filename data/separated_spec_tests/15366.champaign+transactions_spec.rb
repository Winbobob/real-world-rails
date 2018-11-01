# frozen_string_literal: true
require 'rails_helper'

describe 'API::Stateless Braintree Transactions' do
  include Requests::RequestHelpers
  include AuthToken

  let!(:member) { create(:member, email: 'test@example.com') }
  let!(:customer) { create(:payment_braintree_customer, member: member) }
  let!(:payment_method) do
    create(:payment_braintree_payment_method,
           customer: customer,
           id: 1432,
           instrument_type: 'credit card',
           token: '2ewruo4i5o3',
           last_4: '2454',
           email: customer.email,
           card_type: 'Mastercard')
  end
  let!(:subscription) do
    create(:payment_braintree_subscription,
           customer: customer,
           payment_method: payment_method)
  end
  let!(:subscription_transaction) do
    create(:payment_braintree_transaction,
           subscription: subscription,
           customer: customer,
           payment_method: payment_method)
  end
  let!(:standalone_transaction) do
    create(:payment_braintree_transaction,
           customer: customer,
           payment_method: payment_method,
           amount: 100,
           status: 'failure')
  end

  before :each do
    member.create_authentication(password: 'password')
  end

  def auth_headers
    token = encode_jwt(member.token_payload)
    { authorization: "Bearer #{token}" }
  end

  describe 'GET index' do
    it 'returns a list of stand-alone transactions with their payment methods for member' 


    it 'does not list transactions that are associated with subscriptions' 

  end
end

