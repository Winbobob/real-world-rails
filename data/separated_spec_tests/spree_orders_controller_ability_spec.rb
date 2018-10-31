require 'spec_helper'

module Spree
  describe OrdersController, type: :controller do
    let(:user) { create(:user) }
    let(:guest_user) { create(:user) }
    let(:order) { Spree::Order.create }

    context 'when an order exists in the cookies.signed' do
      let(:token) { 'some_token' }
      let(:specified_order) { create(:order) }
      let!(:variant) { create(:variant) }

      before do
        cookies.signed[:guest_token] = token
        allow(controller).to receive_messages current_order: order
        allow(controller).to receive_messages spree_current_user: user
      end

      context '#populate' do
        it 'checks if user is authorized for :edit' 

        it 'checks against the specified order' 

      end

      context '#edit' do
        it 'checks if user is authorized for :edit' 

        it 'checks against the specified order' 

      end

      context '#update' do
        it 'checks if user is authorized for :edit' 

        it 'checks against the specified order' 

      end

      context '#empty' do
        it 'checks if user is authorized for :edit' 

        it 'checks against the specified order' 

      end

      context '#show' do
        it 'checks against the specified order' 

      end
    end

    context 'when no authenticated user' do
      let(:order) { create(:order, number: 'R123') }

      context '#show' do
        context 'when guest_token correct' do
          before { cookies.signed[:guest_token] = order.guest_token }

          it 'displays the page' 

        end

        context 'when guest_token not present' do
          it 'raises ActiveRecord::RecordNotFound' 

        end
      end
    end
  end
end

