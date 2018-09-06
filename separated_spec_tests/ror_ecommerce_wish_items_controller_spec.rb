require  'spec_helper'

describe WishItemsController do
  render_views

  it "redirect to login if no current_user" 

end

describe WishItemsController do
  render_views
  before(:each) do
    activate_authlogic
    @cur_user   = FactoryGirl.create(:user)
    login_as(@cur_user)
    @variant    = FactoryGirl.create(:variant)
    @wish_item  = FactoryGirl.create(:cart_item, item_type_id: ItemType::WISH_LIST_ID, user_id: @cur_user.id, variant: @variant)
  end

  it "index action should render index template" 


  it "destroy action should render index template" 

end

