require 'spec_helper'

describe "errors" do
  describe WebMock::NetConnectNotAllowedError do
    describe "message" do
      it "should have message with request signature and snippet" 


      it "should have message with registered stubs if available" 


      it "should not be caught by a rescue block without arguments" 


      it "should print body diff if available" 


      context "WebMock.show_body_diff? is false" do
        before do
          WebMock.hide_body_diff!
        end
        it "should not show body diff" 

      end

      context "WebMock.show_stubbing_instructions? is false" do
        before do
          WebMock.hide_stubbing_instructions!
        end

        it "should have message with request signature and snippet" 


        it "should have message with registered stubs if available" 

      end
    end

    let(:request_signature) { double(:request_signature, to_s: rand(10**20).to_s) }
    let(:stub_result)       { double(:stub_result, to_s: rand(10**20).to_s) }
    let(:request_stub)      { double(:request_stub) }
    let(:body_pattern)      { double(:body_pattern, body_pattern: nil)}
    let(:body_diff)         { [["+", "test", "test2"], ["-", "test3"], ["~", "test5", "test6"]] }
  end
end

