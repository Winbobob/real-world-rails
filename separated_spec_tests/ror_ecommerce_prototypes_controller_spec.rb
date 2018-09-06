require  'spec_helper'

describe Admin::Merchandise::PrototypesController do
  render_views

  before(:each) do
    activate_authlogic
    @property  = FactoryGirl.create(:property)
    @user = create_admin_user
    login_as(@user)
  end

  it "index action should render index template" 


  it "new action should render new template" 


  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 

# ( :name, :active, :property_ids )
  it "update action should redirect when model is valid" 


  it "destroy action should destroy model and redirect to index action" 

end

