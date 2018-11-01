# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Server draft 75 handshake' do
  let(:handshake) { WebSocket::Handshake::Server.new }

  let(:version) { 75 }
  let(:client_request) { client_handshake_75(@request_params || {}) }
  let(:server_response) { server_handshake_75(@request_params || {}) }

  it_behaves_like 'all server drafts'

  context 'protocol header specified' do
    let(:handshake) { WebSocket::Handshake::Server.new(protocols: %w[binary]) }

    context 'supported' do
      it 'returns with the same protocol' 

    end

    context 'unsupported' do
      it 'returns with an empty protocol header' 

    end
  end
end

