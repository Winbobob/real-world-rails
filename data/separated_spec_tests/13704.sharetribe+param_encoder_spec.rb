[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/param_encoder",
].each { |file| require_relative "../../../../#{file}" }

describe ServiceClient::Middleware::ParamEncoder do

  let(:param_encoder) { ServiceClient::Middleware::ParamEncoder.new }

  it "encodes values" 


  it "is idempotent" 


end

