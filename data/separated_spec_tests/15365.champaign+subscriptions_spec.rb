# frozen_string_literal: true

require 'rails_helper'

describe 'API::Stateless Braintree Subscriptions' do
  include Requests::RequestHelpers
  include AuthToken

  let!(:member) { create(:member, email: 'test@example.com') }
  let!(:customer) { create(:payment_braintree_customer, member: member) }
  let!(:payment_method) do
    create(:payment_braintree_payment_method,
           customer: customer,
           instrument_type: 'credit card',
           token: '2ewruo4i5o3',
           last_4: '2454',
           email: customer.email,
           card_type: 'Mastercard')
  end

  let(:month_ago) { 1.month.ago }

  let!(:subscription) do
    create(:payment_braintree_subscription,
           id: 1234,
           customer: customer,
           payment_method: payment_method,
           amount: 4,
           billing_day_of_month: 22,
           created_at: Time.now)
  end

  let!(:cancelled_subscription) do
    create(:payment_braintree_subscription,
           id: 12_345_678,
           customer: customer,
           payment_method: payment_method,
           amount: 4,
           billing_day_of_month: 22,
           created_at: month_ago,
           cancelled_at: month_ago)
  end

  let!(:transaction) do
    create(:payment_braintree_transaction,
           subscription: subscription,
           status: 'failure',
           amount: 100,
           created_at: Time.now)
  end

  before :each do
    member.create_authentication(password: 'password')
  end

  def auth_headers
    token = encode_jwt(member.token_payload)
    { authorization: "Bearer #{token}" }
  end

  describe 'GET index' do
    it 'returns subscriptions with its nested transactions and payment method for member' 


    it 'does not list subscriptions that have been cancelled' 

  end

  describe 'DELETE destroy' do
    let!(:cancel_this_subscription) do
      create(:payment_braintree_subscription, subscription_id: '4ts4r2', customer: customer)
    end

    let!(:no_such_subscription) do
      create(:payment_braintree_subscription, subscription_id: 'nosuchthing', customer: customer)
    end

    it 'marks the local subscription cancelled and deletes it on Braintree' 


    it 'returns success and marks the local subscription cancelled even if does not exist on Braintree' 


    it 'pushes a cancelled subscription event to the event queue' 

  end
end

