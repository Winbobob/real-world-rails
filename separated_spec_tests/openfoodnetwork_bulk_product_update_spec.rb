require 'spec_helper'

feature %q{
  As an Administrator
  I want to be able to manage products in bulk
} , js: true do
  include AuthenticationWorkflow
  include WebHelper

  describe "listing products" do
    before :each do
      login_to_admin_section
    end

    it "displays a list of products" 


    it "displays a message when number of products is zero" 


    it "displays a select box for suppliers, with the appropriate supplier selected" 


    it "displays a date input for available_on for each product, formatted to yyyy-mm-dd hh:mm:ss" 


    it "displays an on hand count in a span for each product" 


    it "displays 'on demand' for any variant that is available on demand" 


    it "displays a select box for the unit of measure for the product's variants" 


    it "displays a text field for the item name when unit is set to 'Items'" 

  end

  describe "listing variants" do
    before :each do
      login_to_admin_section
    end

    it "displays a list of variants for each product" 


    it "displays an on_hand input (for each variant) for each product" 



    it "displays a price input (for each variant) for each product" 


    it "displays a unit value field (for each variant) for each product" 

  end


  scenario "creating a new product" do
    s = FactoryBot.create(:supplier_enterprise)
    d = FactoryBot.create(:distributor_enterprise)
    taxon = create(:taxon)

    login_to_admin_section

    visit '/admin/products/bulk_edit'

    find("a", text: "NEW PRODUCT").click
    expect(page).to have_content 'NEW PRODUCT'

    fill_in 'product_name', :with => 'Big Bag Of Apples'
    select s.name, :from => 'product_supplier_id'
    select 'Weight (g)', from: 'product_variant_unit_with_scale'
    fill_in 'product_unit_value_with_description', with: '100'
    fill_in 'product_price', :with => '10.00'
    select taxon.name, from: 'product_primary_taxon_id'
    click_button 'Create'

    expect(URI.parse(current_url).path).to eq '/admin/products/bulk_edit'
    expect(flash_message).to eq 'Product "Big Bag Of Apples" has been successfully created!'
    expect(page).to have_field "product_name", with: 'Big Bag Of Apples'
  end


  scenario "creating new variants" do
    # Given a product without variants or a unit
    p = FactoryBot.create(:product, variant_unit: 'weight', variant_unit_scale: 1000)
    login_to_admin_section
    visit '/admin/products/bulk_edit'

    # I should see an add variant button
    page.find('a.view-variants').trigger('click')

    # When I add three variants
    page.find('a.add-variant', visible: true).trigger('click')
    page.find('a.add-variant', visible: true).trigger('click')

    # They should be added, and should not see edit buttons for new variants
    expect(page).to have_selector "tr.variant", count: 3
    expect(page).to have_selector "a.edit-variant", count: 1

    # When I remove two, they should be removed
    page.all('a.delete-variant', visible: true).first.click
    expect(page).to have_selector "tr.variant", count: 2
    page.all('a.delete-variant', visible: true).first.click
    expect(page).to have_selector "tr.variant", count: 1

    # When I fill out variant details and hit update
    fill_in "variant_display_name", with: "Case of 12 Bottles"
    fill_in "variant_unit_value_with_description", with: "3 (12x250 mL bottles)"
    fill_in "variant_display_as", with: "Case"
    fill_in "variant_price", with: "4.0"
    fill_in "variant_on_hand", with: "10"

    click_button 'Save Changes', match: :first
    expect(page.find("#status-message")).to have_content "Changes saved."

    updated_variant = Spree::Variant.where(deleted_at: nil).last
    expect(updated_variant.display_name).to eq "Case of 12 Bottles"
    expect(updated_variant.unit_value).to eq 3000
    expect(updated_variant.unit_description).to eq "(12x250 mL bottles)"
    expect(updated_variant.display_as).to eq "Case"
    expect(updated_variant.price).to eq 4.0
    expect(updated_variant.on_hand).to eq 10

    # Then I should see edit buttons for the new variant
    expect(page).to have_selector "a.edit-variant", visible: true
  end

  scenario "updating product attributes" do
    s1 = FactoryBot.create(:supplier_enterprise)
    s2 = FactoryBot.create(:supplier_enterprise)
    t1 = FactoryBot.create(:taxon)
    t2 = FactoryBot.create(:taxon)
    p = FactoryBot.create(:product, supplier: s1, available_on: Date.current, variant_unit: 'volume', variant_unit_scale: 1, primary_taxon: t2, sku: "OLD SKU")

    login_to_admin_section

    visit '/admin/products/bulk_edit'

    find("div#columns-dropdown", :text => "COLUMNS").click
    find("div#columns-dropdown div.menu div.menu_item", text: "Available On").click
    find("div#columns-dropdown div.menu div.menu_item", text: /^Category?/).click
    find("div#columns-dropdown div.menu div.menu_item", text: "Inherits Properties?").click
    find("div#columns-dropdown div.menu div.menu_item", text: "SKU").click
    find("div#columns-dropdown", :text => "COLUMNS").click

    within "tr#p_#{p.id}" do
      expect(page).to have_field "product_name", with: p.name
      expect(page).to have_select "producer_id", selected: s1.name
      expect(page).to have_field "available_on", with: p.available_on.strftime("%F %T")
      expect(page).to have_select2 "p#{p.id}_category_id", selected: t2.name
      expect(page).to have_select "variant_unit_with_scale", selected: "Volume (L)"
      expect(page).to have_checked_field "inherits_properties"
      expect(page).to have_field "product_sku", with: p.sku

      fill_in "product_name", with: "Big Bag Of Potatoes"
      select s2.name, :from => 'producer_id'
      fill_in "available_on", with: (3.days.ago.beginning_of_day).strftime("%F %T")
      select "Weight (kg)", from: "variant_unit_with_scale"
      select2_select t1.name, from: "p#{p.id}_category_id"
      uncheck "inherits_properties"
      fill_in "product_sku", with: "NEW SKU"
    end

    click_button 'Save Changes', match: :first
    expect(page.find("#status-message")).to have_content "Changes saved."

    p.reload
    expect(p.name).to eq "Big Bag Of Potatoes"
    expect(p.supplier).to eq s2
    expect(p.variant_unit).to eq "weight"
    expect(p.variant_unit_scale).to eq 1000 # Kg
    expect(p.available_on).to eq 3.days.ago.beginning_of_day
    expect(p.primary_taxon).to eq t1
    expect(p.inherits_properties).to be false
    expect(p.sku).to eq "NEW SKU"
  end

  scenario "updating a product with a variant unit of 'items'" do
    p = FactoryBot.create(:product, variant_unit: 'weight', variant_unit_scale: 1000)

    login_to_admin_section

    visit '/admin/products/bulk_edit'

    expect(page).to have_select "variant_unit_with_scale", selected: "Weight (kg)"

    select "Items", from: "variant_unit_with_scale"
    fill_in "variant_unit_name", with: "loaf"

    click_button 'Save Changes', match: :first
    expect(page.find("#status-message")).to have_content "Changes saved."

    p.reload
    expect(p.variant_unit).to eq "items"
    expect(p.variant_unit_scale).to be_nil
    expect(p.variant_unit_name).to eq "loaf"
  end

  scenario "updating a product with variants" do
    s1 = FactoryBot.create(:supplier_enterprise)
    s2 = FactoryBot.create(:supplier_enterprise)
    p = FactoryBot.create(:product, supplier: s1, available_on: Date.current, variant_unit: 'volume', variant_unit_scale: 0.001,
      price: 3.0, on_hand: 9, unit_value: 0.25, unit_description: '(bottle)' )
    v = p.variants.first
    v.update_column(:sku, "VARIANTSKU")

    login_to_admin_section

    visit '/admin/products/bulk_edit'
    expect(page).to have_selector "a.view-variants", count: 1
    find("a.view-variants").trigger('click')

    find("div#columns-dropdown", :text => "COLUMNS").click
    find("div#columns-dropdown div.menu div.menu_item", text: "SKU").click
    find("div#columns-dropdown", :text => "COLUMNS").click

    expect(page).to have_field "variant_sku", with: "VARIANTSKU"
    expect(page).to have_field "variant_price", with: "3.0"
    expect(page).to have_field "variant_unit_value_with_description", with: "250 (bottle)"
    expect(page).to have_field "variant_on_hand", with: "9"
    expect(page).to have_selector "span[name='on_hand']", "9"

    select "Volume (L)", from: "variant_unit_with_scale"
    fill_in "variant_sku", with: "NEWSKU"
    fill_in "variant_price", with: "4.0"
    fill_in "variant_on_hand", with: "10"
    fill_in "variant_unit_value_with_description", with: "2 (8x250 mL bottles)"

    expect(page).to have_selector "span[name='on_hand']", text: "10"

    click_button 'Save Changes', match: :first
    expect(page.find("#status-message")).to have_content "Changes saved."

    v.reload
    expect(v.sku).to eq "NEWSKU"
    expect(v.price).to eq 4.0
    expect(v.on_hand).to eq 10
    expect(v.unit_value).to eq 2 # 2L in L
    expect(v.unit_description).to eq "(8x250 mL bottles)"
  end

  scenario "updating delegated attributes of variants in isolation" do
    p = FactoryBot.create(:product)
    v = FactoryBot.create(:variant, product: p, price: 3.0)

    login_to_admin_section

    visit '/admin/products/bulk_edit'
    expect(page).to have_selector "a.view-variants", count: 1
    find("a.view-variants").trigger('click')

    expect(page).to have_field "variant_price", with: "3.0"

    within "#v_#{v.id}" do
      fill_in "variant_price", with: "10.0"
    end

    within "#save-bar" do
      click_button 'Save Changes'
    end

    expect(page.find("#status-message")).to have_content "Changes saved."

    v.reload
    expect(v.price).to eq 10.0
  end

  scenario "updating a product mutiple times without refresh" do
    p = FactoryBot.create(:product, name: 'original name')
    login_to_admin_section

    visit '/admin/products/bulk_edit'

    expect(page).to have_field "product_name", with: "original name"

    fill_in "product_name", with: "new name 1"

    within "#save-bar" do
      click_button 'Save Changes'
    end

    expect(page.find("#status-message")).to have_content "Changes saved."
    p.reload
    expect(p.name).to eq "new name 1"

    fill_in "product_name", with: "new name 2"

    click_button 'Save Changes', match: :first
    expect(page.find("#status-message")).to have_content "Changes saved."
    p.reload
    expect(p.name).to eq "new name 2"

    fill_in "product_name", with: "original name"

    click_button 'Save Changes', match: :first
    expect(page.find("#status-message")).to have_content "Changes saved."
    p.reload
    expect(p.name).to eq "original name"
  end

  scenario "updating a product after cloning a product" do
    p = FactoryBot.create(:product, :name => "product 1")
    login_to_admin_section

    visit '/admin/products/bulk_edit'

    expect(page).to have_selector "a.clone-product", count: 1
    find("a.clone-product").click

    fill_in "product_name", :with => "new product name"

    within "#save-bar" do
      click_button 'Save Changes'
    end

    expect(page.find("#status-message")).to have_content "Changes saved."
    p.reload
    expect(p.name).to eq "new product name"
  end

  scenario "updating when a filter has been applied" do
    s1 = create(:supplier_enterprise)
    s2 = create(:supplier_enterprise)
    p1 = FactoryBot.create(:simple_product, :name => "product1", supplier: s1)
    p2 = FactoryBot.create(:simple_product, :name => "product2", supplier: s2)
    login_to_admin_section

    visit '/admin/products/bulk_edit'

    select2_select s1.name, from: "producer_filter"

    expect(page).to have_no_field "product_name", with: p2.name
    fill_in "product_name", :with => "new product1"

    within "#save-bar" do
      click_button 'Save Changes'
    end

    expect(page.find("#status-message")).to have_content "Changes saved."
    p1.reload
    expect(p1.name).to eq "new product1"
  end

  describe "using action buttons" do
    describe "using delete buttons" do
      let!(:p1) { FactoryBot.create(:product) }
      let!(:p2) { FactoryBot.create(:product) }
      let!(:v1) { p1.variants.first }
      let!(:v2) { p2.variants.first }
      let!(:v3) { FactoryBot.create(:variant, product: p2 ) }


      before do
        quick_login_as_admin
        visit '/admin/products/bulk_edit'
      end

      it "shows a delete button for products, which deletes the appropriate product when clicked" 


      it "shows a delete button for variants, which deletes the appropriate variant when clicked" 

    end

    describe "using edit buttons" do
      let!(:p1) { FactoryBot.create(:product) }
      let!(:p2) { FactoryBot.create(:product) }
      let!(:v1) { p1.variants.first }
      let!(:v2) { p2.variants.first }

      before do
        quick_login_as_admin
        visit '/admin/products/bulk_edit'
      end

      it "shows an edit button for products, which takes the user to the standard edit page for that product" 


      it "shows an edit button for variants, which takes the user to the standard edit page for that variant" 

    end

    describe "using clone buttons" do
      it "shows a clone button for products, which duplicates the product and adds it to the page when clicked" 

    end
  end

  describe "using the page" do
    describe "using column display dropdown" do
      it "shows a column display dropdown, which shows a list of columns when clicked" 

    end

    describe "using filtering controls" do
      it "displays basic filtering controls which filter the product list" 

    end
  end

  context "as an enterprise manager" do
    let(:supplier_managed1) { create(:supplier_enterprise, name: 'Supplier Managed 1') }
    let(:supplier_managed2) { create(:supplier_enterprise, name: 'Supplier Managed 2') }
    let(:supplier_unmanaged) { create(:supplier_enterprise, name: 'Supplier Unmanaged') }
    let(:supplier_permitted) { create(:supplier_enterprise, name: 'Supplier Permitted') }
    let(:distributor_managed) { create(:distributor_enterprise, name: 'Distributor Managed') }
    let(:distributor_unmanaged) { create(:distributor_enterprise, name: 'Distributor Unmanaged') }
    let!(:product_supplied) { create(:product, supplier: supplier_managed1, price: 10.0, on_hand: 6) }
    let!(:product_not_supplied) { create(:product, supplier: supplier_unmanaged) }
    let!(:product_supplied_permitted) { create(:product, name: 'Product Permitted', supplier: supplier_permitted, price: 10.0, on_hand: 6) }
    let(:product_supplied_inactive) { create(:product, supplier: supplier_managed1, price: 10.0, on_hand: 6, available_on: 1.week.from_now) }

    let!(:supplier_permitted_relationship) do
      create(:enterprise_relationship, parent: supplier_permitted, child: supplier_managed1,
             permissions_list: [:manage_products])
    end

    before do
      @enterprise_user = create_enterprise_user
      @enterprise_user.enterprise_roles.build(enterprise: supplier_managed1).save
      @enterprise_user.enterprise_roles.build(enterprise: supplier_managed2).save
      @enterprise_user.enterprise_roles.build(enterprise: distributor_managed).save

      login_to_admin_as @enterprise_user
    end

    it "shows only products that I supply" 


    it "shows only suppliers that I manage or have permission to" 


    it "shows inactive products that I supply" 


    it "allows me to create a product" 


    it "allows me to update a product" 

  end

  describe "Updating product image with new upload interface" do
    let!(:product) { create(:simple_product, name: "Carrots") }

    it "displays product images and image upload modal" 

  end
end

