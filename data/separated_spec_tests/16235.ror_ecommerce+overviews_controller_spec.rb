require  'spec_helper'

describe Admin::Inventory::OverviewsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
    @product = FactoryGirl.create(:product)
  end

  it "index action should render index template" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 

end

