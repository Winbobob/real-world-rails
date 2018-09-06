require  'spec_helper'

describe Admin::History::AddressesController do
  render_views

  before(:each) do
    activate_authlogic
    @user = create_admin_user
    login_as(@user)
    @order = FactoryGirl.create(:order)
  end

  it "index action should render index template" 


  it "show action should render show template" 


  it "new action should render new template" 


#  params.require(:admin_history_address).permit(:address_type_id, :first_name, :last_name, :address1, :address2, :city, :state_id, :state_name, :zip_code, :phone_id, :alternative_phone, :default, :billing_default, :active, :country_id)

  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


end

