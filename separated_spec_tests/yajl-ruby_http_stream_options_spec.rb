require File.expand_path(File.dirname(__FILE__) + '/../spec_helper.rb')
require 'yajl/http_stream'
require 'socket'

describe "Passing options to HttpStream instance methods" do
  before(:all) do
    @stream = Yajl::HttpStream.new
  end

  it "should not create a new socket it one is provided" 


  it "should create a new socket if one is not provided" 

end

