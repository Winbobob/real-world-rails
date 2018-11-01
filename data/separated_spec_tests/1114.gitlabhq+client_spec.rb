# coding: utf-8
require 'spec_helper'

describe ContainerRegistry::Client do
  let(:token) { '12345' }
  let(:options) { { token: token } }
  let(:client) { described_class.new("http://container-registry", options) }

  describe '#blob' do
    it 'GET /v2/:name/blobs/:digest' 


    it 'follows 307 redirect for GET /v2/:name/blobs/:digest' 

  end
end

