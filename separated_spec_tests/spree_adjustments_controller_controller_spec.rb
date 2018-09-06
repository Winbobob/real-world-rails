require 'spec_helper'

module Spree
  module Admin
    describe AdjustmentsController, type: :controller do
      stub_authorization!

      describe '#index' do
        subject do
          spree_get :index, order_id: order.to_param
        end

        let!(:order) { create(:order) }
        let!(:adjustment_1) { create(:adjustment, order: order) }

        before do
          create(:adjustment, order: order, eligible: false) # adjustment_2
          subject
        end

        it 'returns 200 status' 


        it 'loads the order' 


        it 'returns only eligible adjustments' 

      end
    end
  end
end

