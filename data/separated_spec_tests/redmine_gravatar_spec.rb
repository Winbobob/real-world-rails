require 'rubygems'
require 'erb'  # to get "h"
require 'active_support'  # to get "returning"
require File.dirname(__FILE__) + '/../lib/gravatar'
include GravatarHelper, GravatarHelper::PublicMethods, ERB::Util

describe "gravatar_url with a custom default URL" do
  before(:each) do
    @original_options = DEFAULT_OPTIONS.dup
    DEFAULT_OPTIONS[:default] = "no_avatar.png"
    @url = gravatar_url("somewhere")
  end
  
  it "should include the \"default\" argument in the result" 

  
  after(:each) do
    DEFAULT_OPTIONS.merge!(@original_options)
  end
  
end

describe "gravatar_url with default settings" do
  before(:each) do
    @url = gravatar_url("somewhere")
  end
  
  it "should have a nil default URL" 

  
  it "should not include the \"default\" argument in the result" 

  
end

describe "gravatar with a custom title option" do
  it "should include the title in the result" 

end

