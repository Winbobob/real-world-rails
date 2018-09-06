require 'spec_helper'

describe Spree::Admin::ReturnItemsController, type: :controller do
  stub_authorization!

  describe '#update' do
    subject do
      spree_put :update, id: return_item.to_param, return_item: { acceptance_status: new_acceptance_status }
    end

    let(:customer_return) { create(:customer_return) }
    let(:return_item) { customer_return.return_items.first }
    let(:old_acceptance_status) { 'accepted' }
    let(:new_acceptance_status) { 'rejected' }

    it 'updates the return item' 


    it 'redirects to the custome return' 

  end
end

