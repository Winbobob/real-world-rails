require File.dirname(__FILE__) + '<%= ('/..'*model_controller_class_nesting_depth) + '/../spec_helper' %>'
include ApplicationHelper
include <%= model_controller_class_name %>Helper
include AuthenticatedTestHelper

describe <%= model_controller_class_name %>Helper do
  before do
    @<%= file_name %> = mock_<%= file_name %>
  end
  
  describe "if_authorized" do 
    it "yields if authorized" 

    it "does nothing if not authorized" 

  end
  
  describe "link_to_<%= file_name %>" do
    it "should give an error on a nil <%= file_name %>" 

    it "should link to the given <%= file_name %>" 

    it "should use given link text if :content_text is specified" 

    it "should use the login as link text with no :content_method specified" 

    it "should use the name as link text with :content_method => :name" 

    it "should use the login as title with no :title_method specified" 

    it "should use the name as link title with :content_method => :name" 

    it "should have nickname as a class by default" 

    it "should take other classes and no longer have the nickname class" 

  end

  describe "link_to_login_with_IP" do
    it "should link to the login_path" 

    it "should use given link text if :content_text is specified" 

    it "should use the login as link text with no :content_method specified" 

    it "should use the ip address as title" 

    it "should by default be like school in summer and have no class" 

    it "should have some class if you tell it to" 

    it "should have some class if you tell it to" 

  end

  describe "link_to_current_<%= file_name %>, When logged in" do
    before do
      stub!(:current_<%= file_name %>).and_return(@<%= file_name %>)
    end
    it "should link to the given <%= file_name %>" 

    it "should use given link text if :content_text is specified" 

    it "should use the login as link text with no :content_method specified" 

    it "should use the name as link text with :content_method => :name" 

    it "should use the login as title with no :title_method specified" 

    it "should use the name as link title with :content_method => :name" 

    it "should have nickname as a class" 

    it "should take other classes and no longer have the nickname class" 

  end

  describe "link_to_current_<%= file_name %>, When logged out" do
    before do
      stub!(:current_<%= file_name %>).and_return(nil)
    end
    it "should link to the login_path" 

    it "should use given link text if :content_text is specified" 

    it "should use 'not signed in' as link text with no :content_method specified" 

    it "should use the ip address as title" 

    it "should by default be like school in summer and have no class" 

    it "should have some class if you tell it to" 

  end

end

