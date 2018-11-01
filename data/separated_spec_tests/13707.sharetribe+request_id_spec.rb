[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/request_id",
].each { |file| require_relative "../../../../#{file}" }

describe ServiceClient::Middleware::RequestID do

  let(:request_id) { ServiceClient::Middleware::RequestID.new }

  it "adds request ID header" 

end

