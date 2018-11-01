require  'spec_helper'

describe Admin::Fulfillment::Partial::ShipmentsController, type: :controller do
  # fixtures :all
  render_views

  before(:each) do
    @order = FactoryGirl.create(:order)
    @order_item = FactoryGirl.create(:order_item, :order => @order)
    activate_authlogic
    @user = FactoryGirl.create(:admin_user)
    login_as(@user)
  end

  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "update action should render new template when model is invalid" 


  it "update action should redirect when model is valid" 

end

