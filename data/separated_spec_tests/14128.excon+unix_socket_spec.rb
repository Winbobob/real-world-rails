require "spec_helper"

describe Excon::Connection do
  include_context('stubs')
  context "when speaking to a UNIX socket" do
    context "Host header handling" do
      before do
        Excon.stub do |req|
          {
            body: req[:headers].to_json,
            status: 200,
          }
        end
      end
      it "sends an empty Host= by default" 


      it "doesn't overwrite an explicit Host header" 

    end
  end
end

