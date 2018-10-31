require File.dirname(__FILE__) + "/../../spec_helper"

describe Radiant::Admin::UsersController do
  routes { Radiant::Engine.routes }
  #dataset :users

  it "should be a ResourceController" 


  it "should handle Users" 



  describe "show" do
    it "should redirect to the edit action" 

  end

  describe "with invalid page id" do
    before do
      login_as :admin
    end
    [:edit, :remove].each do |action|
      before do
        @parameters = {id: 999}
      end
      it "should redirect the #{action} action to the index action" 

      it "should say that the 'User could not be found.' after the #{action} action" 

    end
    it 'should redirect the update action to the index action' 

    it "should say that the 'User could not be found.' after the update action" 

    it 'should redirect the destroy action to the index action' 

    it "should say that the 'User could not be found.' after the destroy action" 

  end

  { get: [:index, :new, :edit, :remove],
    post: [:create],
    put: [:update],
    delete: [:destroy] }.each do |method, actions|
    actions.each do |action|
      it "should require login to access the #{action} action" 


      it "should allow you to access to #{action} action if you are an admin" 


      it "should deny you access to #{action} action if you are not an admin" 

    end
  end

  it "should not allow you to delete yourself" 


  it "should not allow you to remove your own admin privilege" 

end

