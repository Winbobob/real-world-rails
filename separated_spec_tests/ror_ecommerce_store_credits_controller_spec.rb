require  'spec_helper'

describe Admin::UserDatas::StoreCreditsController do
  # fixtures :all
  render_views
  before(:each) do
    activate_authlogic
    @cur_user = FactoryGirl.create(:admin_user)
    login_as(@cur_user)
    @user = FactoryGirl.create(:user)
  end

  it "show action should render show template" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 

  it "update action should redirect when model is valid" 

end

