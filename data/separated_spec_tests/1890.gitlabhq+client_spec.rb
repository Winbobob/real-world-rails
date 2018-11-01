require 'spec_helper'

describe BitbucketServer::Client do
  let(:base_uri) { 'https://test:7990/stash/' }
  let(:options) { { base_uri: base_uri, user: 'bitbucket', password: 'mypassword' } }
  let(:project) { 'SOME-PROJECT' }
  let(:repo_slug) { 'my-repo' }
  let(:headers) { { "Content-Type" => "application/json" } }

  subject { described_class.new(options) }

  describe '#pull_requests' do
    let(:path) { "/projects/#{project}/repos/#{repo_slug}/pull-requests?state=ALL" }

    it 'requests a collection' 


    it 'throws an exception when connection fails' 

  end

  describe '#activities' do
    let(:path) { "/projects/#{project}/repos/#{repo_slug}/pull-requests/1/activities" }

    it 'requests a collection' 

  end

  describe '#repo' do
    let(:path) { "/projects/#{project}/repos/#{repo_slug}" }
    let(:url) { "#{base_uri}rest/api/1.0/projects/SOME-PROJECT/repos/my-repo" }

    it 'requests a specific repository' 

  end

  describe '#repos' do
    let(:path) { "/repos" }

    it 'requests a collection' 

  end

  describe '#create_branch' do
    let(:branch) { 'test-branch' }
    let(:sha) { '12345678' }
    let(:url) { "#{base_uri}rest/api/1.0/projects/SOME-PROJECT/repos/my-repo/branches" }

    it 'requests Bitbucket to create a branch' 

  end

  describe '#delete_branch' do
    let(:branch) { 'test-branch' }
    let(:sha) { '12345678' }
    let(:url) { "#{base_uri}rest/branch-utils/1.0/projects/SOME-PROJECT/repos/my-repo/branches" }

    it 'requests Bitbucket to create a branch' 

  end
end

