require_relative '../spec_helper'
require 'uri'

module Aws
  module SQS
    describe Client do
      {
        add_permission:{label:'',aws_account_ids:[], actions:[]},
        change_message_visibility:{receipt_handle:'',visibility_timeout:0},
        change_message_visibility_batch:{entries:{}},
        delete_message:{receipt_handle:''},
        delete_message_batch:{entries:{}},
        delete_queue:{},
        get_queue_attributes:{},
        list_dead_letter_source_queues:{},
        purge_queue:{},
        receive_message:{},
        remove_permission:{label:''},
        send_message:{message_body:''},
        send_message_batch:{entries:{}},
        set_queue_attributes:{attributes:{}},
      }.each_pair do |method, params|

        describe "##{method}" do

          it 'uses the :queue_url param as the request endpoint' 


          it 'signs the request using the region present in the queue url' 


          it 'signs the request using the configured region when region missing from the queue url' 


          it 'raises an error for a badly formatted queue url' 


          it 'does not raise an error for fake sqs queue urls' 

        end
      end
    end
  end
end

