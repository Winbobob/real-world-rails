require  'spec_helper'

describe Admin::Shopping::UsersController do
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


end

