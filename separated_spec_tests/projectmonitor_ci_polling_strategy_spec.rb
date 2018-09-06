require 'spec_helper'

describe CIPollingStrategy do
  let(:request) { double(:request) }
  let(:client_response_header) { double(:client_response_header, status: 200) }
  let(:client) { double(:client, response: 'some response', error: 'some error', response_header: client_response_header) }
  let(:requester) { double(:asynchronous_http_requester, initiate_request: request) }
  let(:project) { build(:jenkins_project) }

  subject { CIPollingStrategy.new(requester) }

  describe '#create_workload' do
    it 'should return a workload with feed and build status jobs' 

  end

  describe '#fetch_status' do
    let(:url) { project.feed_url }

    before do
      allow(request).to receive(:callback).and_return(client)
      allow(request).to receive(:errback).and_return(client)
    end

    it 'should initiate a request to the build URL' 


    it 'should pass along auth username and password, when present' 


    it 'should pass along the option to accept mime types, when present' 


    it 'yields a success message when the request is made successfully' 


    it 'yields an error message when the request is made unsuccessfully' 

  end
end

