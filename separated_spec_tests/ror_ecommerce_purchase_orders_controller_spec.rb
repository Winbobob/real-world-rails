require  'spec_helper'

describe Admin::Inventory::PurchaseOrdersController do
  render_views

  let(:variant) { FactoryGirl.create(:variant) }

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
  end


  it "index action should render index template" 


  #it "show action should render show template" do
  #  @purchase_order = FactoryGirl.create(:purchase_order)
  #  get :show, :id => @purchase_order.id
  #  expect(response).to render_template(:show)
  #end

  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


  it "destroy action should destroy model and redirect to index action" 

end

