require File.dirname(__FILE__) + '/../spec_helper'

describe NotificationsController do
  render_views

  let(:user)    { FactoryGirl.create(:user) }
  let(:variant) { FactoryGirl.create(:variant) }

  before(:each) do
    activate_authlogic
    login_as(user)
  end

  it "create action should redirect to product when model is already created" 


  it "create action should create an InStockNotification" 


  it "create action should redirect to product when model is already sent previously" 


  it "create action should redirect to product when model is already sent previously" 

end

