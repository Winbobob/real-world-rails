require 'spec_helper'

describe Import::BitbucketServerController do
  let(:user) { create(:user) }
  let(:project_key) { 'test-project' }
  let(:repo_slug) { 'some-repo' }
  let(:client) { instance_double(BitbucketServer::Client) }

  def assign_session_tokens
    session[:bitbucket_server_url] = 'http://localhost:7990'
    session[:bitbucket_server_username] = 'bitbucket'
    session[:bitbucket_server_personal_access_token] = 'some-token'
  end

  before do
    sign_in(user)
    allow(controller).to receive(:bitbucket_server_import_enabled?).and_return(true)
  end

  describe 'GET new' do
    render_views

    it 'shows the input form' 

  end

  describe 'POST create' do
    before do
      allow(controller).to receive(:bitbucket_client).and_return(client)
      repo = double(name: 'my-project')
      allow(client).to receive(:repo).with(project_key, repo_slug).and_return(repo)
      assign_session_tokens
    end

    set(:project) { create(:project) }

    it 'returns the new project' 


    it 'returns an error when an invalid project key is used' 


    it 'returns an error when an invalid repository slug is used' 


    it 'returns an error when the project cannot be found' 


    it 'returns an error when the project cannot be saved' 


    it "returns an error when the server can't be contacted" 

  end

  describe 'POST configure' do
    let(:token) { 'token' }
    let(:username) { 'bitbucket-user' }
    let(:url) { 'http://localhost:7990/bitbucket' }

    it 'clears out existing session' 


    it 'sets the session variables' 

  end

  describe 'GET status' do
    render_views

    before do
      allow(controller).to receive(:bitbucket_client).and_return(client)

      @repo = double(slug: 'vim', project_key: 'asd', full_name: 'asd/vim', "valid?" => true, project_name: 'asd', browse_url: 'http://test', name: 'vim')
      @invalid_repo = double(slug: 'invalid', project_key: 'foobar', full_name: 'asd/foobar', "valid?" => false, browse_url: 'http://bad-repo')
      assign_session_tokens
    end

    it 'assigns repository categories' 

  end

  describe 'GET jobs' do
    before do
      assign_session_tokens
    end

    it 'returns a list of imported projects' 

  end
end

