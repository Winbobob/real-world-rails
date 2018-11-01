require  'spec_helper'

describe Shopping::ShippingMethodsController do
  render_views

  before(:each) do
    activate_authlogic

    @cur_user = FactoryGirl.create(:user)
    login_as(@cur_user)

    #stylist_cart
    @variant  = FactoryGirl.create(:variant)

    create_cart(@cur_user, @cur_user, [@variant])

    @address      = FactoryGirl.create(:address)
    @order        = FactoryGirl.create(:order, :ship_address_id => @address.id)
    @order_item   = FactoryGirl.create(:order_item, :order => @order, :variant => @variant)
    @order.stubs(:order_items).returns([@order_item])
    @controller.stubs(:find_or_create_order).returns(@order)
  end

  it "index action should render index template" 

end
describe Shopping::ShippingMethodsController do
  render_views

  before(:each) do
    activate_authlogic

    @cur_user = FactoryGirl.create(:user)
    login_as(@cur_user)

    #stylist_cart
    @variant  = FactoryGirl.create(:variant)

    create_cart(@cur_user, @cur_user, [@variant])

  end
  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 

end

