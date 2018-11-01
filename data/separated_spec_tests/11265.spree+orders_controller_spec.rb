require 'spec_helper'

describe Spree::OrdersController, type: :controller do
  let(:user) { create(:user) }

  context 'Order model mock' do
    let(:order) do
      Spree::Order.create!
    end
    let(:variant) { create(:variant) }

    before do
      allow(controller).to receive_messages(try_spree_current_user: user)
    end

    context '#populate' do
      it 'creates a new order when none specified' 


      context 'with Variant' do
        it 'handles population' 


        it 'shows an error when population fails' 


        it 'shows an error when quantity is invalid' 

      end
    end

    context '#update' do
      context 'with authorization' do
        before do
          allow(controller).to receive :check_authorization
          allow(controller).to receive_messages current_order: order
        end

        it 'renders the edit view (on failure)' 


        it 'redirects to cart path (on success)' 

      end
    end

    context '#empty' do
      before do
        allow(controller).to receive :check_authorization
      end

      it 'destroys line items in the current order' 

    end

    # Regression test for #2750
    context '#update' do
      before do
        allow(user).to receive :last_incomplete_spree_order
        allow(controller).to receive :set_current_order
      end

      it 'cannot update a blank order' 

    end
  end

  context 'line items quantity is 0' do
    let(:order) { Spree::Order.create }
    let(:variant) { create(:variant) }
    let!(:line_item) { Spree::Cart::AddItem.call(order: order, variant: variant).value }

    before do
      allow(controller).to receive(:check_authorization)
      allow(controller).to receive_messages(current_order: order)
    end

    it 'removes line items on update' 

  end
end

