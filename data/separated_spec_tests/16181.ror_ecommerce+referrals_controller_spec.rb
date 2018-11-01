require  'spec_helper'

describe Myaccount::ReferralsController do
  # fixtures :all
  render_views
  before(:each) do
    activate_authlogic

    @user = FactoryGirl.create(:user)
    login_as(@user)
  end
  it "index action should render index template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 

end

