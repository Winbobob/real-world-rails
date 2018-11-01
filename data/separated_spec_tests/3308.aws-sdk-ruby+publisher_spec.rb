require_relative '../../spec_helper'

module Aws
  module ClientSideMonitoring
    describe Publisher do

      let(:example_attempt) do
        a = RequestMetrics::ApiCallAttempt.new(
          "StubService",
          "StubOperation",
          "",
          1,
          1526502725425,
          "stub-service.us-stubbed-1.example.org",
          "us-stubbed-1",
          "my-user-agent",
          "AKID-STUB",
          "TOKEN-STUB"
        )
        a.request_latency = 95
        a.http_status_code = 200
        a.x_amz_request_id = "226FC0DC6464C2AE"
        a.x_amz_id_2 = "fWhd+V0u5IWKNLhbIZi2ZR/DoWpAt2Km8T9ZZ75UnvkZFl0MU3jlf2B2zRJYHmxqkEc6iAtctOc="
        a
      end

      let(:example_request_metric) do
        rm = RequestMetrics.new(
          service: "StubService",
          operation: "StubOperation",
          client_id: "",
          timestamp: 1526502682104,
          region: "us-stubbed-1"
        )
        rm.add_call_attempt(example_attempt)
        rm.api_call.complete(
          latency: 123,
          attempt_count: 1
        )
        rm
      end

      let(:example_failed_attempt) do
        a = RequestMetrics::ApiCallAttempt.new(
          "StubService",
          "StubOperation",
          "",
          1,
          1526502725425,
          "stub-service.us-stubbed-1.example.org",
          "us-stubbed-1",
          "my-user-agent",
          "AKID-STUB",
          "TOKEN-STUB"
        )
        a.request_latency = 95
        a.http_status_code = 400
        a.x_amz_request_id = "226FC0DC6464C2AE"
        a.x_amz_id_2 = "fWhd+V0u5IWKNLhbIZi2ZR/DoWpAt2Km8T9ZZ75UnvkZFl0MU3jlf2B2zRJYHmxqkEc6iAtctOc="
        a.aws_exception = "ServiceError"
        a.aws_exception_msg = "A service problem happened."
        a.sdk_exception = "Aws::Errors::ParserError"
        a.sdk_exception_msg = "Response parsing error."
        a
      end

      let(:example_failed_metric) do
        rm = RequestMetrics.new(
          service: "StubService",
          operation: "StubOperation",
          client_id: "FooClient",
          timestamp: 1526502682104,
          region: "us-stubbed-1"
        )
        rm.add_call_attempt(example_failed_attempt)
        rm.api_call.complete(
          latency: 123,
          attempt_count: 1
        )
        rm
      end

      it "allows the setting of an agent port" 


      it 'publishes JSON messages to a UDP socket' 


      it 'handles error fields' 


    end
  end
end

