require 'spec_helper'
require 'open_food_network/permissions'

feature "Product Import", js: true do
  include AuthenticationWorkflow
  include WebHelper

  let!(:admin) { create(:admin_user) }
  let!(:user) { create_enterprise_user }
  let!(:enterprise) { create(:supplier_enterprise, owner: user, name: "User Enterprise") }
  let!(:enterprise2) { create(:supplier_enterprise, owner: admin, name: "Another Enterprise") }
  let!(:category) { create(:taxon, name: 'Vegetables') }
  let!(:category2) { create(:taxon, name: 'Cake') }
  let!(:tax_category) { create(:tax_category) }
  let!(:tax_category2) { create(:tax_category) }
  let!(:shipping_category) { create(:shipping_category) }
  let!(:product) { create(:simple_product, supplier: enterprise2, name: 'Hypothetical Cake') }
  let!(:variant) { create(:variant, product_id: product.id, price: '8.50', on_hand: '100', unit_value: '500', display_name: 'Preexisting Banana') }
  let!(:product2) { create(:simple_product, supplier: enterprise, on_hand: '100', name: 'Beans', unit_value: '500') }
  let!(:product3) { create(:simple_product, supplier: enterprise, on_hand: '100', name: 'Sprouts') }
  let!(:product4) { create(:simple_product, supplier: enterprise, on_hand: '100', name: 'Cabbage') }
  let!(:product5) { create(:simple_product, supplier: enterprise2, on_hand: '100', name: 'Lettuce') }


  describe "when importing products from uploaded file" do
    before { quick_login_as_admin }
    after { File.delete('/tmp/test.csv') }

    it "validates entries and saves them if they are all valid" 


    it "displays info about invalid entries but still allows saving of valid entries" 


    it "displays info about invalid entries but no save button if all items are invalid" 


    it "can add new variants to existing products and update price and stock level of existing products" 


    it "can add a new product and sub-variants of that product at the same time" 

  end

  describe "when dealing with uploaded files" do
    before { quick_login_as_admin }

    it "checks filetype on upload" 


    it "returns and error if nothing was uploaded" 


    it "handles cases where no meaningful data can be read from the file" 

  end

  describe "handling enterprise permissions" do
    before { quick_login_as user }

    it "only allows import into enterprises the user is permitted to manage" 

  end

  describe "applying settings and defaults on import" do
    before { quick_login_as_admin }

    it "can set all products for an enterprise that are not present in the uploaded file to zero stock" 


    it "overwrites fields with selected defaults" 

  end
end

