[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/body_encoder",
  "app/utils/transit_utils",
  "app/utils/http_utils",
].each { |file| require_relative "../../../../#{file}" }

require 'transit'
require 'active_support/json'
require 'uuidtools'

describe ServiceClient::Middleware::BodyEncoder do

  def expect_headers(ctx, mime_type)
    expect(ctx[:req][:headers]).to include(
                                     "Accept" => mime_type,
                                     "Content-Type" => mime_type
                                   )
  end

  let(:body_encoder) { ServiceClient::Middleware::BodyEncoder }

  describe "JSONEncoder" do

    let(:encoder) { body_encoder.new(:json) }

    it "#enter" 


    it "#leave" 

  end

  describe "TransitEncoder" do

    describe "transit+json" do

      let(:encoder) { body_encoder.new(:transit_json) }

      describe "#enter" do

        it "encodes the body" 


        it "is idempotent" 


      end

      it "#leave" 

    end

    describe "transit+msgpack" do

      let(:encoder) { body_encoder.new(:transit_msgpack) }

      it "#enter" 


      it "#leave" 

    end
  end

  describe "#enter" do
    let(:encoder) { body_encoder.new(:transit_msgpack) }

    it "uses opts encoding instead of default encoding" 

  end

  describe "#leave" do

    let(:encoder) { body_encoder.new(:transit_msgpack) }

    it "uses the response Content-Type to define which decoder to use" 


    it "uses the request encoder if the Content-Type header is missing" 

  end
end

