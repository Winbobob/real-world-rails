require  'spec_helper'

describe Admin::Merchandise::VariantsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
    @product = FactoryGirl.create(:product)
  end

  it "index action should render index template" 


  it "show action should render show template" 


  it "new action should render new template" 

#require(:variant).permit(:product_id, :sku, :name, :price, :cost, :deleted_at, :master, :brand_id, :inventory_id )
  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


  it "destroy action should destroy model and redirect to index action" 

end

