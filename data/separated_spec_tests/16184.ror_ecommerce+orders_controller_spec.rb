require  'spec_helper'

describe Myaccount::OrdersController do
  render_views

  before(:each) do
    activate_authlogic

    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  it "index action should render index template" 


  it "show action should render show template" 


end

describe Myaccount::OrdersController do
  render_views

  it "index action should go to login page" 


  it "show action should go to login page" 

end

