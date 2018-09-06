require  'spec_helper'

describe Admin::Inventory::AdjustmentsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
    @product = FactoryGirl.create(:product)
  end

  it "show action should render show template" 


  it "index action should render index template" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should render edit when no refund is passed" 


  it "update action should redirect when model is valid" 


  it "update action should redirect when model is valid" 

end

