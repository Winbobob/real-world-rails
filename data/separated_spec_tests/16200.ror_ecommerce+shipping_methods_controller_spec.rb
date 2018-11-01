require  'spec_helper'

describe Admin::Shopping::Checkout::ShippingMethodsController do
  render_views

  before(:each) do
    activate_authlogic

    @admin_user = create_admin_user
    login_as(@user)
    controller.stubs(:verify_admin).returns(@admin_user)
    controller.stubs(:current_user).returns(@admin_user)

    @user      = FactoryGirl.create(:user)
    @cart      = FactoryGirl.create(:cart, :user=> @admin_user, :customer => @user)
    @cart_item = FactoryGirl.create(:cart_item, :cart => @cart)
    @cart.stubs(:cart_items).returns([@cart_item])

    #controller.session[:admin_cart_id] = @cart.id
    @shipping_address = FactoryGirl.create(:address, :addressable_id => @user.id, :addressable_type => 'User')

    #controller.session[:order_admin_id] = @order.id

    controller.stubs(:session_admin_cart).returns(@cart)

  end

  it "index action should render index template" 

  it "index action should render index template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 

end

