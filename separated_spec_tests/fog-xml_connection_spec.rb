require "minitest_helper"

describe Fog::XML::Connection do
  before do
    @connection = Fog::XML::Connection.new("http://localhost")
  end

  after do
    Excon.stubs.clear
  end

  it "responds to #request" 


  describe "when request is passed a parser" do
    it "returns the body after parsing" 

  end

  describe "when request excludes a parser" do
    it "returns the response body without change" 

  end
end

