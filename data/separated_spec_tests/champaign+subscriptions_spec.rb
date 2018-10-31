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
           created_at: Time.now,
           next_possible_charge_date: Date.tomorrow)
  end
  let!(:subscription) do
    create(:payment_go_cardless_subscription,
           customer: customer,
           payment_method: payment_method,
           id: 1234,
           go_cardless_id: '13243',
           amount: '5.0',
           currency: 'USD',
           name: nil,
           created_at: Date.today)
  end
  let(:last_month) { 1.month.ago }
  let!(:cancelled_subscription) do
    create(:payment_go_cardless_subscription,
           customer: customer,
           payment_method: payment_method,
           id: 12_345_678,
           go_cardless_id: '11323',
           amount: '5.0',
           currency: 'USD',
           name: nil,
           created_at: last_month,
           cancelled_at: last_month)
  end
  let!(:transaction) do
    create(:payment_go_cardless_transaction,
           subscription: subscription,
           customer: customer,
           go_cardless_id: 999,
           amount: 4,
           currency: 'GBP',
           charge_date: Date.tomorrow,
           payment_method: payment_method)
  end

  before :each do
    member.create_authentication(password: 'password')
  end

  def auth_headers
    token = encode_jwt(member.token_payload)
    { authorization: "Bearer #{token}" }
  end

  describe 'GET index' do
    it 'returns subscriptions with nested transactions and payment method' 


    it 'does not show subscriptions that have been marked as cancelled' 

  end

  describe 'DELETE destroy' do
    let!(:delete_subscription) do
      create(:payment_go_cardless_subscription,
             customer: customer,
             payment_method: payment_method,
             id: 93_829,
             go_cardless_id: 'SB00003GHBQ3YF',
             amount: '5.0',
             currency: 'USD',
             name: nil,
             cancelled_at: nil,
             created_at: Date.today)
    end

    let!(:nonexistent_subscription) do
      create(:payment_go_cardless_subscription,
             customer: customer,
             payment_method: payment_method,
             go_cardless_id: 'idontexist')
    end

    it 'cancels the subscription on GoCardless and marks the local subscription as cancelled' 


    it 'returns errors and does not update the local record if GoCardless returns an error' 


    it 'pushes a cancelled subscription event to the event queue' 

  end
end

