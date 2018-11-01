require 'spec_helper'

describe 'API V2 Storefront Checkout Spec', type: :request do
  let!(:user)  { create(:user) }
  let!(:token) { Doorkeeper::AccessToken.create!(resource_owner_id: user.id, expires_in: nil) }
  let!(:order) { create(:order_with_line_items, user: user) }
  let(:headers) { { 'Authorization' => "Bearer #{token.token}" } }
  let(:payment) { create(:payment, amount: order.total, order: order) }

  describe 'checkout#next' do
    let(:exec_next) { patch '/api/v2/storefront/checkout/next', headers: headers }

    context 'without line items' do
      before do
        order.line_items.destroy_all
        exec_next
      end

      it 'cannot transition to address without a line item' 

    end

    context 'with line_items and email' do
      before { exec_next }

      it 'can transition an order to the next state' 

    end

    context 'without payment info' do
      before do
        order.update_column(:state, 'payment')
        exec_next
      end

      it 'doesnt advance payment state if order has no payment' 

    end
  end

  describe 'checkout#advance' do
    let(:exec_advance) { patch '/api/v2/storefront/checkout/advance', headers: headers }

    context 'with payment data' do
      before do
        payment
        exec_advance
      end

      it 'advances an order till complete or confirm step' 

    end

    context 'without payment data' do
      before { exec_advance }

      it 'doesnt advance above the payment step' 

    end
  end

  describe 'checkout#complete' do
    let(:exec_complete) { patch '/api/v2/storefront/checkout/complete', headers: headers }

    context 'with payment data' do
      before do
        payment
        exec_complete
      end

      it 'advances an order till complete step' 

    end

    context 'without payment data' do
      before { exec_complete }

      it 'returns errors' 

    end
  end

  describe 'checkout#update' do
    let!(:country_zone) { create(:zone, name: 'CountryZone') }
    let!(:state)        { create(:state) }
    let!(:country)      { state.country }
    # { country_zone.members.create(zoneable: country) }
    let!(:stock_location) { create(:stock_location) }

    let!(:shipping_method) { create(:shipping_method, zones: [country_zone]) }
    let!(:payment_method)  { create(:credit_card_payment_method) }

    before do
      allow_any_instance_of(Spree::Order).to receive_messages(confirmation_required?: true)
      allow_any_instance_of(Spree::Order).to receive_messages(payment_required?: true)
      put '/api/v2/storefront/checkout', params: params, headers: headers
    end

    context 'line_items' do
      let(:line_item) { order.line_items.first }
      let(:params) do
        {
          order: {
            line_items: {
              0 => {
                id: line_item.id,
                quantity: 2
              }
            }
          }
        }
      end

      it 'can update line_items' 

    end

    context 'addresses' do
      let(:country_zone) { create(:zone, name: 'CountryZone') }
      let(:state)        { create(:state) }
      let(:country)      { state.country }
      let!(:address) do
        {
          firstname:  'John',
          lastname:   'Doe',
          address1:   '7735 Old Georgetown Road',
          city:       'Bethesda',
          phone:      '3014445002',
          zipcode:    '20814',
          state_id:   state.id,
          country_id: country.id
        }
      end

      let(:params) do
        {
          order: {
            bill_address: address,
            ship_address: address
          }
        }
      end

      it 'can update addresses' 

    end

    context 'payment' do
      context 'payment method' do
        let(:params) do
          {
            order: {
              payments_attributes: [
                {
                  payment_method_id: payment_method.id
                }
              ]
            }
          }
        end

        it 'can update payment method' 

      end

      context 'payment source' do
        let(:source_attributes) do
          {
            number: '4111111111111111',
            month: 1.month.from_now.month,
            year: 1.month.from_now.year,
            verification_value: '123',
            name: 'Spree Commerce'
          }
        end
        let(:params) do
          {
            order: {
              payments_attributes: [
                {
                  payment_method_id: payment_method.id
                }
              ]
            },
            payment_source: {
              payment_method.id.to_s => source_attributes
            }
          }
        end

        it 'can update payment method with source' 

      end
    end

    context 'special instructions' do
      let(:params) do
        {
          order: {
            special_instructions: "Don't drop it"
          }
        }
      end

      it 'can update the special instructions for an order' 

    end

    context 'email' do
      let(:params) do
        {
          order: {
            email: 'guest@spreecommerce.org'
          }
        }
      end

      it 'can assign an email to the order' 

    end

    context 'with invalid params' do
      let(:order) { create(:order_with_line_items, user: user, state: :delivery) }

      let(:params) do
        {
          order: {
            email: 'wrong_email'
          }
        }
      end

      it 'returns validation errors' 

    end
  end
end

