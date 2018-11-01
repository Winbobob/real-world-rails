require  'spec_helper'

describe Admin::History::OrdersController do
  render_views

  before(:each) do
    activate_authlogic
    @user = create_admin_user
    login_as(@user)
  end

  it "show action should render show template" 


  it "index action should render index template" 

end

