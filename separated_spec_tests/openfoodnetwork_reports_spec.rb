require "spec_helper"

feature %q{
    As an administrator
    I want numbers, all the numbers!
} do
  include AuthenticationWorkflow
  include WebHelper

  context "Permissions for different reports" do
    context "As an enterprise user" do
      let(:user) do
        create_enterprise_user(enterprises: [
          create(:distributor_enterprise)
        ])
      end
      it "does not show super admin only reports" 

    end
    context "As an admin user" do
      it "shows the super admin only reports" 

    end
  end

  describe "Customers report" do
    before do
      login_to_admin_section
      click_link "Reports"
    end
    scenario "customers report" do
      click_link "Mailing List"
      expect(page).to have_select('report_type', selected: 'Mailing List')

      rows = find("table#listing_customers").all("thead tr")
      table = rows.map { |r| r.all("th").map { |c| c.text.strip } }
      table.sort.should == [
        ["Email", "First Name", "Last Name", "Suburb"]
      ].sort
    end

    scenario "customers report" do
      click_link "Addresses"
      expect(page).to have_select('report_type', selected: 'Addresses')

      rows = find("table#listing_customers").all("thead tr")
      table = rows.map { |r| r.all("th").map { |c| c.text.strip } }
      table.sort.should == [
        ["First Name", "Last Name", "Billing Address", "Email", "Phone", "Hub", "Hub Address", "Shipping Method"]
      ].sort
    end
  end

  describe "Order cycle management report" do
    before do
      login_to_admin_section
      click_link "Reports"
    end

    scenario "payment method report" do
      click_link "Payment Methods Report"
      rows = find("table#listing_ocm_orders").all("thead tr")
      table = rows.map { |r| r.all("th").map { |c| c.text.strip } }
      table.sort.should == [
        ["First Name", "Last Name", "Hub", "Hub Code", "Email", "Phone", "Shipping Method", "Payment Method", "Amount", "Balance"]
      ].sort
    end

    scenario "delivery report" do
      click_link "Delivery Report"
      rows = find("table#listing_ocm_orders").all("thead tr")
      table = rows.map { |r| r.all("th").map { |c| c.text.strip } }
      table.sort.should == [
        ["First Name", "Last Name", "Hub", "Hub Code", "Delivery Address", "Delivery Postcode", "Phone", "Shipping Method", "Payment Method", "Amount", "Balance", "Temp Controlled Items?", "Special Instructions"]
      ].sort
    end
  end

  describe "Packing reports" do
    before do
      login_to_admin_section
      click_link "Reports"
    end

    let(:bill_address1) { create(:address, lastname: "Aman") }
    let(:bill_address2) { create(:address, lastname: "Bman") }
    let(:distributor_address) { create(:address, :address1 => "distributor address", :city => 'The Shire', :zipcode => "1234") }
    let(:distributor) { create(:distributor_enterprise, :address => distributor_address) }
    let(:order1) { create(:order, distributor: distributor, bill_address: bill_address1) }
    let(:order2) { create(:order, distributor: distributor, bill_address: bill_address2) }
    let(:supplier) { create(:supplier_enterprise, name: "Supplier") }
    let(:product_1) { create(:simple_product, name: "Product 1", supplier: supplier ) }
    let(:variant_1) { create(:variant, product: product_1, unit_description: "Big") }
    let(:variant_2) { create(:variant, product: product_1, unit_description: "Small") }
    let(:product_2) { create(:simple_product, name: "Product 2", supplier: supplier) }

    before do
      Timecop.travel(Time.zone.local(2013, 4, 25, 14, 0, 0)) { order1.finalize! }
      Timecop.travel(Time.zone.local(2013, 4, 25, 15, 0, 0)) { order2.finalize! }

      create(:line_item, variant: variant_1, quantity: 1, order: order1)
      create(:line_item, variant: variant_2, quantity: 3, order: order1)
      create(:line_item, variant: product_2.master, quantity: 3, order: order2)

    end

    scenario "Pack By Customer" do
      click_link "Pack By Customer"
      fill_in 'q_completed_at_gt', with: '2013-04-25 13:00:00'
      fill_in 'q_completed_at_lt', with: '2013-04-25 16:00:00'
      #select 'Pack By Customer', from: 'report_type'
      click_button 'Search'

      rows = find("table#listing_orders.index").all("thead tr")
      table = rows.map { |r| r.all("th").map { |c| c.text.strip } }
      table.sort.should == [
        ["Hub", "Code", "First Name", "Last Name", "Supplier", "Product", "Variant", "Quantity", "TempControlled?"]
      ].sort
      page.should have_selector 'table#listing_orders tbody tr', count: 5 # Totals row per order
    end

    scenario "Pack By Supplier" do
      click_link "Pack By Supplier"
      fill_in 'q_completed_at_gt', with: '2013-04-25 13:00:00'
      fill_in 'q_completed_at_lt', with: '2013-04-25 16:00:00'
      #select 'Pack By Customer', from: 'report_type'
      click_button 'Search'

      rows = find("table#listing_orders").all("thead tr")
      table = rows.map { |r| r.all("th").map { |c| c.text.strip } }
      table.sort.should == [
        ["Hub", "Supplier", "Code", "First Name", "Last Name", "Product", "Variant", "Quantity", "TempControlled?"]
      ].sort
      all('table#listing_orders tbody tr').count.should == 4 # Totals row per supplier
    end
  end


  scenario "orders and distributors report" do
    login_to_admin_section
    click_link 'Reports'
    click_link 'Orders And Distributors'

    page.should have_content 'Order date'
  end

  scenario "bulk co-op report" do
    login_to_admin_section
    click_link 'Reports'
    click_link 'Bulk Co-Op'

    page.should have_content 'Supplier'
  end

  scenario "payments reports" do
    login_to_admin_section
    click_link 'Reports'
    click_link 'Payment Reports'

    page.should have_content 'Payment State'
  end

  describe "sales tax report" do
    let(:distributor1) { create(:distributor_enterprise, with_payment_and_shipping: true, charges_sales_tax: true) }
    let(:distributor2) { create(:distributor_enterprise, with_payment_and_shipping: true, charges_sales_tax: true) }
    let(:user1) { create_enterprise_user enterprises: [distributor1] }
    let(:user2) { create_enterprise_user enterprises: [distributor2] }
    let(:shipping_method) { create(:shipping_method, name: "Shipping", description: "Expensive", calculator: Spree::Calculator::FlatRate.new(preferred_amount: 100.55)) }
    let(:enterprise_fee) { create(:enterprise_fee, enterprise: user1.enterprises.first, tax_category: product2.tax_category, calculator: Spree::Calculator::FlatRate.new(preferred_amount: 120.0)) }
    let(:order_cycle) { create(:simple_order_cycle, coordinator: distributor1, coordinator_fees: [enterprise_fee], distributors: [distributor1], variants: [product1.master]) }

    let!(:zone) { create(:zone_with_member) }
    let(:order1) { create(:order, order_cycle: order_cycle, distributor: user1.enterprises.first, shipping_method: shipping_method, bill_address: create(:address)) }
    let(:product1) { create(:taxed_product, zone: zone, price: 12.54, tax_rate_amount: 0) }
    let(:product2) { create(:taxed_product, zone: zone, price: 500.15, tax_rate_amount: 0.2) }

    let!(:line_item1) { create(:line_item, variant: product1.master, price: 12.54, quantity: 1, order: order1) }
    let!(:line_item2) { create(:line_item, variant: product2.master, price: 500.15, quantity: 3, order: order1) }

    let!(:adj_shipping) { create(:adjustment, adjustable: order1, label: "Shipping", amount: 100.55) }

    before do
      Spree::Config.shipment_inc_vat = true
      Spree::Config.shipping_tax_rate = 0.2

      3.times { order1.next }
      order1.reload.update_distribution_charge!

      order1.finalize!

      login_to_admin_as user1
      click_link "Reports"
      click_link "Sales Tax"
      select("Tax types", from: "report_type")
    end

    it "reports" 

  end

  describe "orders & fulfilment reports" do
    it "loads the report page" 


    context "with two orders on the same day at different times" do
      let(:bill_address) { create(:address) }
      let(:distributor_address) { create(:address, :address1 => "distributor address", :city => 'The Shire', :zipcode => "1234") }
      let(:distributor) { create(:distributor_enterprise, :address => distributor_address) }
      let(:product) { create(:product) }
      let(:product_distribution) { create(:product_distribution, :product => product, :distributor => distributor) }
      let(:shipping_instructions) { "pick up on thursday please!" }
      let(:order1) { create(:order, :distributor => distributor, :bill_address => bill_address, :special_instructions => shipping_instructions) }
      let(:order2) { create(:order, :distributor => distributor, :bill_address => bill_address, :special_instructions => shipping_instructions) }

      before do
        Timecop.travel(Time.zone.local(2013, 4, 25, 14, 0, 0)) { order1.finalize! }
        Timecop.travel(Time.zone.local(2013, 4, 25, 16, 0, 0)) { order2.finalize! }

        create(:line_item, :product => product, :order => order1)
        create(:line_item, :product => product, :order => order2)
      end

      it "is precise to time of day, not just date" 

    end

    it "handles order cycles with nil opening or closing times" 

  end

  describe "products and inventory report", js: true do
    let(:supplier) { create(:supplier_enterprise, name: 'Supplier Name') }
    let(:taxon)    { create(:taxon, name: 'Taxon Name') }
    let(:product1) { create(:simple_product, name: "Product Name", price: 100, supplier: supplier, primary_taxon: taxon) }
    let(:product2) { create(:simple_product, name: "Product 2", price: 99.0, variant_unit: 'weight', variant_unit_scale: 1, unit_value: '100', supplier: supplier, primary_taxon: taxon, sku: "product_sku") }
    let(:variant1) { product1.variants.first }
    let(:variant2) { create(:variant, product: product1, price: 80.0) }
    let(:variant3) { product2.variants.first }

    before do
      product1.set_property 'Organic', 'NASAA 12345'
      product2.set_property 'Organic', 'NASAA 12345'
      product1.taxons = [taxon]
      product2.taxons = [taxon]
      variant1.update_column(:count_on_hand, 10)
      variant1.update_column(:sku, "sku1")
      variant2.update_column(:count_on_hand, 20)
      variant2.update_column(:sku, "sku2")
      variant3.update_column(:count_on_hand, 9)
      variant3.update_column(:sku, "")
      variant1.option_values = [create(:option_value, :presentation => "Test")]
      variant2.option_values = [create(:option_value, :presentation => "Something")]
    end

    it "shows products and inventory report" 


    it "shows the LettuceShare report" 

  end

  describe "users and enterprises report" do
    let!(:enterprise1) { create( :enterprise, owner: create_enterprise_user ) }
    let!(:enterprise2) { create( :enterprise, owner: create_enterprise_user ) }
    let!(:enterprise3) { create( :enterprise, owner: create_enterprise_user ) }

    before do
      enterprise3.enterprise_roles.build( user: enterprise1.owner ).save

      login_to_admin_section
      click_link 'Reports'

      click_link 'Users & Enterprises'
    end

    it "shows users and enterprises report" 


    it "filters the list" 

  end

  describe "Xero invoices report" do
    let(:distributor1) { create(:distributor_enterprise, with_payment_and_shipping: true, charges_sales_tax: true) }
    let(:distributor2) { create(:distributor_enterprise, with_payment_and_shipping: true, charges_sales_tax: true) }
    let(:user1) { create_enterprise_user enterprises: [distributor1] }
    let(:user2) { create_enterprise_user enterprises: [distributor2] }
    let(:shipping_method) { create(:shipping_method, name: "Shipping", description: "Expensive", calculator: Spree::Calculator::FlatRate.new(preferred_amount: 100.55)) }
    let(:enterprise_fee1) { create(:enterprise_fee, enterprise: user1.enterprises.first, tax_category: product2.tax_category, calculator: Spree::Calculator::FlatRate.new(preferred_amount: 10)) }
    let(:enterprise_fee2) { create(:enterprise_fee, enterprise: user1.enterprises.first, tax_category: product2.tax_category, calculator: Spree::Calculator::FlatRate.new(preferred_amount: 20)) }
    let(:order_cycle) { create(:simple_order_cycle, coordinator: distributor1, coordinator_fees: [enterprise_fee1, enterprise_fee2], distributors: [distributor1], variants: [product1.master]) }

    let!(:zone) { create(:zone_with_member) }
    let(:country) { Spree::Country.find Spree::Config.default_country_id }
    let(:bill_address) { create(:address, firstname: 'Customer', lastname: 'Name', address1: 'customer l1', address2: '', city: 'customer city', zipcode: 1234, country: country) }
    let(:order1) { create(:order, order_cycle: order_cycle, distributor: user1.enterprises.first, shipping_method: shipping_method, bill_address: bill_address) }
    let(:product1) { create(:taxed_product, zone: zone, price: 12.54, tax_rate_amount: 0, sku: 'sku1') }
    let(:product2) { create(:taxed_product, zone: zone, price: 500.15, tax_rate_amount: 0.2, sku: 'sku2') }

    let!(:line_item1) { create(:line_item, variant: product1.master, price: 12.54, quantity: 1, order: order1) }
    let!(:line_item2) { create(:line_item, variant: product2.master, price: 500.15, quantity: 3, order: order1) }

    let!(:adj_shipping) { create(:adjustment, adjustable: order1, label: "Shipping", originator: shipping_method, amount: 100.55, included_tax: 10.06) }
    let!(:adj_fee1) { create(:adjustment, adjustable: order1, originator: enterprise_fee1, label: "Enterprise fee untaxed", amount: 10, included_tax: 0) }
    let!(:adj_fee2) { create(:adjustment, adjustable: order1, originator: enterprise_fee2, label: "Enterprise fee taxed", amount: 20, included_tax: 2) }
    let!(:adj_manual1) { create(:adjustment, adjustable: order1, originator: nil, source: nil, label: "Manual adjustment", amount: 30, included_tax: 0) }
    let!(:adj_manual2) { create(:adjustment, adjustable: order1, originator: nil, source: nil, label: "Manual adjustment", amount: 40, included_tax: 3) }


    before do
      order1.update_attribute :email, 'customer@email.com'
      Timecop.travel(Time.zone.local(2015, 4, 25, 14, 0, 0)) { order1.finalize! }

      login_to_admin_section
      click_link 'Reports'

      click_link 'Xero Invoices'
    end

    around do |example|
      Timecop.travel(Time.zone.local(2015, 4, 26, 14, 0, 0)) do
        example.yield
      end
    end

    it "shows Xero invoices report" 


    it "can customise a number of fields" 


    it "generates a detailed report" 


    describe "account invoices" do
      let(:accounts_distributor)  { create(:distributor_enterprise) }
      let(:billable_period) { create(:billable_period, account_invoice: account_invoice) }
      let(:account_invoice) { create(:account_invoice, order: account_invoice_order) }
      let!(:account_invoice_order) { create(:order, order_cycle: order_cycle, distributor: accounts_distributor) }
      let!(:adjustment) { create(:adjustment, adjustable: account_invoice_order, source: billable_period, label: 'Account invoice item', amount: 12.34) } # Tax?

      before do
        Spree::Config.accounts_distributor_id = accounts_distributor.id

        account_invoice_order.update_attribute :email, 'customer@email.com'
        Timecop.travel(Time.zone.local(2015, 4, 25, 14, 0, 0)) { account_invoice_order.finalize! }

        visit current_path
      end

      it "generates a detailed report for account invoices" 

    end


    private

    def xero_invoice_table
      find("table#listing_invoices")
    end

    def xero_invoice_header
      %w(*ContactName EmailAddress POAddressLine1 POAddressLine2 POAddressLine3 POAddressLine4 POCity PORegion POPostalCode POCountry *InvoiceNumber Reference *InvoiceDate *DueDate InventoryItemCode *Description *Quantity *UnitAmount Discount *AccountCode *TaxType TrackingName1 TrackingOption1 TrackingName2 TrackingOption2 Currency BrandingTheme Paid?)
    end

    def xero_invoice_summary_row(description, amount, tax_type, opts={})
      xero_invoice_row '', description, amount, '1', tax_type, opts
    end

    def xero_invoice_li_row(line_item, opts={})
      tax_type = line_item.has_tax? ? 'GST on Income' : 'GST Free Income'
      xero_invoice_row line_item.product.sku, line_item.product_and_full_name, line_item.price.to_s, line_item.quantity.to_s, tax_type, opts
    end

    def xero_invoice_adjustment_row(adjustment, opts={})
      tax_type = adjustment.has_tax? ? 'GST on Income' : 'GST Free Income'
      xero_invoice_row('', adjustment.label, adjustment.amount, '1', tax_type, opts)
    end

    def xero_invoice_account_invoice_row(adjustment, opts={})
      opts.reverse_merge!({customer_name: '', address1: '', city: '', state: '', zipcode: '', country: '', invoice_number: account_invoice_order.number, order_number: account_invoice_order.number})
      xero_invoice_adjustment_row(adjustment, opts)
    end

    def xero_invoice_row(sku, description, amount, quantity, tax_type, opts={})
      opts.reverse_merge!({customer_name: 'Customer Name', address1: 'customer l1', city: 'customer city', state: 'Victoria', zipcode: '1234', country: country.name, invoice_number: order1.number, order_number: order1.number, invoice_date: '2015-04-26', due_date: '2015-05-26', account_code: 'food sales'})

      [opts[:customer_name], 'customer@email.com', opts[:address1], '', '', '', opts[:city], opts[:state], opts[:zipcode], opts[:country], opts[:invoice_number], opts[:order_number], opts[:invoice_date], opts[:due_date],

       sku,
       description,
       quantity,
       amount.to_s, '', opts[:account_code], tax_type, '', '', '', '', Spree::Config.currency, '', 'N']
    end
  end
end

