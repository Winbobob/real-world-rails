require "spec_helper"

describe Radiant::Admin::ExtensionsController do
  routes { Radiant::Engine.routes }
  
  test_helper :user
  include AuthenticationHelper
  
  before :each do
    login_as :admin
  end

  it "should require login for all actions" 


  describe "GET to /admin/extensions" do
    before :each do
      get :index
    end

    it "should be successful" 


    it "should render the index template" 


    it "should list all extensions" 


    it "should pre-set the template name" 

  end
end

