require  'spec_helper'

describe Admin::UsersController do
  # fixtures :all
  render_views
  before(:each) do
    activate_authlogic
    @customer = FactoryGirl.build(:user)
    @user = create_admin_user
    login_as(@user)
    @controller.stubs(:authorize!)
  end

  it "index action should render index template" 


  it "show action should render show template" 


  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


end
