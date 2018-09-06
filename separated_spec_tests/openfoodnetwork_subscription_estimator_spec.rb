describe SubscriptionEstimator do
  describe "estimating prices for subscription line items" do
    let!(:subscription) { create(:subscription, with_items: true) }
    let!(:sli1) { subscription.subscription_line_items.first }
    let!(:sli2) { subscription.subscription_line_items.second }
    let!(:sli3) { subscription.subscription_line_items.third }
    let(:estimator) { SubscriptionEstimator.new(subscription) }

    before do
      sli1.update_attributes(price_estimate: 4.0)
      sli2.update_attributes(price_estimate: 5.0)
      sli3.update_attributes(price_estimate: 6.0)
      sli1.variant.update_attributes(price: 1.0)
      sli2.variant.update_attributes(price: 2.0)
      sli3.variant.update_attributes(price: 3.0)

      # Simulating assignment of attrs from params
      sli1.assign_attributes(price_estimate: 7.0)
      sli2.assign_attributes(price_estimate: 8.0)
      sli3.assign_attributes(price_estimate: 9.0)
    end

    context "when a insufficient information exists to calculate price estimates" do
      before do
        # This might be because a shop has not been assigned yet, or no
        # current or future order cycles exist for the schedule
        allow(estimator).to receive(:fee_calculator) { nil }
      end

      it "resets the price estimates for all items" 

    end

    context "when sufficient information to calculate price estimates exists" do
      let(:fee_calculator) { instance_double(OpenFoodNetwork::EnterpriseFeeCalculator) }

      before do
        allow(estimator).to receive(:fee_calculator) { fee_calculator }
        allow(fee_calculator).to receive(:indexed_fees_for).with(sli1.variant) { 1.0 }
        allow(fee_calculator).to receive(:indexed_fees_for).with(sli2.variant) { 0.0 }
        allow(fee_calculator).to receive(:indexed_fees_for).with(sli3.variant) { 3.0 }
      end

      context "when no variant overrides apply" do
        it "recalculates price_estimates based on variant prices and associated fees" 

      end

      context "when variant overrides apply" do
        let!(:override1) { create(:variant_override, hub: subscription.shop, variant: sli1.variant, price: 1.2) }
        let!(:override2) { create(:variant_override, hub: subscription.shop, variant: sli2.variant, price: 2.3) }

        it "recalculates price_estimates based on override prices and associated fees" 

      end
    end
  end

  describe "updating estimates for shipping and payment fees" do
    let(:subscription) { create(:subscription, with_items: true, payment_method: payment_method, shipping_method: shipping_method) }
    let!(:sli1) { subscription.subscription_line_items.first }
    let!(:sli2) { subscription.subscription_line_items.second }
    let!(:sli3) { subscription.subscription_line_items.third }
    let(:estimator) { SubscriptionEstimator.new(subscription) }

    before do
      allow(estimator).to receive(:assign_price_estimates)
      sli1.update_attributes(price_estimate: 4.0)
      sli2.update_attributes(price_estimate: 5.0)
      sli3.update_attributes(price_estimate: 6.0)
    end

    context "using flat rate calculators" do
      let(:shipping_method) { create(:shipping_method, calculator: Spree::Calculator::FlatRate.new(preferred_amount: 12.34)) }
      let(:payment_method) { create(:payment_method, calculator: Spree::Calculator::FlatRate.new(preferred_amount: 9.12)) }

      it "calculates fees based on the rates provided" 

    end

    context "using flat percent item total calculators" do
      let(:shipping_method) { create(:shipping_method, calculator: Spree::Calculator::FlatPercentItemTotal.new(preferred_flat_percent: 10)) }
      let(:payment_method) { create(:payment_method, calculator: Spree::Calculator::FlatPercentItemTotal.new(preferred_flat_percent: 20)) }

      it "calculates fees based on the estimated item total and percentage provided" 

    end

    context "using flat percent per item calculators" do
      let(:shipping_method) { create(:shipping_method, calculator: Calculator::FlatPercentPerItem.new(preferred_flat_percent: 5)) }
      let(:payment_method) { create(:payment_method, calculator: Calculator::FlatPercentPerItem.new(preferred_flat_percent: 10)) }

      it "calculates fees based on the estimated item prices and percentage provided" 

    end

    context "using per item calculators" do
      let(:shipping_method) { create(:shipping_method, calculator: Spree::Calculator::PerItem.new(preferred_amount: 1.2)) }
      let(:payment_method) { create(:payment_method, calculator: Spree::Calculator::PerItem.new(preferred_amount: 0.3)) }

      it "calculates fees based on the number of items and rate provided" 

    end
  end
end

