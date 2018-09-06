[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/timeout",
].each { |file| require_relative "../../../../#{file}" }

describe ServiceClient::Middleware::Timeout do

  let(:timeout) { ServiceClient::Middleware::Timeout.new }

  it "adds default timeout" 

end

