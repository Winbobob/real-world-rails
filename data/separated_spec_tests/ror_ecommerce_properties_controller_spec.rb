require  'spec_helper'

describe Admin::Merchandise::Changes::PropertiesController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
    controller.session[:product_wizard] = {}
  end

  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


  def product_properties_attributes
    {"product_properties_attributes"=>{
                            "new_product_properties"=>{"_destroy"=>"false", "property_id"=>"1", "description"=>"", "position"=>""}}}
  end
end

