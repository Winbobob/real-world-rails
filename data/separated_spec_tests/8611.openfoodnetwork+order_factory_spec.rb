describe OrderFactory do
  let(:variant1) { create(:variant, price: 5.0) }
  let(:variant2) { create(:variant, price: 7.0) }
  let(:user) { create(:user) }
  let(:customer) { create(:customer, user: user) }
  let(:shop) { create(:distributor_enterprise) }
  let(:order_cycle) { create(:simple_order_cycle) }
  let(:shipping_method) { create(:shipping_method, calculator: Spree::Calculator::FlatRate.new(preferred_amount: 5.0)) }
  let(:payment_method) { create(:payment_method) }
  let(:ship_address) { create(:address) }
  let(:bill_address) { create(:address) }
  let(:opts) { {} }
  let(:factory) { OrderFactory.new(attrs, opts) }
  let(:order) { factory.create }

  describe "create" do
    let(:attrs) do
      attrs = {}
      attrs[:line_items] = [{ variant_id: variant1.id, quantity: 2 }, { variant_id: variant2.id, quantity: 4 }]
      attrs[:customer_id] = customer.id
      attrs[:distributor_id] = shop.id
      attrs[:order_cycle_id] = order_cycle.id
      attrs[:shipping_method_id] = shipping_method.id
      attrs[:payment_method_id] = payment_method.id
      attrs[:bill_address_attributes] = bill_address.attributes.except("id")
      attrs[:ship_address_attributes] = ship_address.attributes.except("id")
      attrs
    end

    it "builds a new order based the provided attributes" 


    context "when the customer does not have a user associated with it" do
      before { customer.update_attribute(:user_id, nil) }

      it "initialises the order without a user_id" 

    end

    context "when requested quantity is greater than available stock" do
      context "when no override is present" do
        before do
          variant1.update_attribute(:count_on_hand, 2)
          attrs[:line_items].first[:quantity] = 5
        end

        context "when skip_stock_check is not requested" do
          it "initialised the order but limits stock to the available amount" 

        end

        context "when skip_stock_check is requested" do
          let(:opts) { { skip_stock_check: true } }

          it "initialises the order with the requested quantity regardless" 

        end
      end

      context "when an override is present" do
        let!(:override) { create(:variant_override, hub_id: shop.id, variant_id: variant1.id, count_on_hand: 3) }
        before { attrs[:line_items].first[:quantity] = 6 }

        context "when skip_stock_check is not requested" do
          it "initialised the order but limits stock to the available amount" 

        end

        context "when skip_stock_check is requested" do
          let(:opts) { { skip_stock_check: true } }

          it "initialises the order with the requested quantity regardless" 

        end
      end
    end

    describe "determining the price for line items" do
      context "when no override is present" do
        it "uses the price from the variant" 

      end

      context "when an override is present" do
        let!(:override) { create(:variant_override, hub_id: shop.id, variant_id: variant1.id, price: 3.0) }

        it "uses the price from the override" 

      end
    end
  end
end

