require 'spec_helper'

module Spree
  module Admin
    describe PaymentsController, type: :controller do
      stub_authorization!

      let(:order) { create(:order) }

      context 'with a valid credit card' do
        let(:order) { create(:order_with_line_items, state: 'payment') }
        let(:payment_method) { create(:credit_card_payment_method, display_on: 'back_end') }

        before do
          attributes = {
            order_id: order.number,
            card: 'new',
            payment: {
              amount: order.total,
              payment_method_id: payment_method.id.to_s,
              source_attributes: {
                name: 'Test User',
                number: '4111 1111 1111 1111',
                expiry: "09 / #{Time.current.year + 1}",
                verification_value: '123'
              }
            }
          }
          spree_post :create, attributes
        end

        it 'processes payment correctly' 


        # Regression for #4768
        it 'doesnt process the same payment twice' 

      end

      # Regression test for #3233
      context 'with a backend payment method' do
        before do
          @payment_method = create(:check_payment_method, display_on: 'back_end')
        end

        it 'loads backend payment methods' 

      end

      context 'order has billing address' do
        before do
          order.bill_address = create(:address)
          order.save!
        end

        context 'order does not have payments' do
          it 'redirect to new payments page' 

        end

        context 'order has payments' do
          before do
            order.payments << create(:payment, amount: order.total, order: order, state: 'completed')
          end

          it 'shows the payments page' 

        end
      end

      context 'order does not have a billing address' do
        before do
          order.bill_address = nil
          order.save
        end

        it 'redirects to the customer details page' 

      end
    end
  end
end

