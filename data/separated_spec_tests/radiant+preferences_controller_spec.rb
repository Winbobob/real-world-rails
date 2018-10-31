require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Radiant::Admin::PreferencesController do
  routes { Radiant::Engine.routes }
  #dataset :users

  it "should allow you to view your preferences" 


  it "should allow you to save your preferences" 


  it "should not allow you to update your role through the preferences page" 


  it "should allow you to change your password" 


  it "should use the User.unprotected_attributes for checking valid_params?" 


  describe "@body_classes" do
    before do
      login_as(:non_admin)
    end
    it "should return 'reversed' when the action_name is 'edit'" 

    it "should return 'reversed' when the action_name is 'show'" 

  end
end

