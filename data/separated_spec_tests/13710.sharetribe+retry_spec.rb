[
  "app/utils/service_client/middleware/middleware_base",
  "app/utils/service_client/middleware/retry",
].each { |file| require_relative "../../../../#{file}" }

require 'pry'

describe ServiceClient::Middleware::Retry do

  let(:mw) { ServiceClient::Middleware::Retry.new(max_attempts: 3) }

  describe "#enter" do

    it "initializes attempts" 


    it "increments attempts" 


    it "copies the enter_queue to retry_queue" 

  end

  describe "#leave" do

    it "returns unmodified ctx if successful" 


    it "retries if the status is 5xx" 


    it "doesn't retry for 4xx statuses" 


    it "doesn't retry if max number of attempts has been made" 


    it "doesn't retry if max number of attempts (from opts) has been made" 


  end

  describe "#error" do

    it "retries and removes the error if unsuccessful" 

  end
end

