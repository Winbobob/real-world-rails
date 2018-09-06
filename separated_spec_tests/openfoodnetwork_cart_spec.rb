require 'spec_helper'

feature "full-page cart", js: true do
  include AuthenticationWorkflow
  include WebHelper
  include ShopWorkflow
  include UIComponentHelper

  describe "viewing the cart" do
    let!(:zone) { create(:zone_with_member) }
    let(:distributor) { create(:distributor_enterprise, with_payment_and_shipping: true, charges_sales_tax: true) }
    let(:supplier) { create(:supplier_enterprise) }
    let!(:order_cycle) { create(:simple_order_cycle, suppliers: [supplier], distributors: [distributor], coordinator: create(:distributor_enterprise), variants: [product_tax.variants.first, product_fee.variants.first]) }
    let(:enterprise_fee) { create(:enterprise_fee, amount: 11.00, tax_category: product_tax.tax_category) }
    let(:product_tax) { create(:taxed_product, supplier: supplier, zone: zone, price: 110.00, tax_rate_amount: 0.1) }
    let(:product_fee) { create(:simple_product, supplier: supplier, price: 0.86, on_hand: 100) }
    let(:order) { create(:order, order_cycle: order_cycle, distributor: distributor) }

    before do
      set_order order
    end

    describe "product description" do
      it "does not link to the product page" 

    end

    describe "percentage fees" do
      let(:percentage_fee) { create(:enterprise_fee, calculator: Calculator::FlatPercentPerItem.new(preferred_flat_percent: 20)) }

      before do
        add_enterprise_fee percentage_fee
        add_product_to_cart order, product_fee, quantity: 8
        visit spree.cart_path
      end

      it "rounds fee calculations correctly" 

    end

    describe "admin and handling flat fees" do
      context 'when there are fees' do
        let(:handling_fee) { create(:enterprise_fee, calculator: Spree::Calculator::FlatRate.new(preferred_amount: 1),
          enterprise: order_cycle.coordinator, fee_type: 'admin') }

        before do
          add_enterprise_fee handling_fee
          add_product_to_cart order, product_fee, quantity: 3
          visit spree.cart_path
        end

        it 'shows admin and handlings row' 

      end

      context 'when there are no admin and handling fees' do
        before do
          add_product_to_cart order, product_fee, quantity: 2
          visit spree.cart_path
        end

        it 'hides admin and handlings row' 

      end
    end

    describe "tax" do
      before do
        add_enterprise_fee enterprise_fee
        add_product_to_cart order, product_tax
        visit spree.cart_path
      end

      it "shows the total tax for the order, including product tax and tax on fees" 

    end

    describe "updating quantities with insufficient stock available" do
      let(:li) { order.line_items(true).last }
      let(:variant) { product_tax.variants.first }

      before do
        add_product_to_cart order, product_tax
      end

      around do |example|
        original = Spree::Config.allow_backorders
        Spree::Config.allow_backorders = false
        example.run
        Spree::Config.allow_backorders = original
      end

      it "prevents me from entering an invalid value" 


      it "shows the quantities saved, not those submitted" 

    end

    context "when ordered in the same order cycle" do
      let(:address) { create(:address) }
      let(:user) { create(:user, bill_address: address, ship_address: address) }
      let!(:prev_order1) { create(:completed_order_with_totals, order_cycle: order_cycle, distributor: distributor, user: user) }
      let!(:prev_order2) { create(:completed_order_with_totals, order_cycle: order_cycle, distributor: distributor, user: user) }

      before do
        order.user = user
        order.save
        order.distributor.allow_order_changes = true
        order.distributor.save
        add_product_to_cart order, product_tax
        quick_login_as user
        visit spree.cart_path
      end

      it "shows already ordered line items" 

    end
  end
end

