require 'spec_helper'

describe 'Git LFS File Locking API' do
  include WorkhorseHelpers

  let(:project)   { create(:project) }
  let(:maintainer) { create(:user) }
  let(:developer) { create(:user) }
  let(:guest)     { create(:user) }
  let(:path)      { 'README.md' }
  let(:headers) do
    {
      'Authorization' => authorization
    }.compact
  end

  shared_examples 'unauthorized request' do
    context 'when user is not authorized' do
      let(:authorization) { authorize_user(guest) }

      it 'returns a forbidden 403 response' 

    end
  end

  before do
    allow(Gitlab.config.lfs).to receive(:enabled).and_return(true)

    project.add_developer(maintainer)
    project.add_developer(developer)
    project.add_guest(guest)
  end

  describe 'Create File Lock endpoint' do
    let(:url)           { "#{project.http_url_to_repo}/info/lfs/locks" }
    let(:authorization) { authorize_user(developer) }
    let(:body)          { { path: path } }

    include_examples 'unauthorized request'

    context 'with an existent lock' do
      before do
        lock_file('README.md', developer)
      end

      it 'return an error message' 


      it 'returns the existen lock' 

    end

    context 'without an existent lock' do
      it 'creates the lock' 

    end
  end

  describe 'Listing File Locks endpoint' do
    let(:url)           { "#{project.http_url_to_repo}/info/lfs/locks" }
    let(:authorization) { authorize_user(developer) }

    include_examples 'unauthorized request'

    it 'returns the list of locked files' 

  end

  describe 'List File Locks for verification endpoint' do
    let(:url)           { "#{project.http_url_to_repo}/info/lfs/locks/verify" }
    let(:authorization) { authorize_user(developer) }

    include_examples 'unauthorized request'

    it 'returns the list of locked files grouped by owner' 

  end

  describe 'Delete File Lock endpoint' do
    let!(:lock)         { lock_file('README.md', developer) }
    let(:url)           { "#{project.http_url_to_repo}/info/lfs/locks/#{lock[:id]}/unlock" }
    let(:authorization) { authorize_user(developer) }

    include_examples 'unauthorized request'

    context 'with an existent lock' do
      it 'deletes the lock' 


      it 'returns the deleted lock' 

    end
  end

  def lock_file(path, author)
    result = Lfs::LockFileService.new(project, author, { path: path }).execute

    result[:lock]
  end

  def authorize_user(user)
    ActionController::HttpAuthentication::Basic.encode_credentials(user.username, user.password)
  end

  def post_lfs_json(url, body = nil, headers = nil)
    post(url, body.try(:to_json), (headers || {}).merge('Content-Type' => LfsRequest::CONTENT_TYPE))
  end

  def do_get(url, params = nil,  headers = nil)
    get(url, (params || {}), (headers || {}).merge('Content-Type' => LfsRequest::CONTENT_TYPE))
  end

  def json_response
    @json_response ||= JSON.parse(response.body)
  end
end

