# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Client draft 76 handshake' do
  let(:handshake) { WebSocket::Handshake::Client.new({ uri: 'ws://example.com/demo', origin: 'http://example.com', version: version }.merge(@request_params || {})) }

  let(:version) { 76 }
  let(:client_request) { client_handshake_76({ key1: handshake.handler.send(:key1), key2: handshake.handler.send(:key2), key3: handshake.handler.send(:key3) }.merge(@request_params || {})) }
  let(:server_response) { server_handshake_76({ challenge: handshake.handler.send(:challenge) }.merge(@request_params || {})) }

  it_behaves_like 'all client drafts'

  it 'disallows client with invalid challenge' 


  context 'protocol header specified' do
    let(:handshake) { WebSocket::Handshake::Client.new(uri: 'ws://example.com/demo', origin: 'http://example.com', version: version, protocols: %w[binary]) }

    context 'supported' do
      it 'returns a valid handshake' 

    end

    context 'unsupported' do
      it 'fails with an unsupported protocol error' 

    end
  end
end

