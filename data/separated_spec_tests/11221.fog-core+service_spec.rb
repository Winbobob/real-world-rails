require "spec_helper"

describe Fog::Service do
  class TestService < Fog::Service
    requires :generic_api_key
    recognizes :generic_user

    class Real
      attr_reader :options

      def initialize(opts = {})
        @options = opts
      end
    end

    class Mock
      attr_reader :options

      def initialize(opts = {})
        @options = opts
      end
    end
  end

  class ChildOfTestService < TestService
    class Real; def initialize(*_args); end; end
    class Mock; def initialize(*_args); end; end
  end

  it "properly passes headers" 


  describe "when created with a Hash" do
    it "raises for required argument that are missing" 


    it "converts String keys to be Symbols" 


    it "removes keys with `nil` values" 


    it "converts number String values with to_i" 


    it "converts 'true' String values to TrueClass" 


    it "converts 'false' String values to FalseClass" 


    it "warns for unrecognised options" 

  end

  describe "when creating and mocking is disabled" do
    it "returns the real service" 


    it "TestService::Real has TestService::Collections mixed into the mocked service" 


    it "ChildOfTestService::Real has ChildOfTestService::Collections and TestService::Collections mixed in" 

  end

  describe "when creating and mocking is enabled" do
    it "returns mocked service" 


    it "TestService::Mock has TestService::Collections mixed into the mocked service" 


    it "ChildOfTestService::Mock has ChildOfTestService::Collections and TestService::Collections mixed in" 

  end

  describe "when no credentials are provided" do
    it "uses the global values" 

  end

  describe "when credentials are provided as settings" do
    it "merges the global values into settings" 

  end

  describe "when config object can configure the service itself" do
    it "ignores the global and its values" 

  end

  describe "#setup_requirements" do
    before :each do
      @service = FakeService.new
    end

    it "should require collections" 


    it "should mock" 

  end
end

