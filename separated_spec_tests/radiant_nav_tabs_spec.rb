require 'spec_helper'
require 'radiant/admin_ui'

describe Radiant::AdminUI::NavTab do
  before :each do
    @tab = Radiant::AdminUI::NavTab.new("Content")
  end

  it "should have a name" 


  it "should be Enumerable" 


  it "should find contained items by name" 


  it "should assign the tab on the sub-item when adding" 


  describe "inserting sub-items in specific places" do
    before :each do
      @pages    = Radiant::AdminUI::NavSubItem.new("Pages",    "/admin/pages")
      @things   = Radiant::AdminUI::NavSubItem.new("Things",   "/admin/things")
      @comments = Radiant::AdminUI::NavSubItem.new("Comments", "/admin/comments")
      @tab << @pages
      @tab << @things
    end

    it "should insert at the end by default" 


    it "should insert before the specified sub-item" 


    it "should insert after the specified sub-item" 


    it "should raise an error if a sub-item of the same name already exists" 

  end

  describe "visibility" do
    #dataset :users

    it "should not be visible by default" 

  end

  it "should warn about using the deprecated add method" 

end

describe Radiant::AdminUI::NavSubItem do
  before :each do
    @tab = Radiant::AdminUI::NavTab.new("Content")
    @subitem = Radiant::AdminUI::NavSubItem.new("Pages", "/admin/pages")
    @tab << @subitem
  end

  it "should have a name" 


  it "should have a URL" 


  describe "generating a relative url" do
    it "should return the original url when no relative_url_root is set" 


    it "should make the url relative to the relative_url_root when set" 


    after :each do
      ActionController::Base.relative_url_root = nil
    end
  end

  it "should have a tab accessor" 


  describe "visibility" do
    let(:admin){ FactoryGirl.build(:user, admin: true) }
    let(:existing){ FactoryGirl.build(:user) }

    before :each do
      @controller = Radiant::Admin::UsersController.new
      allow(Radiant::Admin::UsersController).to receive(:new).and_return(@controller)
    end

    it "should check the visibility against the controller permissions" 


    describe "when the controller limits access to the action" do
      before :each do
        @subitem.url.sub!('pages', 'users')
      end

      it "should not be visible if the user lacks access" 


      it "should be visible if the user has access" 

    end
  end
end

