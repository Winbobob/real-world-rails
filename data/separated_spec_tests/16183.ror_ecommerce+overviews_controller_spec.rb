require  'spec_helper'

describe Myaccount::OverviewsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  it "show action should render show template" 


  it "show action should render show template" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 

end

describe Myaccount::OverviewsController do
  render_views

  it "not logged in should redirect to login page" 

end

