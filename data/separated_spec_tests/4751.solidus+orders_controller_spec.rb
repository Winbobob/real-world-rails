# frozen_string_literal: true

require 'spec_helper'
require 'cancan'

describe Spree::Admin::OrdersController, type: :controller do
  let!(:store) { create(:store) }
  context "with authorization" do
    stub_authorization!

    before do
      request.env["HTTP_REFERER"] = "http://localhost:3000"
    end

    let(:order) do
      mock_model(
        Spree::Order,
        completed?:      true,
        total:           100,
        number:          'R123456789',
        all_adjustments: adjustments,
        ship_address: mock_model(Spree::Address)
      )
    end

    let(:adjustments) { double('adjustments') }

    before do
      allow(Spree::Order).to receive_message_chain(:includes, find_by!: order)
      allow(order).to receive_messages(contents: Spree::OrderContents.new(order))
    end

    context "#approve" do
      it "approves an order" 

    end

    context "#cancel" do
      it "cancels an order" 

    end

    context "#resume" do
      it "resumes an order" 

    end

    context "#resend" do
      let(:order) { create(:completed_order_with_totals) }
      it "resends order email" 

    end

    context "pagination" do
      it "can page through the orders" 

    end

    # Test for https://github.com/spree/spree/issues/3346
    context "#new" do
      let(:user) { create(:user) }
      before do
        allow(controller).to receive_messages spree_current_user: user
      end

      it "imports a new order and sets the current user as a creator" 


      it "sets frontend_viewable to false" 


      it "should associate the order with a store" 


      context "when a user_id is passed as a parameter" do
        let(:user)  { mock_model(Spree.user_class) }
        before { allow(Spree.user_class).to receive_messages find_by: user }

        it "imports a new order and assigns the user to the order" 

      end

      it "should redirect to cart" 

    end

    # Regression test for https://github.com/spree/spree/issues/3684
    # Rendering a form should under no circumstance mutate the order
    context "#edit" do
      it "does not refresh rates if the order is completed" 


      it "does not refresh the rates if the order is incomplete" 


      context "when order does not have a ship address" do
        before do
          allow(order).to receive_messages ship_address: nil
        end

        context 'when order_bill_address_used is true' do
          before { Spree::Config[:order_bill_address_used] = true }

          it "should redirect to the customer details page" 

        end

        context 'when order_bill_address_used is false' do
          before { Spree::Config[:order_bill_address_used] = false }

          it "should redirect to the customer details page" 

        end
      end
    end

    describe '#advance' do
      subject do
        put :advance, params: { id: order.number }
      end

      context 'when incomplete' do
        before do
          allow(order).to receive(:completed?).and_return(false, true)
          allow(order).to receive(:next).and_return(true, false)
        end

        context 'when successful' do
          before { allow(order).to receive(:can_complete?).and_return(true) }

          it 'messages and redirects' 

        end

        context 'when unsuccessful' do
          before do
            allow(order).to receive(:can_complete?).and_return(false)
            allow(order).to receive(:errors).and_return(double(full_messages: ['failed']))
          end

          it 'messages and redirects' 

        end
      end

      context 'when already completed' do
        before { allow(order).to receive_messages completed?: true }

        it 'messages and redirects' 

      end
    end

    context '#confirm' do
      subject do
        get :confirm, params: { id: order.number }
      end

      context 'when in confirm' do
        before { allow(order).to receive_messages completed?: false, can_complete?: true }

        it 'renders the confirm page' 

      end

      context 'when before confirm' do
        before { allow(order).to receive_messages completed?: false, can_complete?: false }

        it 'renders the confirm_advance template (to allow refreshing of the order)' 

      end

      context 'when already completed' do
        before { allow(order).to receive_messages completed?: true }

        it 'redirects to edit' 

      end
    end

    context "#complete" do
      subject do
        put :complete, params: { id: order.number }
      end

      context 'when successful' do
        before { allow(order).to receive(:complete!) }

        it 'completes the order' 


        it 'messages and redirects' 

      end

      context 'with an StateMachines::InvalidTransition error' do
        let(:order) { create(:order) }

        it 'messages and redirects' 

      end

      context 'insufficient stock to complete the order' do
        before do
          expect(order).to receive(:complete!).and_raise Spree::Order::InsufficientStock
        end

        it 'messages and redirects' 

      end
    end

    # Test for https://github.com/spree/spree/issues/3919
    context "search" do
      let(:user) { create(:user) }

      before do
        allow(controller).to receive_messages spree_current_user: user
        user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')

        create_list(:completed_order_with_totals, 2)
        expect(Spree::Order.count).to eq 2
      end

      context 'by line_items_variant_id_in' do
        it "does not display duplicated results" 

      end

      context 'by email' do
        it "does not display duplicated results" 

      end
    end

    context "#not_finalized_adjustments" do
      let(:order) { create(:order) }
      let!(:finalized_adjustment) { create(:adjustment, finalized: true, adjustable: order, order: order) }

      it "changes all the finalized adjustments to unfinalized" 


      it "sets the flash success message" 


      it "redirects back" 

    end

    context "#finalize_adjustments" do
      let(:order) { create(:order) }
      let!(:not_finalized_adjustment) { create(:adjustment, finalized: false, adjustable: order, order: order) }

      it "changes all the unfinalized adjustments to finalized" 


      it "sets the flash success message" 


      it "redirects back" 

    end
  end

  context '#authorize_admin' do
    let!(:user) { create(:user) }
    let!(:order) { create(:completed_order_with_totals, number: 'R987654321') }

    before do
      allow(controller).to receive_messages spree_current_user: user
    end

    it 'should grant access to users with an admin role' 


    it 'should deny access to users without an admin role' 


    context 'with only permissions on Order' do
      stub_authorization! do |_ability|
        can [:admin, :manage], Spree::Order, number: 'R987654321'
      end

      it 'should restrict returned order(s) on index when using OrderSpecificAbility' 

    end
  end

  context "order number not given" do
    stub_authorization!

    it "raise active record not found" 

  end
end

