require 'spec_helper'

describe WebMock::StubRegistry do

  before(:each) do
    WebMock::StubRegistry.instance.reset!
    @request_pattern = WebMock::RequestPattern.new(:get, "www.example.com")
    @request_signature = WebMock::RequestSignature.new(:get, "www.example.com")
    @request_stub = WebMock::RequestStub.new(:get, "www.example.com")
  end

  describe "remove_request_stub" do
    it "should remove stub from registry" 

  end

  describe "reset!" do
    before(:each) do
      WebMock::StubRegistry.instance.register_request_stub(@request_stub)
    end

    it "should clean request stubs" 

  end

  describe "registering and reporting registered requests" do

    it "should return registered stub" 


    it "should report if request stub is not registered" 


    it "should register and report registered stub" 



  end

  describe "response for request" do

    it "should report registered evaluated response for request pattern" 


    it "should report evaluated response" 


    it "should report clone of the response" 


    it "should report clone of the dynamic response" 


    it "should report nothing if no response for request is registered" 


    it "should always return last registered matching response" 


  end

end

