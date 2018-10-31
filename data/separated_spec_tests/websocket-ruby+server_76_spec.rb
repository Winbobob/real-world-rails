# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Server draft 76 handshake' do
  let(:handshake) { WebSocket::Handshake::Server.new }
  let(:version) { 76 }
  let(:client_request) { client_handshake_76(@request_params || {}) }
  let(:server_response) { server_handshake_76(@request_params || {}) }

  it_behaves_like 'all server drafts'

  it 'disallows request without spaces in key 1' 


  it 'disallows request without spaces in key 2' 


  it 'disallows request with invalid number of spaces or numbers in key 1' 


  it 'disallows request with invalid number of spaces or numbers in key 2' 


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

