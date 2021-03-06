require 'spec_helper'

describe Admin::BulkLineItemsController, type: :controller do
  include AuthenticationWorkflow

  describe '#index' do
    render_views

    let(:line_item_attributes) { %i[id quantity max_quantity price supplier final_weight_volume units_product units_variant order] }
    let!(:dist1) { FactoryBot.create(:distributor_enterprise) }
    let!(:order1) { FactoryBot.create(:order, state: 'complete', completed_at: 1.day.ago, distributor: dist1, billing_address: FactoryBot.create(:address) ) }
    let!(:order2) { FactoryBot.create(:order, state: 'complete', completed_at: Time.zone.now, distributor: dist1, billing_address: FactoryBot.create(:address) ) }
    let!(:order3) { FactoryBot.create(:order, state: 'complete', completed_at: Time.zone.now, distributor: dist1, billing_address: FactoryBot.create(:address) ) }
    let!(:line_item1) { FactoryBot.create(:line_item, order: order1) }
    let!(:line_item2) { FactoryBot.create(:line_item, order: order2) }
    let!(:line_item3) { FactoryBot.create(:line_item, order: order2) }
    let!(:line_item4) { FactoryBot.create(:line_item, order: order3) }

    context "as a normal user" do
      before { controller.stub spree_current_user: create_enterprise_user }

      it "should deny me access to the index action" 

    end

    context "as an administrator" do
      before do
        controller.stub spree_current_user: quick_login_as_admin
      end

      context "when no ransack params are passed in" do
        before do
          spree_get :index, :format => :json
        end

        it "retrieves a list of line_items with appropriate attributes, including line items with appropriate attributes" 


        it "sorts line_items in ascending id line_item" 


        it "formats final_weight_volume as a float" 


        it "returns distributor object with id key" 

      end

      context "when ransack params are passed in for line items" do
        before do
          spree_get :index, :format => :json, q: { order_id_eq: order2.id }
        end

        it "retrives a list of line items which match the criteria" 

      end

      context "when ransack params are passed in for orders" do
        before do
          spree_get :index, :format => :json, q: { order: { completed_at_gt: 2.hours.ago } }
        end

        it "retrives a list of line items whose orders match the criteria" 

      end
    end

    context "as an enterprise user" do
      let(:supplier) { create(:supplier_enterprise) }
      let(:distributor1) { create(:distributor_enterprise) }
      let(:distributor2) { create(:distributor_enterprise) }
      let(:coordinator) { create(:distributor_enterprise) }
      let(:order_cycle) { create(:simple_order_cycle, coordinator: coordinator) }
      let!(:order1) { FactoryBot.create(:order, order_cycle: order_cycle, state: 'complete', completed_at: Time.zone.now, distributor: distributor1, billing_address: FactoryBot.create(:address) ) }
      let!(:line_item1) { FactoryBot.create(:line_item, order: order1, product: FactoryBot.create(:product, supplier: supplier)) }
      let!(:line_item2) { FactoryBot.create(:line_item, order: order1, product: FactoryBot.create(:product, supplier: supplier)) }
      let!(:order2) { FactoryBot.create(:order, order_cycle: order_cycle, state: 'complete', completed_at: Time.zone.now, distributor: distributor2, billing_address: FactoryBot.create(:address) ) }
      let!(:line_item3) { FactoryBot.create(:line_item, order: order2, product: FactoryBot.create(:product, supplier: supplier)) }

      context "producer enterprise" do
        before do
          controller.stub spree_current_user: supplier.owner
          spree_get :index, :format => :json
        end

        it "does not display line items for which my enterprise is a supplier" 

      end

      context "coordinator enterprise" do
        before do
          controller.stub spree_current_user: coordinator.owner
          spree_get :index, :format => :json
        end

        it "retrieves a list of line_items" 

      end

      context "hub enterprise" do
        before do
          controller.stub spree_current_user: distributor1.owner
          spree_get :index, :format => :json
        end

        it "retrieves a list of line_items" 

      end
    end
  end

  describe '#update' do
    let(:supplier) { create(:supplier_enterprise) }
    let(:distributor1) { create(:distributor_enterprise) }
    let(:coordinator) { create(:distributor_enterprise) }
    let(:order_cycle) { create(:simple_order_cycle, coordinator: coordinator) }
    let!(:order1) { FactoryBot.create(:order, order_cycle: order_cycle, state: 'complete', completed_at: Time.zone.now, distributor: distributor1, billing_address: FactoryBot.create(:address) ) }
    let!(:line_item1) { FactoryBot.create(:line_item, order: order1, product: FactoryBot.create(:product, supplier: supplier)) }
    let(:line_item_params) { { quantity: 3, final_weight_volume: 3000, price: 3.00 } }
    let(:params) { { id: line_item1.id, order_id: order1.number, line_item: line_item_params } }

    context "as an enterprise user" do
      context "producer enterprise" do
        before do
          controller.stub spree_current_user: supplier.owner
          spree_put :update, params
        end

        it "does not allow access" 

      end

      context "coordinator enterprise" do
        render_views

        before do
          controller.stub spree_current_user: coordinator.owner
        end

        # Used in admin/orders/bulk_management
        context 'when the request is JSON (angular)' do
          before { params[:format] = :json }

          it "updates the line item" 


          it "returns an empty JSON response" 


          it 'returns a 204 response' 


          it 'applies enterprise fees locking the order with an exclusive row lock' 


          context 'when the line item params are not correct' do
            let(:line_item_params) { { price: 'hola' } }
            let(:errors) { { 'price' => ['is not a number'] } }

            it 'returns a JSON with the errors' 


            it 'returns a 412 response' 

          end
        end
      end

      context "hub enterprise" do
        before do
          controller.stub spree_current_user: distributor1.owner
          xhr :put, :update, params
        end

        it "updates the line item" 

      end
    end
  end

  describe '#destroy' do
    render_views

    let(:supplier) { create(:supplier_enterprise) }
    let(:distributor1) { create(:distributor_enterprise) }
    let(:coordinator) { create(:distributor_enterprise) }
    let(:order_cycle) { create(:simple_order_cycle, coordinator: coordinator) }
    let!(:order1) { FactoryBot.create(:order, order_cycle: order_cycle, state: 'complete', completed_at: Time.zone.now, distributor: distributor1, billing_address: FactoryBot.create(:address) ) }
    let!(:line_item1) { FactoryBot.create(:line_item, order: order1, product: FactoryBot.create(:product, supplier: supplier)) }
    let(:params) { { id: line_item1.id, order_id: order1.number } }

    before do
      controller.stub spree_current_user: coordinator.owner
    end

    # Used in admin/orders/bulk_management
    context 'when the request is JSON (angular)' do
      before { params[:format] = :json }

      it 'destroys the line item' 


      it 'returns an empty JSON response' 


      it 'returns a 204 response' 

    end
  end
end

