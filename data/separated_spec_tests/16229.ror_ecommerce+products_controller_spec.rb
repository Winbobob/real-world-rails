require  'spec_helper'

describe Admin::Merchandise::ProductsController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)

    controller.stubs(:current_ability).returns(Ability.new(@user))
  end

  it "index action should render index template" 


  it "show action should render show template" 


  it "new action should render new template" 


  it "new action should render new template" 


  it "create action should render new template when model is invalid" 


  it "create action should redirect when model is valid" 


  it "edit action should render edit template" 


  it "update action should render edit template when model is invalid" 


  it "update action should redirect when model is valid" 


  it "activate action should redirect when model is valid" 

  it "activate action should redirect to create description when model is valid" 


  it "destroy action should destroy model and redirect to index action" 

  def product_attributes
    {:name => 'cute pants', :set_keywords => 'test,one,two,three', :product_type_id => 1, :prototype_id => nil, :shipping_category_id => 1, :permalink => 'linkToMe', :available_at => Time.zone.now, :deleted_at => nil, :meta_keywords => 'cute,pants,bacon', :meta_description => 'good pants', :featured => true, :brand_id => 1}
  end
end

