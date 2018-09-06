require 'spec_helper'

feature %q{
  As an Administrator
  With products I can add to my hub's inventory
  I want to override the stock level and price of those products
  Without affecting other hubs that share the same products
}, js: true do
  include AuthenticationWorkflow
  include WebHelper

  let!(:hub) { create(:distributor_enterprise) }
  let!(:hub2) { create(:distributor_enterprise) }
  let!(:producer) { create(:supplier_enterprise) }
  let!(:producer_managed) { create(:supplier_enterprise) }
  let!(:producer_related) { create(:supplier_enterprise) }
  let!(:producer_unrelated) { create(:supplier_enterprise) }
  let!(:er1) { create(:enterprise_relationship, parent: producer, child: hub,
                      permissions_list: [:create_variant_overrides]) 
  }
  let!(:er2) { create(:enterprise_relationship, parent: producer_related, child: hub,
                      permissions_list: [:create_variant_overrides]) 
  }

  context "as an enterprise user" do
    let(:user) { create_enterprise_user enterprises: [hub, producer_managed] }
    before { quick_login_as user }

    describe "selecting a hub" do
      let!(:er1) { create(:enterprise_relationship, parent: hub2, child: producer_managed,
                          permissions_list: [:add_to_order_cycle]) 
      } # This er should not confer ability to create VOs for hub2

      it "displays a list of hub choices (ie. only those managed by the user)" 

    end

    context "when inventory_items exist for variants" do
      let!(:product) { create(:simple_product, supplier: producer, variant_unit: 'weight', variant_unit_scale: 1) }
      let!(:variant) { create(:variant, product: product, unit_value: 1, price: 1.23, on_hand: 12) }
      let!(:inventory_item) { create(:inventory_item, enterprise: hub, variant: variant ) }

      let!(:product_managed) { create(:simple_product, supplier: producer_managed, variant_unit: 'weight', variant_unit_scale: 1) }
      let!(:variant_managed) { create(:variant, product: product_managed, unit_value: 3, price: 3.65, on_hand: 2) }
      let!(:inventory_item_managed) { create(:inventory_item, enterprise: hub, variant: variant_managed ) }

      let!(:product_related) { create(:simple_product, supplier: producer_related) }
      let!(:variant_related) { create(:variant, product: product_related, unit_value: 2, price: 2.34, on_hand: 23) }
      let!(:inventory_item_related) { create(:inventory_item, enterprise: hub, variant: variant_related ) }

      let!(:product_unrelated) { create(:simple_product, supplier: producer_unrelated) }


      before do
        # Remove 'S' option value
        variant.option_values.first.destroy
      end

      context "when a hub is selected" do
        before do
          visit '/admin/inventory'
          select2_select hub.name, from: 'hub_id'
        end

        context "with no overrides" do
          it "displays the list of products with variants" 


          it "creates new overrides" 


          describe "creating and then updating the new override" do
            it "updates the same override instead of creating a duplicate" 

          end

          it "displays an error when unauthorised to access the page" 


          it "displays an error when unauthorised to update a particular override" 

        end

        context "with overrides" do
          let!(:vo) { create(:variant_override, variant: variant, hub: hub, price: 77.77, count_on_hand: 11111, default_stock: 1000, resettable: true, tag_list: ["tag1","tag2","tag3"]) }
          let!(:vo_no_auth) { create(:variant_override, variant: variant, hub: hub2, price: 1, count_on_hand: 2) }
          let!(:product2) { create(:simple_product, supplier: producer, variant_unit: 'weight', variant_unit_scale: 1) }
          let!(:variant2) { create(:variant, product: product2, unit_value: 8, price: 1.00, on_hand: 12) }
          let!(:inventory_item2) { create(:inventory_item, enterprise: hub, variant: variant2) }
          let!(:vo_no_reset) { create(:variant_override, variant: variant2, hub: hub, price: 3.99, count_on_hand: 40, default_stock: 100, resettable: false) }
          let!(:variant3) { create(:variant, product: product, unit_value: 2, price: 5.00, on_hand: 6) }
          let!(:vo3) { create(:variant_override, variant: variant3, hub: hub, price: 6, count_on_hand: 7, sku: "SOMESKU", default_stock: 100, resettable: false) }
          let!(:inventory_item3) { create(:inventory_item, enterprise: hub, variant: variant3) }

          before do
            visit '/admin/inventory'
            select2_select hub.name, from: 'hub_id'
          end

          it "product values are affected by overrides" 


          it "updates existing overrides" 


          # Any new fields added to the VO model need to be added to this test
          it "deletes overrides when values are cleared" 


          it "resets stock to defaults" 


          it "doesn't reset stock levels if the behaviour is disabled" 


          it "prompts to save changes before reset if any are pending" 

        end
      end

    end

    describe "when manually placing an order" do
      let!(:order_cycle) { create(:order_cycle_with_overrides, name: "Overidden") }
      let(:distributor) { order_cycle.distributors.first }
      let(:product) { order_cycle.products.first }

      before do
        login_to_admin_section

        visit 'admin/orders/new'
        select2_select distributor.name, from: 'order_distributor_id'
        select2_select order_cycle.name, from: 'order_order_cycle_id'
        click_button 'Next'
      end

      # Reproducing a bug, issue #1446
      it "shows the overridden price" 

    end

    describe "when inventory_items do not exist for variants" do
      let!(:product) { create(:simple_product, supplier: producer, variant_unit: 'weight', variant_unit_scale: 1) }
      let!(:variant1) { create(:variant, product: product, unit_value: 1, price: 1.23, on_hand: 12) }
      let!(:variant2) { create(:variant, product: product, unit_value: 2, price: 4.56, on_hand: 3) }

      context "when a hub is selected" do
        before do
          visit '/admin/inventory'
          select2_select hub.name, from: 'hub_id'
        end

        it "alerts the user to the presence of new products, and allows them to be added or hidden", retry: 3 do
          expect(page).to have_no_selector "table#variant-overrides tr#v_#{variant1.id}"
          expect(page).to have_no_selector "table#variant-overrides tr#v_#{variant2.id}"

          expect(page).to have_selector '.alert-row span.message', text: "There are 1 new products available to add to your inventory."
          click_button "Review Now"

          expect(page).to have_table_row ['PRODUCER', 'PRODUCT', 'VARIANT', 'ADD', 'HIDE']
          expect(page).to have_selector "table#new-products tr#v_#{variant1.id}"
          expect(page).to have_selector "table#new-products tr#v_#{variant2.id}"
          within "table#new-products tr#v_#{variant1.id}" do click_button 'Add' end
          within "table#new-products tr#v_#{variant2.id}" do click_button 'Hide' end
          expect(page).to have_no_selector "table#new-products tr#v_#{variant1.id}"
          expect(page).to have_no_selector "table#new-products tr#v_#{variant2.id}"
          click_button "Back to my inventory"

          expect(page).to have_selector "table#variant-overrides tr#v_#{variant1.id}"
          expect(page).to have_no_selector "table#variant-overrides tr#v_#{variant2.id}"

          first("div#views-dropdown").click
          first("div#views-dropdown div.menu div.menu_item", text: "Hidden Products").click

          expect(page).to have_no_selector "table#hidden-products tr#v_#{variant1.id}"
          expect(page).to have_selector "table#hidden-products tr#v_#{variant2.id}"
        end
      end
    end
  end
end
