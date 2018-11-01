# frozen_string_literal: true

require 'rails_helper'

describe 'API::Stateless GoCardless PaymentMethods' do
  include Requests::RequestHelpers
  include AuthToken
  let!(:member) { create(:member, email: 'test@example.com') }
  let!(:customer) { create(:payment_go_cardless_customer, member: member) }

  before :each do
    member.create_authentication(password: 'password')
  end

  def auth_headers
    token = encode_jwt(member.token_payload)
    { authorization: "Bearer #{token}" }
  end

  describe 'GET index' do
    let!(:payment_method) do
      create(:payment_go_cardless_payment_method,
             customer: customer,
             id: 1432,
             go_cardless_id: 9898,
             scheme: 'bacs',
             next_possible_charge_date: Date.tomorrow,
             created_at: Time.now)
    end
    let!(:cancelled_method) do
      create(:payment_go_cardless_payment_method,
             customer: customer,
             go_cardless_id: 'asdfgf',
             cancelled_at: 1.month.ago)
    end

    it 'returns list of active payment methods for member' 


    it 'does not return payment methods that have been cancelled' 

  end

  describe 'DELETE destroy' do
    let!(:delete_me) do
      create(:payment_go_cardless_payment_method,
             customer: customer,
             id: 123,
             go_cardless_id: 'MD0000T982CR19',
             scheme: 'bacs',
             next_possible_charge_date: Date.tomorrow,
             created_at: Time.now)
    end

    let!(:i_dont_exist) do
      create(:payment_go_cardless_payment_method,
             customer: customer,
             id: 3490,
             go_cardless_id: 'nosuchthingongocardless',
             scheme: 'bacs',
             next_possible_charge_date: Date.tomorrow,
             created_at: Time.now)
    end

    let(:last_month) { 1.month.ago }

    let!(:subscription_a) do
      create(:payment_go_cardless_subscription,
             customer: customer,
             created_at: last_month,
             cancelled_at: nil,
             payment_method: delete_me)
    end

    let!(:subscription_b) do
      create(:payment_go_cardless_subscription,
             customer: customer,
             created_at: last_month,
             cancelled_at: last_month,
             payment_method: delete_me)
    end

    let!(:subscription_c) do
      create(:payment_go_cardless_subscription,
             customer: customer,
             created_at: last_month,
             cancelled_at: nil,
             payment_method: create(:payment_go_cardless_payment_method))
    end

    it 'cancels the mandate on GoCardless and sets the cancelled_at field in the local record' 


    it 'marks active subcriptions with that method cancelled, but does not update cancelled subscriptions' 


    it 'returns errors and does not update the local record if GoCardless returns an error' 

  end
end

