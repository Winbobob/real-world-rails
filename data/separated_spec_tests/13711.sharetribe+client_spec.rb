[
  "app/utils/context_runner",
  "app/utils/service_client/client",
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/endpoint_mapper",
  "app/utils/service_client/middleware/http_client",
  "app/utils/service_client/middleware/result_mapper",
  "app/services/result",
].each { |file| require_relative "../../../#{file}" }

describe ServiceClient::Client do

  class FakeHTTPClient < ServiceClient::Middleware::MiddlewareBase

    def initialize(*)
    end

    def enter(ctx)
      endpoint = ctx.fetch(:req).fetch(:path)
      case endpoint
      when "/show"
        ctx[:res] = {
          status: 200,
          success: true,
          body: "",
          headers: {}
        }
      when "/error"
        ctx[:res] = {
          status: 500,
          success: false,
          body: "Internal server error",
          headers: {}
        }
      else
        raise ArgumentError.new("Unknown endpoint: '#{endpoint}'")
      end

      ctx
    end
  end

  describe "#get" do

    let(:endpoints) {
      {
        show: "/show",
        create: "/create",
        error: "/error"
      }
    }

    let(:client) {
      ServiceClient::Client.new("http://example.com",
                                endpoints,
                                [],
                                http_client: FakeHTTPClient,
                                raise_errors: true
                               )
    }

    it "throws an exception if endpoint is not found" 


    it "returns Success" 


    it "returns Error" 

  end

end

