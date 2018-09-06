require 'spec_helper'

describe 'exchanges:charge_unreturned_items' do
  include_context 'rake'

  describe '#prerequisites' do
    it { expect(subject.prerequisites).to include('environment') }
  end

  context 'there are no unreturned items' do
    it { expect { subject.invoke }.not_to change { Spree::Order.count } }
  end

  context 'there are unreturned items' do
    let!(:order) { create(:shipped_order, line_items_count: 2) }
    let(:return_item_1) { create(:exchange_return_item, inventory_unit: order.inventory_units.first) }
    let(:return_item_2) { create(:exchange_return_item, inventory_unit: order.inventory_units.last) }
    let!(:rma) { create(:return_authorization, order: order, return_items: [return_item_1, return_item_2]) }
    let!(:tax_rate) { create(:tax_rate, zone: order.tax_zone, tax_category: return_item_2.exchange_variant.tax_category) }

    before do
      @original_expedited_exchanges_pref = Spree::Config[:expedited_exchanges]
      Spree::Config[:expedited_exchanges] = true
      Spree::StockItem.update_all(count_on_hand: 10)
      rma.save!
      Spree::Shipment.last.ship!
      return_item_1.receive!
      Timecop.travel travel_time
    end

    after do
      Timecop.return
      Spree::Config[:expedited_exchanges] = @original_expedited_exchanges_pref
    end

    context 'fewer than the config allowed days have passed' do
      let(:travel_time) { (Spree::Config[:expedited_exchanges_days_window] - 1).days }

      it 'does not create a new order' 

    end

    context 'more than the config allowed days have passed' do
      let(:travel_time) { (Spree::Config[:expedited_exchanges_days_window] + 1).days }

      it 'creates a new completed order' 


      it 'moves the shipment for the unreturned items to the new order' 


      it 'creates line items on the order for the unreturned items' 


      it 'associates the exchanges inventory units with the new line items' 


      it 'uses the credit card from the previous order' 


      it 'authorizes the order for the full amount of the unreturned items including taxes' 


      it 'does not attempt to create a new order for the item more than once' 


      it 'associates the store of the original order with the exchange order' 


      context 'there is no card from the previous order' do
        let!(:credit_card) { create(:credit_card, user: order.user, default: true, gateway_customer_profile_id: 'BGS-123') }

        before { allow_any_instance_of(Spree::Order).to receive(:valid_credit_cards).and_return([]) }

        it "attempts to use the user's default card" 

      end

      context 'it is unable to authorize the credit card' do
        before { allow_any_instance_of(Spree::Payment).to receive(:authorize!).and_raise(RuntimeError) }

        it 'raises an error with the order' 

      end

      context 'the exchange inventory unit is not shipped' do
        before { return_item_2.reload.exchange_inventory_units.update_all(state: 'on hand') }
        it 'does not create a new order' 

      end

      context 'the exchange inventory unit has been returned' do
        before { return_item_2.reload.exchange_inventory_units.update_all(state: 'returned') }
        it 'does not create a new order' 

      end
    end
  end
end

