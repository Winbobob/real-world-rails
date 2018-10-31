# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Server draft 04 handshake' do
  let(:handshake) { WebSocket::Handshake::Server.new }
  let(:version) { 4 }
  let(:client_request) { client_handshake_04(@request_params || {}) }
  let(:server_response) { server_handshake_04(@request_params || {}) }

  it_behaves_like 'all server drafts'

  it 'disallows request without Sec-WebSocket-Key' 


  context 'protocol header specified' do
    let(:handshake) { WebSocket::Handshake::Server.new(protocols: %w[binary xmpp]) }

    context 'single protocol requested' do
      it 'returns with the same protocol' 

    end

    context 'multiple protocols requested' do
      it 'returns with the first supported protocol' 

    end

    context 'unsupported protocol requested' do
      it 'reutrns with an empty protocol header' 

    end
  end
end

