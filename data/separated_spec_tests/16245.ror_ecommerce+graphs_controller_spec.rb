require  'spec_helper'

describe Admin::Reports::GraphsController do
  # fixtures :all
  render_views
  before(:each) do
    activate_authlogic
    @user = create_admin_user
    login_as(@user)
  end

  it "index action should render index template" 


  it "show action should render show template" 

end

