# frozen_string_literal: true
require 'rails_helper'

describe 'API::Stateless GoCardless Subscriptions' do
  include Requests::RequestHelpers
  include AuthToken

  let!(:member) { create(:member, email: 'test@example.com') }
  let!(:customer) do
    create(:payment_go_cardless_customer,
           member: member,
           go_cardless_id: '1337',
           email: 'test@example.com',
           country_code: 'US',
           language: 'en')
  end
  let!(:payment_method) do
    create(:payment_go_cardless_payment_method,
           id: 321,
           go_cardless_id: 1_234_566,
           customer: customer,
           scheme: 'sepa_core',
           created_at: Time.now)
  end
  let!(:subscription) do
    create(:payment_go_cardless_subscription,
           customer: customer,
           payment_method: payment_method,
           created_at: Time.now)
  end
  let!(:subscription_transaction) do
    create(:payment_go_cardless_transaction,
           subscription: subscription,
           customer: customer,
           go_cardless_id: 999,
           amount: 4,
           currency: 'GBP',
           charge_date: Date.tomorrow,
           payment_method: payment_method)
  end
  let!(:one_off_transaction) do
    create(:payment_go_cardless_transaction,
           go_cardless_id: 1_234_546,
           customer: customer,
           payment_method: payment_method,
           amount: 15.5,
           currency: 'EUR',
           charge_date: Date.today)
  end

  before :each do
    member.create_authentication(password: 'password')
  end

  def auth_headers
    token = encode_jwt(member.token_payload)
    { authorization: "Bearer #{token}" }
  end

  def first_transaction
    json_hash.first.deep_symbolize_keys!
  end

  describe 'GET index' do
    it 'returns a list of one-off transactions with their payment methods' 


    it 'does not list transactions that are associated with subscriptions' 

  end
end

