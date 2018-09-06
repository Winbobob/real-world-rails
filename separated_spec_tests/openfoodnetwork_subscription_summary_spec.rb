require 'open_food_network/subscription_summary'

module OpenFoodNetwork
  describe SubscriptionSummary do
    let(:summary) { OpenFoodNetwork::SubscriptionSummary.new(123) }

    describe "#initialize" do
      it "initializes instance variables: shop_id, order_count, success_count and issues" 

    end

    describe "#record_order" do
      let(:order) { double(:order, id: 37) }
      it "adds the order id to the order_ids array" 

    end

    describe "#record_success" do
      let(:order) { double(:order, id: 37) }
      it "adds the order id to the success_ids array" 

    end

    describe "#record_issue" do
      let(:order) { double(:order, id: 1) }

      context "when no issues of the same type have been recorded yet" do
        it "adds a new type to the issues hash, and stores a new issue against it" 

      end

      context "when an issue of the same type has already been recorded" do
        let(:existing_issue) { double(:existing_issue) }

        before { summary.issues[:some_type] = [existing_issue] }

        it "stores a new issue against the existing type" 

      end
    end

    describe "#order_count" do
      let(:order_ids) { [1,2,3,4,5,6,7] }
      it "counts the number of items in the order_ids instance_variable" 

    end

    describe "#success_count" do
      let(:success_ids) { [1,2,3,4,5,6,7] }
      it "counts the number of items in the success_ids instance_variable" 

    end

    describe "#issue_count" do
      let(:order_ids) { [1,3,5,7,9] }
      let(:success_ids) { [1,2,3,4,5] }

      it "counts the number of items in order_ids that are not in success_ids" 

    end

    describe "#orders_affected_by" do
      let(:order1) { create(:order) }
      let(:order2) { create(:order) }

      before do
        allow(summary).to receive(:unrecorded_ids) { [order1.id] }
        allow(summary).to receive(:issues) { { failure: { order2.id => "A message" } } }
      end

      context "when the issue type is :other" do
        let(:orders) { summary.orders_affected_by(:other) }

        it "returns orders specified by unrecorded_ids" 

      end

      context "when the issue type is :other" do
        let(:orders) { summary.orders_affected_by(:failure) }

        it "returns orders specified by the relevant issue hash" 

      end
    end

    describe "#unrecorded_ids" do
      let(:issues) { { type: { 7 => "message", 8 => "message" } } }

      before do
        summary.instance_variable_set(:@order_ids, [1,3,5,7,9])
        summary.instance_variable_set(:@success_ids, [1,2,3,4,5])
        summary.instance_variable_set(:@issues, issues)
      end

      it "returns order_ids that are not marked as an issue or a success" 

    end
  end
end

