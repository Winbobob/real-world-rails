require  'spec_helper'

describe Myaccount::StoreCreditsController do
  render_views


  before(:each) do
    activate_authlogic

    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  it "show action should render show template" 

end

