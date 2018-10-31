require 'spec_helper'

describe Spree::Api::V1::ShipmentsController, type: :controller do
  render_views
  let!(:shipment) { create(:shipment) }
  let!(:shipment2) { create(:shipment) }
  let!(:attributes) { [:id, :tracking, :number, :cost, :shipped_at, :stock_location_name, :order_id, :shipping_rates, :shipping_methods] }
  let(:resource_scoping) { { id: shipment.to_param, shipment: { order_id: shipment.order.to_param } } }

  before do
    stub_authentication!
  end

  context 'as a non-admin' do
    it 'cannot make a shipment ready' 


    it 'cannot make a shipment shipped' 

  end

  context 'as an admin' do
    let!(:order) { shipment.order }
    let!(:stock_location) { create(:stock_location_with_items) }
    let!(:variant) { create(:variant) }

    sign_in_as_admin!

    # Start writing this spec a bit differently than before....
    describe 'POST #create' do
      subject do
        api_post :create, params
      end

      let(:params) do
        {
          variant_id: stock_location.stock_items.first.variant.to_param,
          shipment: { order_id: order.number },
          stock_location_id: stock_location.to_param
        }
      end

      [:variant_id, :stock_location_id].each do |field|
        context "when #{field} is missing" do
          before do
            params.delete(field)
          end

          it 'returns proper error' 

        end
      end

      it 'creates a new shipment' 

    end

    describe 'POST #transfer_to_shipment' do
      let(:shared_params) do
        {
          original_shipment_number: shipment.number,
          variant_id: stock_location.stock_items.first.variant.to_param,
          shipment: { order_id: order.number },
          stock_location_id: stock_location.to_param
        }
      end

      context 'wrong quantity and shipment target' do
        let!(:params) do
          shared_params.merge(target_shipment_number: shipment.number, quantity: '-200')
        end

        it 'displays wrong target and negative quantity errors' 

      end

      context 'wrong quantity' do
        let!(:params) do
          shared_params.merge(target_shipment_number: shipment2.number, quantity: '-200')
        end

        it 'displays negative quantity error' 

      end

      context 'wrong shipment target' do
        let!(:params) do
          shared_params.merge(target_shipment_number: shipment.number, quantity: '200')
        end

        it 'displays wrong target error' 

      end
    end

    it 'can update a shipment' 


    it 'can make a shipment ready' 


    it 'cannot make a shipment ready if the order is unpaid' 


    context 'for completed shipments' do
      let(:order) { create :completed_order_with_totals }
      let(:resource_scoping) { { id: order.shipments.first.to_param, shipment: { order_id: order.to_param } } }

      it 'adds a variant to a shipment' 


      it 'removes a variant from a shipment' 


      it 'removes a destroyed variant from a shipment' 

    end

    context 'can transition a shipment from ready to ship' do
      before do
        allow_any_instance_of(Spree::Order).to receive_messages(paid?: true, complete?: true)
        shipment.update!(shipment.order)
        expect(shipment.state).to eq('ready')
        allow_any_instance_of(Spree::ShippingRate).to receive_messages(cost: 5)
      end

      it 'can transition a shipment from ready to ship' 

    end

    describe '#mine' do
      subject do
        api_get :mine, format: 'json', params: params
      end

      let(:params) { {} }

      before { subject }

      context 'the current api user is authenticated and has orders' do
        let(:current_api_user) { shipped_order.user }
        let(:shipped_order) { create(:shipped_order) }

        it 'succeeds' 


        describe 'json output' do
          render_views

          let(:rendered_shipment_ids) { json_response['shipments'].map { |s| s['id'] } }

          it 'contains the shipments' 

        end

        context 'with filtering' do
          let(:params) { { q: { order_completed_at_not_null: 1 } } }

          before do
            create(:order, user: current_api_user) # incomplete_order
          end

          it 'filters' 

        end
      end

      context 'the current api user is not persisted' do
        let(:current_api_user) { Spree.user_class.new }

        it 'returns a 401' 

      end
    end
  end
end

