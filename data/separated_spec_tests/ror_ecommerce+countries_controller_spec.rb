require  'spec_helper'

describe Admin::Config::CountriesController, type: :controller do
  # fixtures :all
  render_views

  before(:each) do
    activate_authlogic
    @user = create_super_admin_user
    login_as(@user)
  end

  it "index action should render index template" 


  it "update action should redirect and update shipping zone" 


  it "activate action should redirect and make the country active" 


  it "destroy action should make the country inactive and redirect to index action" 

end

