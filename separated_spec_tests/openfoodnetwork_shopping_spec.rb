require 'spec_helper'

feature "As a consumer I want to shop with a distributor", js: true do
  include AuthenticationWorkflow
  include WebHelper
  include ShopWorkflow
  include UIComponentHelper

  describe "Viewing a distributor" do

    let(:distributor) { create(:distributor_enterprise, with_payment_and_shipping: true) }
    let(:supplier) { create(:supplier_enterprise) }
    let(:oc1) { create(:simple_order_cycle, distributors: [distributor], coordinator: create(:distributor_enterprise), orders_close_at: 2.days.from_now) }
    let(:oc2) { create(:simple_order_cycle, distributors: [distributor], coordinator: create(:distributor_enterprise), orders_close_at: 3.days.from_now) }
    let(:product) { create(:simple_product, supplier: supplier, meta_keywords: "Domestic") }
    let(:variant) { product.variants.first }
    let(:order) { create(:order, distributor: distributor) }

    before do
      set_order order
    end

    it "shows a distributor with images" 


    it "shows the producers for a distributor" 


    describe "selecting an order cycle" do
      let(:exchange1) { oc1.exchanges.to_enterprises(distributor).outgoing.first }

      it "selects an order cycle if only one is open" 


      describe "with multiple order cycles" do
        let(:exchange2) { oc2.exchanges.to_enterprises(distributor).outgoing.first }

        before do
          exchange1.update_attribute :pickup_time, "frogs"
          exchange2.update_attribute :pickup_time, "turtles"
        end

        it "shows a select with all order cycles, but doesn't show the products by default" 


        it "shows products after selecting an order cycle" 


        describe "changing order cycle" do
          it "shows the correct fees after selecting and changing an order cycle" 


          describe "declining to clear the cart" do
            before do
              add_variant_to_order_cycle(exchange2, variant)
              add_variant_to_order_cycle(exchange1, variant)

              visit shop_path
              select "turtles", from: "order_cycle_id"
              fill_in "variants[#{variant.id}]", with: 1
            end

            it "leaves the cart untouched when the user declines" 

          end
        end

        context "when logged in" do
          let!(:prev_order) { create(:completed_order_with_totals, order_cycle: oc1, distributor: distributor, user: order.user) }

          before do
            distributor.allow_order_changes = true
            distributor.save
            quick_login_as order.user
            visit shop_path
          end

          it "shows previous orders if order cycle was selected already" 


          it "shows previous orders after selecting an order cycle" 

        end
      end
    end

    describe "after selecting an order cycle with products visible" do
      let(:variant1) { create(:variant, product: product, price: 20) }
      let(:variant2) { create(:variant, product: product, price: 30, display_name: "Badgers") }
      let(:product2) { create(:simple_product, supplier: supplier, name: "Meercats", meta_keywords: "Wild") }
      let(:variant3) { create(:variant, product: product2, price: 40, display_name: "Ferrets") }
      let(:exchange) { Exchange.find(oc1.exchanges.to_enterprises(distributor).outgoing.first.id) }

      before do
        exchange.update_attribute :pickup_time, "frogs"
        add_variant_to_order_cycle(exchange, variant)
        add_variant_to_order_cycle(exchange, variant1)
        add_variant_to_order_cycle(exchange, variant2)
        add_variant_to_order_cycle(exchange, variant3)
        order.order_cycle = oc1
      end

      it "uses the adjusted price" 


      it "filters search results properly" 


      it "returns search results for products where the search term matches one of the product's variant names" 


    end

    describe "group buy products" do
      let(:exchange) { Exchange.find(oc1.exchanges.to_enterprises(distributor).outgoing.first.id) }
      let(:product) { create(:simple_product, group_buy: true, on_hand: 15) }
      let(:variant) { product.variants.first }
      let(:product2) { create(:simple_product, group_buy: false) }

      describe "with variants on the product" do
        let(:variant) { create(:variant, product: product, on_hand: 10 ) }
        before do
          add_variant_to_order_cycle(exchange, variant)
          set_order_cycle(order, oc1)
          visit shop_path
        end

        it "should save group buy data to the cart and display it on shopfront reload" 

      end
    end

    describe "adding and removing products from cart" do
      let(:exchange) { Exchange.find(oc1.exchanges.to_enterprises(distributor).outgoing.first.id) }
      let(:product) { create(:simple_product) }
      let(:variant) { create(:variant, product: product) }
      let(:variant2) { create(:variant, product: product) }

      before do
        add_variant_to_order_cycle(exchange, variant)
        add_variant_to_order_cycle(exchange, variant2)
        set_order_cycle(order, oc1)
        visit shop_path
      end

      it "lets us add and remove products from our cart" 


      it "alerts us when we enter a quantity greater than the stock available" 


      describe "when a product goes out of stock just before it's added to the cart" do
        it "stops the attempt, shows an error message and refreshes the products asynchronously" 


        context "group buy products" do
          let(:product) { create(:simple_product, group_buy: true) }

          it "does the same" 

        end

        context "when the update is for another product" do
          it "updates quantity" 


          context "group buy products" do
            let(:product) { create(:simple_product, group_buy: true) }

            it "does not update max_quantity" 

          end
        end
      end
    end

    context "when no order cycles are available" do
      it "tells us orders are closed" 

      it "shows the last order cycle" 

      it "shows the next order cycle" 

    end

    context "when shopping requires a customer" do
      let(:exchange) { Exchange.find(oc1.exchanges.to_enterprises(distributor).outgoing.first.id) }
      let(:product) { create(:simple_product) }
      let(:variant) { create(:variant, product: product) }
      let(:unregistered_customer) { create(:customer, user: nil, enterprise: distributor) }

      before do
        add_variant_to_order_cycle(exchange, variant)
        set_order_cycle(order, oc1)
        distributor.require_login = true
        distributor.save!
      end

      context "when not logged in" do
        it "tells us to login" 

      end

      context "when logged in" do
        let(:address) { create(:address, firstname: "Foo", lastname: "Bar") }
        let(:user) { create(:user, bill_address: address, ship_address: address) }

        before do
          quick_login_as user
        end

        context "as non-customer" do
          it "tells us to contact enterprise" 

        end

        context "as customer" do
          let!(:customer) { create(:customer, user: user, enterprise: distributor) }

          it "shows just products" 

        end

        context "as a manager" do
          let!(:role) { create(:enterprise_role, user: user, enterprise: distributor) }

          it "shows just products" 

        end

        context "as the owner" do
          before do
            distributor.owner = user
            distributor.save!
          end

          it "shows just products" 

        end
      end

      context "when previously unregistered customer registers" do
        let!(:returning_user) { create(:user, email: unregistered_customer.email) }

        before do
          quick_login_as returning_user
        end

        it "shows the products without customer only message" 

      end
    end
  end

  def shows_products_without_customer_warning
    expect(page).to have_no_content "This shop is for customers only."
    expect(page).to have_content product.name
  end
end

