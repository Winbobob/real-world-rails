require 'spec_helper'

feature "As a consumer I want to check out my cart", js: true do
  include AuthenticationWorkflow
  include WebHelper
  include ShopWorkflow
  include CheckoutWorkflow
  include UIComponentHelper

  let(:distributor) { create(:distributor_enterprise, with_payment_and_shipping: true) }
  let(:supplier) { create(:supplier_enterprise) }
  let!(:order_cycle) { create(:simple_order_cycle, distributors: [distributor], coordinator: create(:distributor_enterprise), variants: [product.variants.first]) }
  let(:product) { create(:simple_product, supplier: supplier) }
  let(:order) { create(:order, order_cycle: order_cycle, distributor: distributor) }
  let(:address) { create(:address, firstname: "Foo", lastname: "Bar") }
  let(:user) { create(:user, bill_address: address, ship_address: address) }
  after { Warden.test_reset! }

  before do
    set_order order
    add_product_to_cart order, product
  end

  it "does not not render the login form when logged in" 


  it "renders the login buttons when logged out" 


  it "populates user details once logged in" 


  it "allows user to checkout as guest" 

end

