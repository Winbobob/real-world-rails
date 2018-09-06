require File.dirname(__FILE__) + "/../../spec_helper"

describe Radiant::Admin::LayoutsController do
  routes { Radiant::Engine.routes }
  #dataset :users, :pages_with_layouts
  include AuthenticationHelper
  
  let(:layout){ FactoryGirl.create(:layout) }
  let(:utf8_layout){ FactoryGirl.create(:utf8_layout) }
  let(:admin){ FactoryGirl.create(:admin) }
  let(:non_admin){ FactoryGirl.create(:user) }
  let(:designer){ FactoryGirl.create(:designer) }
  
  before :each do
    login_as designer
  end

  it "should be a ResourceController" 


  it "should handle Layouts" 



  describe "show" do
    it "should redirect to the edit action" 


    it "should show xml when format is xml" 

  end

  describe "with invalid page id" do
    [:edit, :remove].each do |action|
      before do
        @parameters = {id: 999}
      end
      it "should redirect the #{action} action to the index action" 

      it "should say that the 'Layout could not be found.' after the #{action} action" 

    end
    it 'should redirect the update action to the index action' 

    it "should say that the 'Layout could not be found.' after the update action" 

    it 'should redirect the destroy action to the index action' 

    it "should say that the 'Layout could not be found.' after the destroy action" 

  end

  { get: [:index, :new, :edit, :remove],
    post: [:create],
    put: [:update],
    delete: [:destroy] }.each do |method, actions|
    actions.each do |action|
      it "should require login to access the #{action} action" 


      it "should allow access to designers for the #{action} action" 


      it "should allow access to admins for the #{action} action" 


      it "should deny non-designers and non-admins for the #{action} action" 

    end
  end

  it "should clear the page cache when saved" 


end

