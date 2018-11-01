require 'spec_helper'

describe BitbucketServer::Connection do
  let(:options) { { base_uri: 'https://test:7990', user: 'bitbucket', password: 'mypassword' } }
  let(:payload) { { 'test' => 1 } }
  let(:headers) { { "Content-Type" => "application/json" } }
  let(:url) { 'https://test:7990/rest/api/1.0/test?something=1' }

  subject { described_class.new(options) }

  describe '#get' do
    it 'returns JSON body' 


    it 'throws an exception if the response is not 200' 


    it 'throws an exception if the response is not JSON' 

  end

  describe '#post' do
    let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }

    it 'returns JSON body' 


    it 'throws an exception if the response is not 200' 

  end

  describe '#delete' do
    let(:headers) { { 'Accept' => 'application/json', 'Content-Type' => 'application/json' } }

    context 'branch API' do
      let(:branch_path) { '/projects/foo/repos/bar/branches' }
      let(:branch_url) { 'https://test:7990/rest/branch-utils/1.0/projects/foo/repos/bar/branches' }
      let(:path) { }

      it 'returns JSON body' 


      it 'throws an exception if the response is not 200' 

    end
  end
end

