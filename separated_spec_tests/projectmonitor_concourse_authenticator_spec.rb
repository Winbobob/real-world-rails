require 'spec_helper'

describe ConcourseAuthenticator do

  let(:requester) { double(:asynchronous_http_requester, initiate_request: request) }
  let(:request) { double(:request) }
  let(:response_header) { double(:response_header, status: 200) }
  let(:client) { double(:client, response: '{"some": "json"}', error: 'some error', response_header: response_header) }
  subject { ConcourseAuthenticator.new(requester) }

  describe '#authenticate' do
    before do
      allow(request).to receive(:callback).and_yield(client)
      allow(request).to receive(:errback)
    end

    context 'when the request succeeds' do
      it 'makes a basic auth request to concourse and yields the session token' 

    end

    context 'when the request fails due to bad credentials' do
      before do
        allow(client).to receive(:response).and_return('authorization failed')
        allow(response_header).to receive(:status).and_return(401)
      end

      it 'should yield a failure' 

    end

    context 'when the request fails because concourse is not configured properly' do
      before do
        allow(requester).to receive(:initiate_request).and_return(nil)
      end

      it 'should log an error' 


      it 'should yield a failure' 

    end

    context 'when the request fails because of a network error' do
      before do
        allow(request).to receive(:callback)
        allow(request).to receive(:errback).and_yield(client)
      end

      it 'yields an error message' 

    end
  end
end

