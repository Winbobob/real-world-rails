require  'spec_helper'

describe Admin::Config::ShippingMethodsController, type: :controller do
  render_views

  before(:each) do
    activate_authlogic
    @user = create_super_admin_user
    login_as(@user)
  end

  it "index action should render index template" 


  #it "show action should render show template" do
  #  @shipping_method = FactoryGirl.create(:shipping_method)
  #  get :show, :id => @shipping_method.id
  #  expect(response).to render_template(:show)
  #end

  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


end

