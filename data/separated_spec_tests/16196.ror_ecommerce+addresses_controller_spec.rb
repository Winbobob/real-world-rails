require  'spec_helper'

describe Admin::UserDatas::AddressesController do
  # fixtures :all
  render_views
  before(:each) do
    activate_authlogic
    @cur_user = FactoryGirl.create(:admin_user)
    login_as(@cur_user)
    @customer = FactoryGirl.create(:user)
  end

  it "index action should render index template" 


  it "show action should render show template" 


  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


  it "destroy action should destroy model and redirect to index action" 

end

