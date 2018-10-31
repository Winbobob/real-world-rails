require_relative '../../spec_helper'

module Aws
  module Plugins

    describe "Client Side Monitoring Plugins" do
      ClientMetricsSvc = ApiHelper.sample_rest_xml # S3

      let(:stub_publisher) do
        StubPublisher.new
      end

      let(:client) {
        client = ClientMetricsSvc::Client.new(
          stub_responses: true,
          client_side_monitoring_publisher: stub_publisher
        )
        client.handlers.add(
          ClientMetricsPlugin::Handler,
          step: :initialize
        )
        client.handlers.add(
          ClientMetricsSendPlugin::LatencyHandler,
          step: :sign,
          priority: 0
        )
        client.handlers.add(
          ClientMetricsSendPlugin::AttemptHandler,
          step: :sign,
          priority: 95
        )
        client
      }

      let(:env) {{}}

      before do
        stub_const("ENV", env)
      end

      before(:each) do
        stub_publisher.metrics = []
      end

      describe "configuration" do
        it 'defaults config.client_side_monitoring to false' 


        it 'defaults to an empty string client id' 


        it 'does not include the plugin when client_side_monitoring is false' 


        it 'does not include the plugin if an invalid port is provided' 


        it 'does include the plugins when using the default port' 


        it 'accepts client_side_monitoring as an env variable' 


        it 'accepts a custom client id' 


        it 'fetches client id from env variables' 


        it 'defaults to the agent publisher' 

      end

      describe "ApiCall Metrics" do
        it "collects basic call data" 

      end

      describe "ApiCallAttempt Metrics" do
        it "collects basic attempt data" 


        it "collects exception information when an error occurs" 


        it "collects request ID headers when available" 


        describe "failures without network requests" do
          let(:failure_client) {
            client = ClientMetricsSvc::Client.new(
              stub_responses: true,
              client_side_monitoring_publisher: stub_publisher
            )
            client.handlers.add(
              ClientMetricsPlugin::Handler,
              step: :initialize
            )
            client.handlers.add(
              ClientMetricsSendPlugin::LatencyHandler,
              step: :sign,
              priority: 0
            )
            client.handlers.add(
              ClientMetricsSendPlugin::AttemptHandler,
              step: :sign,
              priority: 95
            )
            client.handlers.add(
              FailureInjectionHandler,
              step: :validate,
              priority: 50
            )
            client
          }

          it 'correctly publishes metrics for a validation error' 

        end

        describe "failures without network requests" do
          let(:failure_client) {
            client = ClientMetricsSvc::Client.new(
              stub_responses: true,
              client_side_monitoring_publisher: stub_publisher
            )
            client.handlers.add(
              ClientMetricsPlugin::Handler,
              step: :initialize
            )
            client.handlers.add(
              ClientMetricsSendPlugin::LatencyHandler,
              step: :sign,
              priority: 0
            )
            client.handlers.add(
              ClientMetricsSendPlugin::AttemptHandler,
              step: :sign,
              priority: 95
            )
            client.handlers.add(
              ResponseFailureHandler,
              step: :validate,
              priority: 50
            )
            client
          }

          it "accounts for failures during response handling" 


          it "can handle sdk exceptions and aws exceptions together" 


          it 'recognizes retryable exceptions' 

        end

      end
    end

    class StubPublisher
      attr_accessor :metrics
      attr_accessor :agent_port
      
      def initialize
        @metrics = []
      end

      def publish(request_metrics)
        @metrics << request_metrics
      end
    end

    class FailureInjectionHandler < Seahorse::Client::Handler
      def call(context)
        raise ArgumentError, "Injected exception."
      end
    end

    class ResponseFailureHandler < Seahorse::Client::Handler
      def call(context)
        @handler.call(context)
        raise ArgumentError, "Bad response."
      end
    end

  end
end

