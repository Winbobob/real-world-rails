require 'spec_helper'

describe WebMock::RequestRegistry do

  before(:each) do
    WebMock::RequestRegistry.instance.reset!
    @request_pattern = WebMock::RequestPattern.new(:get, "www.example.com")
    @request_signature = WebMock::RequestSignature.new(:get, "www.example.com")
  end

  describe "reset!" do
    before(:each) do
      WebMock::RequestRegistry.instance.requested_signatures.put(@request_signature)
    end

    it "should clean list of executed requests" 


  end

  describe "times executed" do

    before(:each) do
      @request_stub1 = WebMock::RequestStub.new(:get, "www.example.com")
      @request_stub2 = WebMock::RequestStub.new(:get, "www.example.net")
      @request_stub3 = WebMock::RequestStub.new(:get, "www.example.org")
      WebMock::RequestRegistry.instance.requested_signatures.put(WebMock::RequestSignature.new(:get, "www.example.com"))
      WebMock::RequestRegistry.instance.requested_signatures.put(WebMock::RequestSignature.new(:get, "www.example.com"))
      WebMock::RequestRegistry.instance.requested_signatures.put(WebMock::RequestSignature.new(:get, "www.example.org"))
    end

    it "should report 0 if no request matching pattern was requested" 


    it "should report number of times matching pattern was requested" 


    it "should report number of times all matching pattern were requested" 


    describe "multithreading" do
      let(:request_pattern) { WebMock::RequestPattern.new(:get, "www.example.com") }

      # Reproduce a multithreading issue that causes a RuntimeError:
      #   can't add a new key into hash during iteration.
      it "works normally iterating on the requested signature hash while another thread is setting it" 

    end
  end

  describe "request_signatures" do
    it "should return hash of unique request signatures with accumulated number" 

  end

  describe "to_s" do
    it "should output string with all executed requests and numbers of executions" 


    it "should output info if no requests were executed" 

  end

end

