# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::ReturnItemsController, type: :controller do
  stub_authorization!

  describe '#update' do
    let(:customer_return) { create(:customer_return) }
    let(:return_item) { customer_return.return_items.first }
    let(:old_acceptance_status) { 'pending' }
    let(:new_acceptance_status) { 'rejected' }

    subject do
      put :update, params: { id: return_item.to_param, return_item: { acceptance_status: new_acceptance_status } }
    end

    it 'updates the return item' 


    it 'redirects to the customer return' 

  end
end

