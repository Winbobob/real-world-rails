require_relative '../../spec_helper'

describe 'Client Interface:' do
  describe 'Support Event Streaming Operations' do

    before(:all) do
      SpecHelper.generate_service(['Events'], multiple_files: false)
    end

    let(:stream) {
      [
        # eventheader & eventpayload(blob)
        { message_type: 'event', event_type: :a, member_a: 'foo', member_b: StringIO.new('bar') },
        # eventpayload(string)
        { message_type: 'event', event_type: :b, member_c: 'baz' },
        # eventpayload(structure)
        { message_type: 'event', event_type: :c, member_d: {struct_member_a: 'foo', struct_member_b: 'bar'} },
        # an unmodeled error event
        { message_type: 'error', error_code: 'InternalError', error_message: 'An internal server error occurred'}
      ].each
    }
    let(:client) {
      Events::Client.new(
        region: 'us-west-2',
        credentials: Aws::Credentials.new('akid', 'secret'),
        stub_responses: {foo: {
          payload: stream 
        }}
      )
    }

    it 'supports eventstream object for `event_stream_handler` option' 


    it 'support Proc object for `event_stream_handler` option' 


    it 'supports no `event_stream_handler` option input' 


    it 'supports block streaming' 


    it 'supports `event_stream_handler` and block streaming at same time' 


    it 'supports error event' 


  end
end

