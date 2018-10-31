require  'spec_helper'

describe Admin::Inventory::ReceivingsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
    @purchase_order = FactoryGirl.create(:purchase_order)
  end

  #it "show action should render show template" do
  #  get :show, :id => @purchase_order.id
  #  expect(response).to render_template(:show)
  #end

  it "index action should render index template" 


  it "edit action should render edit template" 


  it "update action should redirect when model is valid" 

end

