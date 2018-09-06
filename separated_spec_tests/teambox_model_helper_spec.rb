require File.dirname(__FILE__) + '/../spec_helper'
include ApplicationHelper
include <%= model_controller_class_name %>Helper

describe "<%= model_controller_class_name %>Helper.link_to_<%= file_name %>" do
  before do
    @<%= file_name %> = <%= class_name %>.new({
        :name  => '<%= class_name %> Name',
        :login => '<%= file_name %>_name',
      })
    @<%= file_name %>.id = 1 # set non-attr_accessible specifically
  end

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

describe "<%= model_controller_class_name %>Helper.link_to_signin_with_IP" do
  before do
  end

  it "should link to the signin_path" 


  it "should use given link text if :content_text is specified" 


  it "should use the login as link text with no :content_method specified" 


  it "should use the ip address as title" 


  it "should by default be like school in summer and have no class" 

  
  it "should have some class if you tell it to" 

end

describe "<%= model_controller_class_name %>Helper.link_to_current_<%= file_name %>, When logged in" do
  fixtures :<%= table_name %>
  include AuthenticatedTestHelper
  before do
    login_as(:quentin)
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



describe "<%= model_controller_class_name %>Helper.link_to_current_user, When logged out" do
  include AuthenticatedTestHelper
  before do
  end

  it "should link to the signin_path" 


  it "should use given link text if :content_text is specified" 


  it "should use the IP address as link text with no :content_method specified" 


  it "should use the ip address as title" 


  it "should by default be like school in summer and have no class" 


  it "should have some class if you tell it to" 

end

