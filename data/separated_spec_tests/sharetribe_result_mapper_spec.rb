[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/result_mapper",
  "app/services/result",
].each { |file| require_relative "../../../../#{file}" }

describe ServiceClient::Middleware::ResultMapper do

  let(:result_mapper) { ServiceClient::Middleware::ResultMapper.new }

  describe "#leave" do
    it "returns Success if request was successful" 


    it "returns Error if request was successful" 

  end

  describe "#error" do
    it "returns Error is middleware processing errored" 

  end
end

