require  'spec_helper'

describe Admin::Merchandise::Wizards::ShippingCategoriesController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
    controller.session[:product_wizard] = {}
    controller.session[:product_wizard][:brand_id] = 7# @brand.id
    controller.session[:product_wizard][:product_type_id] = 7# @brand.id
    controller.session[:product_wizard][:property_ids]    = [1,2]
  end

  it "index action should render index template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 

end

