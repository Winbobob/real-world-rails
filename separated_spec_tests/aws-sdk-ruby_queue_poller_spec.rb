require_relative 'spec_helper'

module Aws
  module SQS
    describe QueuePoller do

      let(:queue_url) { "https://sqs.us-east-1.amazonaws.com/12345/test" }

      let(:client) { Client.new(stub_responses: true) }

      let(:options) {{ client: client }}

      let(:poller) { QueuePoller.new(queue_url, options) }

      def sample_message(n = nil)
        suffix = n ? "-#{n}" : ''
        {
          message_id: "id#{suffix}",
          receipt_handle:"rh#{suffix}",
          body: "body#{suffix}",
        }
      end

      describe 'configuration' do

        it 'raises an error on unknown configuration options' 


        it 'is immutable' 


        it 'has reasonable defaults' 


        it 'accepts configuration options to the constructor' 


      end

      describe '#poll' do

        it 'receives messages in a loop' 


        it 'yields received messages to the block' 


        it 'yields an array when max messages is greater than 1' 


        describe 'message deletion' do

          it 'deletes the message at the end of the block' 


          it 'supports batch deletion' 


          it 'can skip default delete behavior' 


          it 'skips delete when :skip_delete is thrown' 


          it 'provides the ability to manually delete messages' 


          it 'provides the ability to manually delete message batches' 

        end

        describe 'visibility timeouts' do

          it 'provides a method to update the visibility timeout of a message' 


        end

        describe 'stop polling' do

          it 'polls until :stop_polling is thrown from #before_request' 


          it 'polls until :idle_timeout seconds have past without messages' 


        end

        describe 'tracking stats' do

          it 'counts the number of requests made' 


          it 'counts the number of messages yielded in single mode' 


          it 'counts the number of messages yielded in batch mode' 


          it 'tracks when a message was most recently received' 


          it 'has a nil value for last_message_received_at with no messages' 


          it 'tracks when polling started' 


          it 'tracks when polling stops' 


          it 'yields a stats object to #poll' 


          it 'returns a stats object' 


        end
      end
    end
  end
end

