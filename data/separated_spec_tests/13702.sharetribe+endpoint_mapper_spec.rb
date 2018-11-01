[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/endpoint_mapper",
].each { |file| require_relative "../../../../#{file}" }

describe ServiceClient::Middleware::EndpointMapper do

  let(:endpoint_map) {
    { show: "/show" }
  }

  let(:endpoint_mapper) { ServiceClient::Middleware::EndpointMapper.new(endpoint_map) }

  it "maps endpoint name to path" 


  it "throws if endpoint is not found" 

end

