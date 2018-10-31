require 'spec_helper'
require 'acceptance/webmock_shared'

unless RUBY_PLATFORM =~ /java/
  require 'acceptance/typhoeus/typhoeus_hydra_spec_helper'

  describe "Typhoeus::Hydra" do
    include TyphoeusHydraSpecHelper
    let(:hydra) { Typhoeus::Hydra.new }

    before do
      Typhoeus::Expectation.clear
    end

    include_context "with WebMock"

    describe "Typhoeus::Hydra features" do
      before(:each) do
        WebMock.disable_net_connect!
        WebMock.reset!
      end

      describe "supposed response fields" do
        it "present" 

      end

      describe "when params are used" do
        it "should take into account params for POST request" 


        it "should take into account body for POST request" 


        it "should take into account params for GET request" 

      end

      describe "timeouts" do
        it "should support native typhoeus timeouts" 

      end

      describe "callbacks" do
        before(:each) do
          @request = Typhoeus::Request.new("http://example.com")
        end

        it "should call on_complete with 2xx response" 


        it "should call on_complete with 5xx response" 


        it "should call on_body with 2xx response" 


        it "should call on_headers with 2xx response" 

      end
    end
  end
end

