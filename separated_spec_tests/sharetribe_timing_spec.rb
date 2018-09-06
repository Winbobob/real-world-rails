[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/timing",
].each { |file| require_relative "../../../../#{file}" }

describe ServiceClient::Middleware::Timing do

  let(:started_at) { Time.at(1234567890.0) }
  let(:end_at)     { Time.at(1234567890.25) } # 250 ms

  describe "#enter" do

    let(:timing) { ServiceClient::Middleware::Timing.new(->() { started_at }) }

    it "adds started_at timestamp" 

  end

  describe "#error/#leave" do

    let(:timing) { ServiceClient::Middleware::Timing.new(->() { end_at }) }

    it "leave adds duration" 


    it "error adds duration" 

  end
end

