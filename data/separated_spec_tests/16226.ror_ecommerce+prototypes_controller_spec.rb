require  'spec_helper'

describe Admin::Merchandise::Wizards::PrototypesController do
  render_views

  before(:each) do
    activate_authlogic

    @user = create_admin_user
    login_as(@user)
    controller.session[:product_wizard] = {}
  end

  it "update action should redirect when model is valid" 

end

