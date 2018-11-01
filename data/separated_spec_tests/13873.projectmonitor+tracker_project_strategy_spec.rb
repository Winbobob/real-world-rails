require 'spec_helper'

describe TrackerProjectStrategy do
  let(:request) { double(:request) }
  let(:client_response_header) { double(:client_response_header, status: 200) }
  let(:client) { double(:client, response: 'some response', error: 'some error', response_header: client_response_header) }
  let(:requester) { double(:asynchronous_http_requester, initiate_request: request) }
  let(:project) { build(:project_with_tracker_integration) }


  let(:requester) { double(:http_requester, initiate_request: request) }
  subject { TrackerProjectStrategy.new(requester) }

  describe '#create_workload' do
    it 'should return a workload with feed and build status jobs' 

  end

  describe '#fetch_status' do
    let(:project) { build(:project_with_tracker_integration) }
    let(:url) { project.tracker_project_url }

    before do
      allow(request).to receive(:callback).and_return(client)
      allow(request).to receive(:errback).and_return(client)
    end

    it 'makes a request with the tracker token' 


    it 'yields a success message when the request is made successfully' 


    it 'yields an error message when the request is made unsuccessfully' 

  end
end

