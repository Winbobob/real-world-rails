require 'spec_helper'

module OpenFoodNetwork
  describe OrderAndDistributorReport do
    describe 'orders and distributors report' do
      it 'should return a header row describing the report' 


      context 'with completed order' do
        let(:bill_address) { create(:address) }
        let(:distributor) { create(:distributor_enterprise) }
        let(:product) { create(:product) }
        let(:shipping_instructions) { 'pick up on thursday please!' }
        let(:order) { create(:order, state: 'complete', completed_at: Time.zone.now, distributor: distributor, bill_address: bill_address, special_instructions: shipping_instructions) }
        let(:payment_method) { create(:payment_method, distributors: [distributor]) }
        let(:payment) { create(:payment, payment_method: payment_method, order: order) }
        let(:line_item) { create(:line_item, product: product, order: order) }

        before do
          order.payments << payment
          order.line_items << line_item
        end

        it 'should denormalise order and distributor details for display as csv' 

      end
    end
  end
end

