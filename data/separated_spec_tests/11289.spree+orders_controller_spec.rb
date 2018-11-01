require 'spec_helper'
require 'cancan'
require 'spree/testing_support/bar_ability'

# Ability to test access to specific model instances
class OrderSpecificAbility
  include CanCan::Ability

  def initialize(_user)
    can [:admin, :manage], Spree::Order, number: 'R987654321'
  end
end

describe Spree::Admin::OrdersController, type: :controller do
  context 'with authorization' do
    stub_authorization!

    let(:order) do
      mock_model(
        Spree::Order,
        completed?:      true,
        total:           100,
        number:          'R123456789',
        all_adjustments: adjustments,
        billing_address: mock_model(Spree::Address)
      )
    end

    let(:adjustments) { double('adjustments') }
    let(:display_value) { Spree::ShippingMethod::DISPLAY_ON_BACK_END }

    before do
      request.env['HTTP_REFERER'] = 'http://localhost:3000'
      # ensure no respond_overrides are in effect
      Spree::BaseController.spree_responders[:OrdersController].clear if Spree::BaseController.spree_responders[:OrdersController].present?

      allow(Spree::Order).to receive_message_chain(:includes, find_by!: order)
    end

    context '#approve' do
      it 'approves an order' 

    end

    context '#cancel' do
      it 'cancels an order' 

    end

    context '#resume' do
      it 'resumes an order' 

    end

    context 'pagination' do
      it 'can page through the orders' 

    end

    describe '#store' do
      subject do
        spree_get :store, id: cart_order.number
      end

      let(:cart_order) { create(:order_with_line_items) }

      it 'displays a page with stores select tag' 

    end

    # Test for #3346
    context '#new' do
      it 'a new order has the current user assigned as a creator' 

    end

    # Regression test for #3684
    describe '#edit' do
      before do
        allow(controller).to receive(:can_not_transition_without_customer_info)
      end

      after do
        spree_get :edit, id: order.number
      end

      it { expect(controller).to receive(:can_not_transition_without_customer_info) }

      context 'when order is not completed' do
        before do
          allow(order).to receive(:completed?).and_return(false)
          allow(order).to receive(:refresh_shipment_rates).with(display_value).and_return(true)
        end

        it { expect(order).to receive(:completed?).and_return(false) }
        it { expect(order).to receive(:refresh_shipment_rates).with(display_value).and_return(true) }
      end

      context 'when order is completed' do
        before do
          allow(order).to receive(:completed?).and_return(true)
        end

        it { expect(order).to receive(:completed?).and_return(true) }
      end
    end

    describe '#cart' do
      def send_request
        spree_get :cart, id: order.number
      end

      context 'when order is not completed' do
        before do
          allow(order).to receive(:completed?).and_return(false)
          allow(order).to receive(:refresh_shipment_rates).with(display_value).and_return(true)
        end

        context 'when order has shipped shipments' do
          before do
            allow(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(true)
            allow(controller).to receive_message_chain(:shipments, :shipped, :exists?).and_return(true)
          end

          describe 'expects to receive' do
            it { expect(order).to receive(:completed?).and_return(false) }
            it { expect(order).to receive(:refresh_shipment_rates).with(display_value).and_return(true) }
            it { expect(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(true) }
            after { send_request }
          end

          describe 'response' do
            before { send_request }
            it { expect(response).to be_redirect }
            it { expect(response).to redirect_to(edit_admin_order_url(order)) }
          end
        end

        context 'when order has no shipped shipments' do
          before do
            allow(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(false)
          end

          describe 'expects to receive' do
            it { expect(order).to receive(:completed?).and_return(false) }
            it { expect(order).to receive(:refresh_shipment_rates).with(display_value).and_return(true) }
            it { expect(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(false) }
            after { send_request }
          end

          describe 'response' do
            before { send_request }
            it { expect(response).to render_template :cart }
          end
        end
      end

      context 'when order is completed' do
        before do
          allow(order).to receive(:completed?).and_return(true)
        end

        context 'when order has shipped shipments' do
          before do
            allow(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(true)
            allow(controller).to receive_message_chain(:shipments, :shipped, :exists?).and_return(true)
          end

          describe 'expects to receive' do
            it { expect(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(true) }
            after { send_request }
          end

          describe 'response' do
            before { send_request }
            it { expect(response).to be_redirect }
            it { expect(response).to redirect_to(edit_admin_order_url(order)) }
          end
        end

        context 'when order has no shipped shipments' do
          before do
            allow(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(false)
          end

          describe 'expects to receive' do
            it { expect(order).to receive_message_chain(:shipments, :shipped, :exists?).and_return(false) }
            after { send_request }
          end

          describe 'response' do
            before { send_request }
            it { expect(response).to render_template :cart }
          end
        end
      end
    end

    # Test for #3919
    context 'search' do
      let(:user) { create(:user) }

      before do
        allow(controller).to receive_messages spree_current_user: user
        user.spree_roles << Spree::Role.find_or_create_by(name: 'admin')

        create(:completed_order_with_totals)
        expect(Spree::Order.count).to eq 1
      end

      def send_request
        spree_get :index, q: {
          line_items_variant_id_in: Spree::Order.first.variants.map(&:id)
        }
      end

      it 'does not display duplicate results' 


      it 'preloads users' 

    end

    context '#open_adjustments' do
      let(:closed) { double('closed_adjustments') }

      before do
        allow(adjustments).to receive(:finalized).and_return(closed)
        allow(closed).to receive(:update_all)
      end

      it 'changes all the closed adjustments to open' 


      it 'sets the flash success message' 


      context 'when referer' do
        before do
          request.env['HTTP_REFERER'] = '/'
        end

        it 'redirects back' 

      end

      context 'when no referer' do
        before do
          request.env['HTTP_REFERER'] = nil
        end

        it 'refirects to fallback location' 

      end
    end

    context '#close_adjustments' do
      let(:open) { double('open_adjustments') }

      before do
        allow(adjustments).to receive(:not_finalized).and_return(open)
        allow(open).to receive(:update_all)
      end

      it 'changes all the open adjustments to closed' 


      it 'sets the flash success message' 


      context 'when referer' do
        before do
          request.env['HTTP_REFERER'] = '/'
        end

        it 'redirects back' 

      end

      context 'when no referer' do
        before do
          request.env['HTTP_REFERER'] = nil
        end

        it 'refirects to fallback location' 

      end
    end
  end

  context '#authorize_admin' do
    let(:user) { create(:user) }
    let(:order) { create(:completed_order_with_totals, number: 'R987654321') }

    def with_ability(ability)
      Spree::Ability.register_ability(ability)
      yield
    ensure
      Spree::Ability.remove_ability(ability)
    end

    before do
      allow(Spree::Order).to receive_messages find: order
      allow(controller).to receive_messages spree_current_user: user
    end

    it 'grants access to users with an admin role' 


    it 'grants access to users with an bar role' 


    it 'denies access to users with an bar role' 


    it 'denies access to users without an admin role' 


    it 'denies access to not signed in users' 


    it 'restricts returned order(s) on index when using OrderSpecificAbility' 

  end

  context 'order number not given' do
    stub_authorization!

    it 'raise active record not found' 

  end
end

