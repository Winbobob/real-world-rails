require 'spec_helper'

describe Spree::Admin::ReturnAuthorizationsController, type: :controller do
  stub_authorization!

  # Regression test for #1370 #3
  let!(:order) { create(:shipped_order, line_items_count: 3) }
  let!(:return_authorization_reason) { create(:return_authorization_reason) }
  let(:inventory_unit_1) { order.inventory_units.order('id asc')[0] }
  let(:inventory_unit_2) { order.inventory_units.order('id asc')[1] }
  let(:inventory_unit_3) { order.inventory_units.order('id asc')[2] }

  describe '#load_return_authorization_reasons' do
    let!(:inactive_rma_reason) { create(:return_authorization_reason, active: false) }

    context 'return authorization has an associated inactive reason' do
      let!(:other_inactive_rma_reason) { create(:return_authorization_reason, active: false) }
      let(:return_authorization) { create(:return_authorization, reason: inactive_rma_reason) }

      it 'loads all the active rma reasons' 

    end

    context 'return authorization has an associated active reason' do
      let(:return_authorization) { create(:return_authorization, reason: return_authorization_reason) }

      it 'loads all the active rma reasons' 

    end

    context "return authorization doesn't have an associated reason" do
      it 'loads all the active rma reasons' 

    end
  end

  describe '#load_return_items' do
    shared_context 'without existing return items' do
      context 'without existing return items' do
        it 'has 3 new @form_return_items' 

      end
    end

    shared_context 'with existing return items' do
      context 'with existing return items' do
        let!(:return_item_1) { create(:return_item, inventory_unit: inventory_unit_1, return_authorization: return_authorization) }

        it 'has 1 existing return item and 2 new return items' 

      end
    end

    context '#new' do
      subject { spree_get :new, order_id: order.to_param }

      include_context 'without existing return items'
    end

    context '#edit' do
      subject do
        spree_get :edit,           id: return_authorization.to_param,
                                   order_id: order.to_param
      end

      let(:return_authorization) { create(:return_authorization, order: order) }

      include_context 'without existing return items'
      include_context 'with existing return items'
    end

    context '#create failed' do
      subject do
        spree_post :create,           return_authorization: { return_authorization_reason_id: -1 }, # invalid reason_id
                                      order_id: order.to_param
      end

      include_context 'without existing return items'
    end

    context '#update failed' do
      subject do
        spree_put :update,           return_authorization: { return_authorization_reason_id: -1 }, # invalid reason_id
                                     id: return_authorization.to_param,
                                     order_id: order.to_param
      end

      let(:return_authorization) { create(:return_authorization, order: order) }

      include_context 'without existing return items'
      include_context 'with existing return items'
    end
  end

  describe '#load_reimbursement_types' do
    let(:order)                             { create(:order) }
    let!(:inactive_reimbursement_type)      { create(:reimbursement_type, active: false) }
    let!(:first_active_reimbursement_type)  { create(:reimbursement_type) }
    let!(:second_active_reimbursement_type) { create(:reimbursement_type) }

    before do
      spree_get :new, order_id: order.to_param
    end

    it 'loads all the active reimbursement types' 

  end

  context '#create' do
    subject { spree_post :create, params }

    let(:stock_location) { create(:stock_location) }

    let(:params) do
      {
        order_id: order.to_param,
        return_authorization: return_authorization_params
      }
    end

    let(:return_authorization_params) do
      {
        memo: '',
        stock_location_id: stock_location.id,
        return_authorization_reason_id: return_authorization_reason.id
      }
    end

    it 'can create a return authorization' 

  end

  context '#update' do
    subject { spree_put :update, params }

    let(:return_authorization) { create(:return_authorization, order: order) }

    let(:params) do
      {
        id: return_authorization.to_param,
        order_id: order.to_param,
        return_authorization: return_authorization_params
      }
    end
    let(:return_authorization_params) do
      {
        memo: '',
        return_items_attributes: return_items_params
      }
    end

    context 'adding an item' do
      let(:return_items_params) do
        {
          '0' => { inventory_unit_id: inventory_unit_1.to_param }
        }
      end

      context 'without existing items' do
        it 'creates a new item' 

      end

      context 'with existing completed items' do
        let!(:completed_return_item) do
          create(:return_item,             return_authorization: return_authorization,
                                           inventory_unit: inventory_unit_1,
                                           reception_status: 'received')
        end

        it 'does not create new items' 

      end
    end

    context 'removing an item' do
      let!(:return_item) do
        create(:return_item, return_authorization: return_authorization, inventory_unit: inventory_unit_1)
      end

      let(:return_items_params) do
        {
          '0' => { id: return_item.to_param, _destroy: '1' }
        }
      end

      context 'with existing items' do
        it 'removes the item' 

      end
    end
  end
end
