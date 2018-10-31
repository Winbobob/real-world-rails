require  'spec_helper'

describe Admin::Merchandise::Multi::VariantsController do
  render_views
  before(:each) do
    activate_authlogic
    @user = create_admin_user
    login_as(@user)
  end

  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


  def product_attributes
    {"variants_attributes" => {
      "new_variants" => {"sku"=>"0000-0000-000001", "price"=>"30.0", "cost"=>"10.0", "name"=>"", "inactivate"=>"0",
             "variant_properties_attributes" => {"0" => {"primary"=>"1", "property_id"=>"1", "description"=>"Red", "id"=>""},
                                               "1" => {"primary"=>"0", "property_id"=>"2", "description"=>"Small", "id"=>""},
                                               "2" => {"primary"=>"0", "property_id"=>"3", "description"=>""}} }
                            }}
  end

end

