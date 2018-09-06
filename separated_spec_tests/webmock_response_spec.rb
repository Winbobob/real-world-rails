require 'spec_helper'

describe WebMock::ResponseFactory do

  describe "response_for" do

    it "should create response with options passed as arguments" 



    it "should create dynamic response for argument responding to call" 


  end

end

describe WebMock::Response do
  before(:each) do
    @response = WebMock::Response.new(headers: {'A' => 'a'})
  end

  it "should raise an error when initialized with unknown option" 


  it "should report normalized headers" 


  describe "status" do
    it "should have 200 code and empty message by default" 


    it "should return assigned status" 


    it "should return assigned message" 

  end

  describe "raising error" do

    it "should raise error if any assigned" 


    it "should raise error if any assigned as instance" 


    it "should raise error if any assigned as string" 


    it "should not raise error if no error assigned" 


  end

  describe "timeout" do

    it "should know if it should timeout" 


    it "should not timeout by default" 


  end

  describe "body" do

    it "should return empty body by default" 


    it "should report body if assigned" 


    it "should report string even if existing file path was provided" 


    it "should report content of a IO object if provided" 


    it "should report many times content of a IO object if provided" 


    it "should work with Pathnames" 


    # Users of webmock commonly make the mistake of stubbing the response
    # body to return a hash, to prevent this:
    #
    it "should error if not given one of the allowed types" 


  end

  describe "from raw response" do

    describe "when input is IO" do
      before(:each) do
        @file = File.new(CURL_EXAMPLE_OUTPUT_PATH)
        @response = WebMock::Response.new(@file)
      end


      it "should read status" 


      it "should read headers" 


      it "should read body" 


      it "should close IO" 


    end

    describe "when input is String" do
      before(:each) do
        @input = File.read(CURL_EXAMPLE_OUTPUT_PATH)
        @response = WebMock::Response.new(@input)
      end

      it "should read status" 


      it "should read headers" 


      it "should read body" 


      it "should work with transfer-encoding set to chunked" 


    end

    describe "with dynamically evaluated options" do

      before(:each) do
        @request_signature = WebMock::RequestSignature.new(:post, "www.example.com", body: "abc", headers: {'A' => 'a'})
      end

      it "should have evaluated body" 


      it "should have evaluated headers" 


      it "should have evaluated status" 


    end

  end

  describe WebMock::DynamicResponse do

    describe "evaluating response options" do

      it "should evaluate new response with evaluated options" 


      it "should be equal to static response after evaluation" 


      describe "when raw response is evaluated" do
        before(:each) do
          @files = {
            "www.example.com" => File.new(CURL_EXAMPLE_OUTPUT_PATH)
          }
          @request_signature = WebMock::RequestSignature.new(:get, "www.example.com")
        end

        describe "as a file" do
          it "should return response" 

        end

        describe "as a string" do
          it "should return response" 

        end
      end
    end

  end

end

