require File.dirname(__FILE__) + '/../spec_helper'
include ApplicationHelper
include UsersHelper
include AuthenticatedTestHelper

describe UsersHelper do
  before do
    @user = mock_user
  end
  
  describe "if_authorized" do 
    it "yields if authorized" 

    it "does nothing if not authorized" 

  end
  
  describe "link_to_user" do
    it "should return an error string on a nil user" 

    it "should link to the given user" 

    it "should use given link text if :content_text is specified" 

    it "should use the login as link text with no :content_method specified" 

    it "should use the name as link text with :content_method => :name" 

    it "should use the login as title with no :title_method specified" 

    it "should use the name as link title with :content_method => :name" 

    it "should have nickname as a class by default" 

    it "should take other classes and no longer have the nickname class" 

  end

end

