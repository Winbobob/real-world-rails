require 'spec_helper'

feature "As a consumer I want to check out my cart", js: true, retry: 3 do
  include AuthenticationWorkflow
  include ShopWorkflow
  include CheckoutWorkflow
  include WebHelper
  include UIComponentHelper

  let!(:zone) { create(:zone_with_member) }
  let(:distributor) { create(:distributor_enterprise, charges_sales_tax: true) }
  let(:supplier) { create(:supplier_enterprise) }
  let!(:order_cycle) { create(:simple_order_cycle, suppliers: [supplier], distributors: [distributor], coordinator: create(:distributor_enterprise), variants: [variant]) }
  let(:enterprise_fee) { create(:enterprise_fee, amount: 1.23, tax_category: product.tax_category) }
  let(:product) { create(:taxed_product, supplier: supplier, price: 10, zone: zone, tax_rate_amount: 0.1) }
  let(:variant) { product.variants.first }
  let(:order) { create(:order, order_cycle: order_cycle, distributor: distributor) }

  before do
    Spree::Config.shipment_inc_vat = true
    Spree::Config.shipping_tax_rate = 0.25

    add_enterprise_fee enterprise_fee
    set_order order
    add_product_to_cart order, product
  end

  describe "with shipping and payment methods" do
    let(:sm1) { create(:shipping_method, require_ship_address: true, name: "Frogs", description: "yellow", calculator: Spree::Calculator::FlatRate.new(preferred_amount: 0.00)) }
    let(:sm2) { create(:shipping_method, require_ship_address: false, name: "Donkeys", description: "blue", calculator: Spree::Calculator::FlatRate.new(preferred_amount: 4.56)) }
    let(:sm3) { create(:shipping_method, require_ship_address: false, name: "Local", tag_list: "local") }
    let!(:pm1) { create(:payment_method, distributors: [distributor], name: "Roger rabbit", type: "Spree::PaymentMethod::Check") }
    let!(:pm2) { create(:payment_method, distributors: [distributor], calculator: Spree::Calculator::FlatRate.new(preferred_amount: 5.67)) }
    let!(:pm3) do
      Spree::Gateway::PayPalExpress.create!(name: "Paypal", environment: 'test', distributor_ids: [distributor.id]).tap do |pm|
        pm.preferred_login = 'devnull-facilitator_api1.rohanmitchell.com'
        pm.preferred_password = '1406163716'
        pm.preferred_signature = 'AFcWxV21C7fd0v3bYYYRCpSSRl31AaTntNJ-AjvUJkWf4dgJIvcLsf1V'
      end
    end

    before do
      distributor.shipping_methods << sm1
      distributor.shipping_methods << sm2
      distributor.shipping_methods << sm3
    end

    describe "when I have an out of stock product in my cart" do
      before do
        variant.on_hand = 0
        variant.save!
      end

      it "returns me to the cart with an error message" 

    end

    context 'login in as user' do
      let(:user) { create(:user) }

      def fill_out_form
        toggle_shipping
        choose sm1.name
        toggle_payment
        choose pm1.name
        toggle_details
        within "#details" do
          fill_in "First Name", with: "Will"
          fill_in "Last Name", with: "Marshall"
          fill_in "Email", with: "test@test.com"
          fill_in "Phone", with: "0468363090"
        end
        toggle_billing
        check "Save as default billing address"
        within "#billing" do
          fill_in "City", with: "Melbourne"
          fill_in "Postcode", with: "3066"
          fill_in "Address", with: "123 Your Head"
          select "Australia", from: "Country"
          select "Victoria", from: "State"
        end

        toggle_shipping
        check "Shipping address same as billing address?"
        check "Save as default shipping address"
      end

      before do
        quick_login_as(user)
      end

      context "with details filled out" do
        before do
          visit checkout_path
          fill_out_form
        end

        it "allows user to save default billing address and shipping address" 


        it "it doesn't tell about previous orders" 

      end

      context "with previous orders" do
        let!(:prev_order) { create(:completed_order_with_totals, order_cycle: order_cycle, distributor: distributor, user: order.user) }

        before do
          order.distributor.allow_order_changes = true
          order.distributor.save
          visit checkout_path
        end

        it "informs about previous orders" 

      end

      context "when the user has a preset shipping and billing address" do
        before do
          user.bill_address = build(:address)
          user.ship_address = build(:address)
          user.save!
        end

        it "checks out successfully" 

      end

      context "with Stripe" do
        let!(:stripe_pm) do
          create(:stripe_payment_method,
            distributors: [distributor],
            name: "Stripe",
            preferred_enterprise_id: distributor.id)
        end

        let!(:saved_card) do
          create(:credit_card,
          user_id: user.id,
          month: "01",
          year: "2025",
          cc_type: "visa",
          number: "1111111111111111",
          payment_method_id: stripe_pm.id,
          gateway_customer_profile_id: "i_am_saved")
        end

        let!(:stripe_account) { create(:stripe_account, enterprise_id: distributor.id, stripe_user_id: 'some_id') }

        let(:response_mock) { { id: "ch_1234", object: "charge", amount: 2000} }

        before do
          allow(Stripe).to receive(:api_key) { "sk_test_12345" }
          allow(Stripe).to receive(:publishable_key) { "some_key" }
          Spree::Config.set(stripe_connect_enabled: true)
          stub_request(:post, "https://sk_test_12345:@api.stripe.com/v1/charges")
            .to_return(status: 200, body: JSON.generate(response_mock))

          visit checkout_path
          fill_out_form
          toggle_payment
          choose stripe_pm.name
        end

        it "allows use of a saved card" 

      end
    end

    context "on the checkout page" do
      before do
        visit checkout_path
        checkout_as_guest
      end

      it "shows the current distributor" 


      it 'does not show the save as defalut address checkbox' 


      it "shows a breakdown of the order price" 


      it "shows all shipping methods in order by name" 


      context "when shipping method requires an address" do
        before do
          toggle_shipping
          choose sm1.name
        end
        it "shows ship address forms when 'same as billing address' is unchecked" 

      end

      context "using FilterShippingMethods" do
        let(:user) { create(:user) }
        let(:customer) { create(:customer, user: user, enterprise: distributor) }

        it "shows shipping methods allowed by the rule" 

      end
    end

    context "on the checkout page with payments open" do
      before do
        visit checkout_path
        checkout_as_guest
        toggle_payment
      end

      it "shows all available payment methods" 


      describe "purchasing" do
        it "takes us to the order confirmation page when we submit a complete form" 


        context "with basic details filled" do
          before do
            toggle_shipping
            choose sm1.name
            toggle_payment
            choose pm1.name
            toggle_details
            within "#details" do
              fill_in "First Name", with: "Will"
              fill_in "Last Name", with: "Marshall"
              fill_in "Email", with: "test@test.com"
              fill_in "Phone", with: "0468363090"
            end
            toggle_billing
            within "#billing" do
              fill_in "City", with: "Melbourne"
              fill_in "Postcode", with: "3066"
              fill_in "Address", with: "123 Your Face"
              select "Australia", from: "Country"
              select "Victoria", from: "State"
            end
            toggle_shipping
            check "Shipping address same as billing address?"
          end

          it "takes us to the order confirmation page when submitted with 'same as billing address' checked" 


          it "takes us to the cart page with an error when a product becomes out of stock just before we purchase", js: true do
            variant.on_hand = 0
            variant.save!

            place_order

            page.should_not have_content "Your order has been processed successfully"
            page.should have_selector 'closing', text: "Your shopping cart"
            page.should have_content "Out of Stock"
          end

          context "when we are charged a shipping fee" do
            before { choose sm2.name }

            it "creates a payment for the full amount inclusive of shipping" 

          end

          context "when we are charged a payment method fee (transaction fee)" do
            it "creates a payment including the transaction fee" 

          end

          describe "credit card payments" do
            ["Spree::Gateway::Bogus", "Spree::Gateway::BogusSimple"].each do |gateway_type|
              context "with a credit card payment method using #{gateway_type}" do
                let!(:pm1) { create(:payment_method, distributors: [distributor], name: "Roger rabbit", type: gateway_type) }

                it "takes us to the order confirmation page when submitted with a valid credit card" 


                it "shows the payment processing failed message when submitted with an invalid credit card" 

              end
            end
          end
        end
      end
    end
  end
end
