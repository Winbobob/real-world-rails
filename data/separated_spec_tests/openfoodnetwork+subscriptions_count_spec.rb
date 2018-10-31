describe SubscriptionsCount do
  let(:oc1) { create(:simple_order_cycle) }
  let(:oc2) { create(:simple_order_cycle) }
  let(:subscriptions_count) { SubscriptionsCount.new(order_cycles) }

  describe "#for" do
    context "when the collection has not been set" do
      let(:order_cycles) { nil }
      it "returns 0" 

    end

    context "when the collection has been set" do
      let(:order_cycles) { OrderCycle.where(id: [oc1]) }
      let!(:po1) { create(:proxy_order, order_cycle: oc1) }
      let!(:po2) { create(:proxy_order, order_cycle: oc1) }
      let!(:po3) { create(:proxy_order, order_cycle: oc2) }

      context "but the requested id is not present in the list of order cycles provided" do
        it "returns 0" 

      end

      context "and the requested id is present in the list of order cycles provided" do
        it "returns a count of active proxy orders associated with the requested order cycle" 

      end
    end
  end
end

