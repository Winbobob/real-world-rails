require  'spec_helper'

describe Admin::Shopping::Checkout::BillingAddressesController do
  render_views

  before(:each) do
    activate_authlogic

    @admin_user = create_admin_user
    login_as(@user)
    #Admin::BaseController.stubs(:verify_admin).returns(@admin_user)
    controller.stubs(:verify_admin).returns(@admin_user)
    controller.stubs(:current_user).returns(@admin_user)

    @user      = FactoryGirl.create(:user)
    @cart      = FactoryGirl.create(:cart, :user=> @admin_user, :customer => @user)
    @cart_item = FactoryGirl.create(:cart_item, :cart => @cart)
    @cart.stubs(:cart_items).returns([@cart_item])
    #@cart.stubs(:customer).returns(@user)

    #controller.session[:admin_cart_id] = @cart.id
    @order = FactoryGirl.create(:order, :user => @user)
    #controller.session[:order_admin_id] = @order.id

    controller.stubs(:session_admin_cart).returns(@cart)
    controller.stubs(:session_admin_order).returns(@order)
    #controller.stubs(:checkout_user).returns(@user)
  end

  it "index action should render index template" 


  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "create action should redirect when model is valid" 


end

