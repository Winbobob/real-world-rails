require 'spec_helper'

feature %q{
  As an Administrator
  I want to be able to manage orders in bulk
} , js: true do
  include AuthenticationWorkflow
  include WebHelper

  context "listing orders" do
    before :each do
      login_to_admin_section
    end

    it "displays a message when number of line items is zero" 


    context "displaying the list of line items" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:o3) { create(:order_with_distributor, state: 'address', completed_at: nil ) }
      let!(:li1) { create(:line_item, order: o1 ) }
      let!(:li2) { create(:line_item, order: o2 ) }
      let!(:li3) { create(:line_item, order: o3 ) }

      before :each do
        visit '/admin/orders/bulk_management'
      end

      it "displays a list of line items" 

    end

    context "displaying individual columns" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, bill_address: create(:address) ) }
      let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, bill_address: nil ) }
      let!(:li1) { create(:line_item, order: o1 ) }
      let!(:li2) { create(:line_item, order: o2, product: create(:product_with_option_types) ) }

      before :each do
        visit '/admin/orders/bulk_management'
      end

      it "displays a column for user's full name" 


      it "displays a column for order date" 


      it "displays a column for producer" 


      it "displays a column for variant description, which shows only product name when options text is blank" 


      it "displays a field for quantity" 


      it "displays a column for max quantity" 

    end
  end

  context "altering line item properties" do
    before :each do
      admin_user = quick_login_as_admin
    end

    context "tracking changes" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:li1) { create(:line_item, order: o1, :quantity => 5 ) }

      before :each do
        visit '/admin/orders/bulk_management'
      end

      it "adds the class 'ng-dirty' to input elements when value is altered" 

    end

    context "submitting data to the server" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:li1) { create(:line_item, order: o1, :quantity => 5 ) }

      before :each do
        li1.variant.update_attributes(on_hand: 1, on_demand: false)
        visit '/admin/orders/bulk_management'
      end

      context "when acceptable data is sent to the server" do
        it "displays an update button which submits pending changes" 

      end

      context "when unacceptable data is sent to the server" do
        it "displays an update button which submits pending changes" 

      end
    end
  end

  context "using page controls" do
    before :each do
      admin_user = quick_login_as_admin
    end

    let!(:p1) { create(:product_with_option_types, group_buy: true, group_buy_unit_size: 5000, variant_unit: "weight", variants: [create(:variant, unit_value: 1000)] ) }
    let!(:v1) { p1.variants.first }
    let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
    let!(:li1) { create(:line_item, order: o1, variant: v1, :quantity => 5, :final_weight_volume => 1000, price: 10.00 ) }

    before { v1.update_attribute(:on_hand, 100)}

    context "modifying the weight/volume of a line item" do
      it "price is altered" 

    end

    context "modifying the quantity of a line item" do
      it "price is altered" 

    end

    context "modifying the quantity of a line item" do
      it "weight/volume is altered" 

    end

    context "using column display toggle" do
      it "shows a column display toggle button, which shows a list of columns when clicked" 

    end

    context "using drop down seletors" do
      context "supplier filter" do
        let!(:s1) { create(:supplier_enterprise) }
        let!(:s2) { create(:supplier_enterprise) }
        let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, order_cycle: create(:simple_order_cycle) ) }
        let!(:li1) { create(:line_item, order: o1, product: create(:product, supplier: s1) ) }
        let!(:li2) { create(:line_item, order: o1, product: create(:product, supplier: s2) ) }

        before :each do
          visit '/admin/orders/bulk_management'
        end

        it "displays a select box for producers, which filters line items by the selected supplier" 


        it "displays all line items when 'All' is selected from supplier filter" 

      end

      context "distributor filter" do
        let!(:d1) { create(:distributor_enterprise) }
        let!(:d2) { create(:distributor_enterprise) }
        let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, distributor: d1, order_cycle: create(:simple_order_cycle) ) }
        let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, distributor: d2, order_cycle: create(:simple_order_cycle) ) }
        let!(:li1) { create(:line_item, order: o1 ) }
        let!(:li2) { create(:line_item, order: o2 ) }

        before :each do
          visit '/admin/orders/bulk_management'
        end

        it "displays a select box for distributors, which filters line items by the selected distributor" 


        it "displays all line items when 'All' is selected from distributor filter" 

      end

      context "order_cycle filter" do
        let!(:distributor) { create(:distributor_enterprise) }
        let!(:oc1) { create(:simple_order_cycle, distributors: [distributor]) }
        let!(:oc2) { create(:simple_order_cycle, distributors: [distributor]) }
        let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, order_cycle: oc1 ) }
        let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, order_cycle: oc2 ) }
        let!(:li1) { create(:line_item, order: o1 ) }
        let!(:li2) { create(:line_item, order: o2 ) }

        before do
          visit '/admin/orders/bulk_management'
        end

        it "displays a select box for order cycles, which filters line items by the selected order cycle" 


        it "displays all line items when 'All' is selected from order_cycle filter" 

      end

      context "combination of filters" do
        let!(:s1) { create(:supplier_enterprise) }
        let!(:s2) { create(:supplier_enterprise) }
        let!(:d1) { create(:distributor_enterprise) }
        let!(:d2) { create(:distributor_enterprise) }
        let!(:oc1) { create(:simple_order_cycle, suppliers: [s1], distributors: [d1] ) }
        let!(:oc2) { create(:simple_order_cycle, suppliers: [s2], distributors: [d2] ) }
        let!(:p1) { create(:product, supplier: s1) }
        let!(:p2) { create(:product, supplier: s2) }
        let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, distributor: d1, order_cycle: oc1 ) }
        let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, distributor: d2, order_cycle: oc2 ) }
        let!(:li1) { create(:line_item, order: o1, product: p1 ) }
        let!(:li2) { create(:line_item, order: o2, product: p2 ) }

        before :each do
          visit '/admin/orders/bulk_management'
        end

        it "allows filters to be used in combination" 


        it "displays a 'Clear All' button which sets all select filters to 'All'" 

      end
    end

    context "using quick search" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:o3) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:li1) { create(:line_item, order: o1 ) }
      let!(:li2) { create(:line_item, order: o2 ) }
      let!(:li3) { create(:line_item, order: o3 ) }

      before :each do
        visit '/admin/orders/bulk_management'
      end

      it "displays a quick search input" 


      it "filters line items based on their attributes and the contents of the quick search input" 

    end

    context "using date restriction controls" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.today - 7.days - 1.second) }
      let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.today - 7.days) }
      let!(:o3) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now.end_of_day) }
      let!(:o4) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now.end_of_day + 1.second) }
      let!(:li1) { create(:line_item, order: o1, :quantity => 1 ) }
      let!(:li2) { create(:line_item, order: o2, :quantity => 2 ) }
      let!(:li3) { create(:line_item, order: o3, :quantity => 3 ) }
      let!(:li4) { create(:line_item, order: o4, :quantity => 4 ) }

      before :each do
        visit '/admin/orders/bulk_management'
      end

      it "displays date fields for filtering orders, with default values set" 


      it "only loads line items whose orders meet the date restriction criteria" 


      it "displays only line items whose orders meet the date restriction criteria, when changed" 


      context "when the form is dirty" do
        before do
          within("tr#li_#{li2.id} td.quantity") do
            page.fill_in "quantity", :with => (li2.quantity + 1).to_s
          end
        end

        it "shows a dialog and ignores changes when confirm dialog is accepted" 


        it "shows a dialog and keeps changes when confirm dialog is rejected" 

      end
    end

    context "bulk action controls" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:li1) { create(:line_item, order: o1 ) }
      let!(:li2) { create(:line_item, order: o2 ) }

      before :each do
        visit '/admin/orders/bulk_management'
      end

      it "displays a checkbox for each line item in the list" 


      it "displays a checkbox to which toggles the 'checked' state of all checkboxes" 


      it "displays a bulk action select box with a list of actions" 


      context "performing actions" do
        it "deletes selected items" 

      end

      context "when a filter has been applied" do
        it "only toggles checkboxes which are in filteredLineItems" 


        it "only applies the delete action to filteredLineItems" 

      end
    end

    context "using action buttons" do
      context "using edit buttons" do
        let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
        let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
        let!(:li1) { create(:line_item, order: o1 ) }
        let!(:li2) { create(:line_item, order: o2 ) }

        before :each do
          visit '/admin/orders/bulk_management'
        end

        it "shows an edit button for line_items, which takes the user to the standard edit page for the order" 

      end

      context "using delete buttons" do
        let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
        let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
        let!(:li1) { create(:line_item, order: o1 ) }
        let!(:li2) { create(:line_item, order: o2 ) }

        before :each do
          visit '/admin/orders/bulk_management'
        end

        it "removes a line item when the relevant delete button is clicked" 

      end
    end

    context "clicking the link on variant name" do
      let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:li1) { create(:line_item, order: o1 ) }
      let!(:li2) { create(:line_item, order: o2 ) }
      let!(:p3) { create(:product_with_option_types, group_buy: true, group_buy_unit_size: 5000, variant_unit: "weight", variants: [create(:variant, unit_value: 1000)] ) }
      let!(:v3) { p3.variants.first }
      let!(:o3) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now ) }
      let!(:li3) { create(:line_item, order: o3, variant: v3, quantity: 3, max_quantity: 6 ) }
      let!(:li4) { create(:line_item, order: o2, variant: v3, quantity: 1, max_quantity: 3 ) }

      before :each do
        visit '/admin/orders/bulk_management'
        within "tr#li_#{li3.id}" do
          find("a", text: li3.product.name + ": " + li3.variant.options_text).click
        end
      end

      it "displays group buy calc box" 


      it "all line items of the same variant" 


      context "clicking 'Clear' in group buy box" do
        before :each do
          find("a", text: "Clear").click
        end

        it "shows all products and clears group buy box" 

      end
    end
  end

  context "as an enterprise manager" do
    let(:s1) { create(:supplier_enterprise, name: 'First Supplier') }
    let(:d1) { create(:distributor_enterprise, name: 'First Distributor') }
    let(:d2) { create(:distributor_enterprise, name: 'Another Distributor') }
    let!(:o1) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, distributor: d1 ) }
    let!(:o2) { create(:order_with_distributor, state: 'complete', completed_at: Time.zone.now, distributor: d2 ) }
    let!(:line_item_distributed) { create(:line_item, order: o1, product: create(:product, supplier: s1) ) }
    let!(:line_item_not_distributed) { create(:line_item, order: o2, product: create(:product, supplier: s1) ) }

    before(:each) do
      @enterprise_user = create_enterprise_user
      @enterprise_user.enterprise_roles.build(enterprise: s1).save
      @enterprise_user.enterprise_roles.build(enterprise: d1).save

      quick_login_as @enterprise_user
    end

    it "displays a Bulk Management Tab under the Orders item" 


    it "shows only line item from orders that I distribute, and not those that I supply" 

  end
end

