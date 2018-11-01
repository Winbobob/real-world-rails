require  'spec_helper'

describe Shopping::AddressesController do
  render_views

  before(:each) do
    activate_authlogic
    @cur_user = FactoryGirl.create(:user)
    login_as(@cur_user)

    @variant  = FactoryGirl.create(:variant)
    create_cart(@cur_user, @cur_user, [@variant])
    @shipping_address = FactoryGirl.create(:address, :addressable_id => @cur_user.id, :addressable_type => 'User')
  end

  it "index action should render index template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


  it "update action should redirect when model is valid" 


end

