require 'spec_helper'

describe Gitlab::Workhorse do
  set(:project)    { create(:project, :repository) }
  let(:repository) { project.repository }

  def decode_workhorse_header(array)
    key, value = array
    command, encoded_params = value.split(":")
    params = JSON.parse(Base64.urlsafe_decode64(encoded_params))

    [key, command, params]
  end

  describe ".send_git_archive" do
    let(:ref) { 'master' }
    let(:format) { 'zip' }
    let(:storage_path) { Gitlab.config.gitlab.repository_downloads_path }
    let(:base_params) { repository.archive_metadata(ref, storage_path, format, append_sha: nil) }
    let(:gitaly_params) do
      base_params.merge(
        'GitalyServer' => {
          'address' => Gitlab::GitalyClient.address(project.repository_storage),
          'token' => Gitlab::GitalyClient.token(project.repository_storage)
        },
        'GitalyRepository' => repository.gitaly_repository.to_h.deep_stringify_keys
      )
    end
    let(:cache_disabled) { false }

    subject do
      described_class.send_git_archive(repository, ref: ref, format: format, append_sha: nil)
    end

    before do
      allow(described_class).to receive(:git_archive_cache_disabled?).and_return(cache_disabled)
    end

    it 'sets the header correctly' 


    context 'when archive caching is disabled' do
      let(:cache_disabled) { true }

      it 'tells workhorse not to use the cache' 

    end

    context "when the repository doesn't have an archive file path" do
      before do
        allow(project.repository).to receive(:archive_metadata).and_return(Hash.new)
      end

      it "raises an error" 

    end
  end

  describe '.send_git_patch' do
    let(:diff_refs) { double(base_sha: "base", head_sha: "head") }
    subject { described_class.send_git_patch(repository, diff_refs) }

    it 'sets the header correctly' 

  end

  describe '.terminal_websocket' do
    def terminal(ca_pem: nil)
      out = {
        subprotocols: ['foo'],
        url: 'wss://example.com/terminal.ws',
        headers: { 'Authorization' => ['Token x'] },
        max_session_time: 600
      }
      out[:ca_pem] = ca_pem if ca_pem
      out
    end

    def workhorse(ca_pem: nil)
      out = {
        'Terminal' => {
          'Subprotocols' => ['foo'],
          'Url' => 'wss://example.com/terminal.ws',
          'Header' => { 'Authorization' => ['Token x'] },
          'MaxSessionTime' => 600
        }
      }
      out['Terminal']['CAPem'] = ca_pem if ca_pem
      out
    end

    context 'without ca_pem' do
      subject { described_class.terminal_websocket(terminal) }

      it { is_expected.to eq(workhorse) }
    end

    context 'with ca_pem' do
      subject { described_class.terminal_websocket(terminal(ca_pem: "foo")) }

      it { is_expected.to eq(workhorse(ca_pem: "foo")) }
    end
  end

  describe '.send_git_diff' do
    let(:diff_refs) { double(base_sha: "base", head_sha: "head") }
    subject { described_class.send_git_diff(repository, diff_refs) }

    it 'sets the header correctly' 

  end

  describe ".secret" do
    subject { described_class.secret }

    before do
      described_class.instance_variable_set(:@secret, nil)
      described_class.write_secret
    end

    it 'returns 32 bytes' 


    it 'accepts a trailing newline' 


    it 'raises an exception if the secret file cannot be read' 


    it 'raises an exception if the secret file contains the wrong number of bytes' 

  end

  describe ".write_secret" do
    let(:secret_path) { described_class.secret_path }
    before do
      begin
        File.delete(secret_path)
      rescue Errno::ENOENT
      end

      described_class.write_secret
    end

    it 'uses mode 0600' 


    it 'writes base64 data' 

  end

  describe '#verify_api_request!' do
    let(:header_key) { described_class::INTERNAL_API_REQUEST_HEADER }
    let(:payload) { { 'iss' => 'gitlab-workhorse' } }

    it 'accepts a correct header' 


    it 'raises an error when the header is not set' 


    it 'raises an error when the header is not signed' 


    it 'raises an error when the header is signed with the wrong key' 


    it 'raises an error when the issuer is incorrect' 


    def raise_jwt_error
      raise_error(JWT::DecodeError)
    end

    def call_verify(headers)
      described_class.verify_api_request!(headers)
    end
  end

  describe '.git_http_ok' do
    let(:user) { create(:user) }
    let(:repo_path) { 'ignored but not allowed to be empty in gitlab-workhorse' }
    let(:action) { 'info_refs' }
    let(:params) do
      {
        GL_ID: "user-#{user.id}",
        GL_USERNAME: user.username,
        GL_REPOSITORY: "project-#{project.id}",
        RepoPath: repo_path,
        ShowAllRefs: false
      }
    end

    subject { described_class.git_http_ok(repository, false, user, action) }

    it { expect(subject).to include(params) }

    context 'when is_wiki' do
      let(:params) do
        {
          GL_ID: "user-#{user.id}",
          GL_USERNAME: user.username,
          GL_REPOSITORY: "wiki-#{project.id}",
          RepoPath: repo_path,
          ShowAllRefs: false
        }
      end

      subject { described_class.git_http_ok(repository, true, user, action) }

      it { expect(subject).to include(params) }
    end

    context 'when Gitaly is enabled' do
      let(:gitaly_params) do
        {
          GitalyServer: {
            address: Gitlab::GitalyClient.address('default'),
            token: Gitlab::GitalyClient.token('default')
          }
        }
      end

      before do
        allow(Gitlab.config.gitaly).to receive(:enabled).and_return(true)
      end

      it 'includes a Repository param' 


      context "when git_upload_pack action is passed" do
        let(:action) { 'git_upload_pack' }
        let(:feature_flag) { :post_upload_pack }

        it 'includes Gitaly params in the returned value' 


        context 'show_all_refs enabled' do
          subject { described_class.git_http_ok(repository, false, user, action, show_all_refs: true) }

          it { is_expected.to include(ShowAllRefs: true) }
        end
      end

      context "when git_receive_pack action is passed" do
        let(:action) { 'git_receive_pack' }

        it { expect(subject).to include(gitaly_params) }
      end

      context "when info_refs action is passed" do
        let(:action) { 'info_refs' }

        it { expect(subject).to include(gitaly_params) }

        context 'show_all_refs enabled' do
          subject { described_class.git_http_ok(repository, false, user, action, show_all_refs: true) }

          it { is_expected.to include(ShowAllRefs: true) }
        end
      end

      context 'when action passed is not supported by Gitaly' do
        let(:action) { 'download' }

        it { expect { subject }.to raise_exception('Unsupported action: download') }
      end
    end

    context 'when receive_max_input_size has been updated' do
      it 'returns custom git config' 

    end

    context 'when receive_max_input_size is empty' do
      it 'returns an empty git config' 

    end
  end

  describe '.set_key_and_notify' do
    let(:key) { 'test-key' }
    let(:value) { 'test-value' }

    subject { described_class.set_key_and_notify(key, value, overwrite: overwrite) }

    shared_examples 'set and notify' do
      it 'set and return the same value' 


      it 'set and notify' 

    end

    context 'when we set a new key' do
      let(:overwrite) { true }

      it_behaves_like 'set and notify'
    end

    context 'when we set an existing key' do
      let(:old_value) { 'existing-key' }

      before do
        described_class.set_key_and_notify(key, old_value, overwrite: true)
      end

      context 'and overwrite' do
        let(:overwrite) { true }

        it_behaves_like 'set and notify'
      end

      context 'and do not overwrite' do
        let(:overwrite) { false }

        it 'try to set but return the previous value' 


        it 'does not notify' 

      end
    end
  end

  describe '.send_git_blob' do
    include FakeBlobHelpers

    let(:blob) { fake_blob }

    subject { described_class.send_git_blob(repository, blob) }

    it 'sets the header correctly' 

  end

  describe '.send_url' do
    let(:url) { 'http://example.com' }

    subject { described_class.send_url(url) }

    it 'sets the header correctly' 

  end

  describe '.send_git_snapshot' do
    let(:url) { 'http://example.com' }

    subject(:request) { described_class.send_git_snapshot(repository) }

    it 'sets the header correctly' 

  end
end

