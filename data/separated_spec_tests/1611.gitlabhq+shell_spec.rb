require 'spec_helper'
require 'stringio'

describe Gitlab::Shell do
  set(:project) { create(:project, :repository) }

  let(:repository) { project.repository }
  let(:gitlab_shell) { described_class.new }
  let(:popen_vars) { { 'GIT_TERMINAL_PROMPT' => ENV['GIT_TERMINAL_PROMPT'] } }
  let(:timeout) { Gitlab.config.gitlab_shell.git_timeout }

  before do
    allow(Project).to receive(:find).and_return(project)
  end

  it { is_expected.to respond_to :add_key }
  it { is_expected.to respond_to :remove_key }
  it { is_expected.to respond_to :create_repository }
  it { is_expected.to respond_to :remove_repository }
  it { is_expected.to respond_to :fork_repository }

  it { expect(gitlab_shell.url_to_repo('diaspora')).to eq(Gitlab.config.gitlab_shell.ssh_path_prefix + "diaspora.git") }

  describe 'memoized secret_token' do
    let(:secret_file) { 'tmp/tests/.secret_shell_test' }
    let(:link_file) { 'tmp/tests/shell-secret-test/.gitlab_shell_secret' }

    before do
      allow(Gitlab.config.gitlab_shell).to receive(:secret_file).and_return(secret_file)
      allow(Gitlab.config.gitlab_shell).to receive(:path).and_return('tmp/tests/shell-secret-test')
      FileUtils.mkdir('tmp/tests/shell-secret-test')
      described_class.ensure_secret_token!
    end

    after do
      FileUtils.rm_rf('tmp/tests/shell-secret-test')
      FileUtils.rm_rf(secret_file)
    end

    it 'creates and links the secret token file' 

  end

  describe '#add_key' do
    context 'when authorized_keys_enabled is true' do
      it 'removes trailing garbage' 

    end

    context 'when authorized_keys_enabled is false' do
      before do
        stub_application_setting(authorized_keys_enabled: false)
      end

      it 'does nothing' 

    end

    context 'when authorized_keys_enabled is nil' do
      before do
        stub_application_setting(authorized_keys_enabled: nil)
      end

      it 'removes trailing garbage' 

    end
  end

  describe '#batch_add_keys' do
    context 'when authorized_keys_enabled is true' do
      it 'instantiates KeyAdder' 

    end

    context 'when authorized_keys_enabled is false' do
      before do
        stub_application_setting(authorized_keys_enabled: false)
      end

      it 'does nothing' 

    end

    context 'when authorized_keys_enabled is nil' do
      before do
        stub_application_setting(authorized_keys_enabled: nil)
      end

      it 'instantiates KeyAdder' 

    end
  end

  describe '#remove_key' do
    context 'when authorized_keys_enabled is true' do
      it 'removes trailing garbage' 

    end

    context 'when authorized_keys_enabled is false' do
      before do
        stub_application_setting(authorized_keys_enabled: false)
      end

      it 'does nothing' 

    end

    context 'when authorized_keys_enabled is nil' do
      before do
        stub_application_setting(authorized_keys_enabled: nil)
      end

      it 'removes trailing garbage' 

    end

    context 'when key content is not given' do
      it 'calls rm-key with only one argument' 

    end
  end

  describe '#remove_all_keys' do
    context 'when authorized_keys_enabled is true' do
      it 'removes trailing garbage' 

    end

    context 'when authorized_keys_enabled is false' do
      before do
        stub_application_setting(authorized_keys_enabled: false)
      end

      it 'does nothing' 

    end

    context 'when authorized_keys_enabled is nil' do
      before do
        stub_application_setting(authorized_keys_enabled: nil)
      end

      it 'removes trailing garbage' 

    end
  end

  describe '#remove_keys_not_found_in_db' do
    context 'when keys are in the file that are not in the DB' do
      before do
        gitlab_shell.remove_all_keys
        gitlab_shell.add_key('key-1234', 'ssh-rsa ASDFASDF')
        gitlab_shell.add_key('key-9876', 'ssh-rsa ASDFASDF')
        @another_key = create(:key) # this one IS in the DB
      end

      it 'removes the keys' 

    end

    context 'when keys there are duplicate keys in the file that are not in the DB' do
      before do
        gitlab_shell.remove_all_keys
        gitlab_shell.add_key('key-1234', 'ssh-rsa ASDFASDF')
        gitlab_shell.add_key('key-1234', 'ssh-rsa ASDFASDF')
      end

      it 'removes the keys' 


      it 'does not run remove more than once per key (in a batch)' 

    end

    context 'when keys there are duplicate keys in the file that ARE in the DB' do
      before do
        gitlab_shell.remove_all_keys
        @key = create(:key)
        gitlab_shell.add_key(@key.shell_id, @key.key)
      end

      it 'does not remove the key' 


      it 'does not need to run a SELECT query for that batch, on account of that key' 

    end

    unless ENV['CI'] # Skip in CI, it takes 1 minute
      context 'when the first batch can be skipped, but the next batch has keys that are not in the DB' do
        before do
          gitlab_shell.remove_all_keys
          100.times { |i| create(:key) } # first batch is all in the DB
          gitlab_shell.add_key('key-1234', 'ssh-rsa ASDFASDF')
        end

        it 'removes the keys not in the DB' 

      end
    end
  end

  describe '#batch_read_key_ids' do
    context 'when there are keys in the authorized_keys file' do
      before do
        gitlab_shell.remove_all_keys
        (1..4).each do |i|
          gitlab_shell.add_key("key-#{i}", "ssh-rsa ASDFASDF#{i}")
        end
      end

      it 'iterates over the key IDs in the file, in batches' 

    end
  end

  describe '#list_key_ids' do
    context 'when there are keys in the authorized_keys file' do
      before do
        gitlab_shell.remove_all_keys
        (1..4).each do |i|
          gitlab_shell.add_key("key-#{i}", "ssh-rsa ASDFASDF#{i}")
        end
      end

      it 'outputs the key IDs in the file, separated by newlines' 

    end

    context 'when there are no keys in the authorized_keys file' do
      before do
        gitlab_shell.remove_all_keys
      end

      it 'outputs nothing, not even an empty string' 

    end
  end

  describe Gitlab::Shell::KeyAdder do
    describe '#add_key' do
      it 'removes trailing garbage' 


      it 'handles multiple spaces in the key' 


      it 'raises an exception if the key contains a tab' 


      it 'raises an exception if the key contains a newline' 

    end
  end

  describe 'projects commands' do
    let(:gitlab_shell_path) { File.expand_path('tmp/tests/gitlab-shell') }
    let(:projects_path) { File.join(gitlab_shell_path, 'bin/gitlab-projects') }
    let(:gitlab_shell_hooks_path) { File.join(gitlab_shell_path, 'hooks') }

    before do
      allow(Gitlab.config.gitlab_shell).to receive(:path).and_return(gitlab_shell_path)
      allow(Gitlab.config.gitlab_shell).to receive(:hooks_path).and_return(gitlab_shell_hooks_path)
      allow(Gitlab.config.gitlab_shell).to receive(:git_timeout).and_return(800)
    end

    describe '#create_repository' do
      let(:repository_storage) { 'default' }
      let(:repository_storage_path) do
        Gitlab::GitalyClient::StorageSettings.allow_disk_access do
          Gitlab.config.repositories.storages[repository_storage].legacy_disk_path
        end
      end
      let(:repo_name) { 'project/path' }
      let(:created_path) { File.join(repository_storage_path, repo_name + '.git') }

      after do
        FileUtils.rm_rf(created_path)
      end

      it 'creates a repository' 


      it 'returns false when the command fails' 

    end

    describe '#remove_repository' do
      let!(:project) { create(:project, :repository, :legacy_storage) }
      let(:disk_path) { "#{project.disk_path}.git" }

      it 'returns true when the command succeeds' 


      it 'keeps the namespace directory' 

    end

    describe '#mv_repository' do
      let!(:project2) { create(:project, :repository) }

      it 'returns true when the command succeeds' 


      it 'returns false when the command fails' 

    end

    describe '#fork_repository' do
      subject do
        gitlab_shell.fork_repository(
          project.repository_storage,
          project.disk_path,
          'nfs-file05',
          'fork/path'
        )
      end

      it 'returns true when the command succeeds' 


      it 'return false when the command fails' 

    end

    describe '#fetch_remote' do
      def fetch_remote(ssh_auth = nil, prune = true)
        gitlab_shell.fetch_remote(repository.raw_repository, 'remote-name', ssh_auth: ssh_auth, prune: prune)
      end

      def expect_call(fail, options = {})
        receive_fetch_remote =
          if fail
            receive(:fetch_remote).and_raise(GRPC::NotFound)
          else
            receive(:fetch_remote).and_return(true)
          end

        expect_any_instance_of(Gitlab::GitalyClient::RepositoryService).to receive_fetch_remote
      end

      def build_ssh_auth(opts = {})
        defaults = {
          ssh_import?: true,
          ssh_key_auth?: false,
          ssh_known_hosts: nil,
          ssh_private_key: nil
        }

        double(:ssh_auth, defaults.merge(opts))
      end

      it 'returns true when the command succeeds' 


      it 'returns true when the command succeeds' 


      it 'raises an exception when the command fails' 


      it 'allows forced and no_tags to be changed' 


      context 'SSH auth' do
        it 'passes the SSH key if specified' 


        it 'does not pass an empty SSH key' 


        it 'does not pass the key unless SSH key auth is to be used' 


        it 'passes the known_hosts data if specified' 


        it 'does not pass empty known_hosts data' 


        it 'does not pass known_hosts data unless SSH is to be used' 

      end

      context 'gitaly call' do
        let(:remote_name) { 'remote-name' }
        let(:ssh_auth) { double(:ssh_auth) }

        subject do
          gitlab_shell.fetch_remote(repository.raw_repository, remote_name,
                                    forced: true, no_tags: true, ssh_auth: ssh_auth)
        end

        it 'passes the correct params to the gitaly service' 

      end
    end

    describe '#import_repository' do
      let(:import_url) { 'https://gitlab.com/gitlab-org/gitlab-ce.git' }

      context 'with gitaly' do
        it 'returns true when the command succeeds' 


        it 'raises an exception when the command fails' 

      end
    end
  end

  describe 'namespace actions' do
    subject { described_class.new }
    let(:storage) { Gitlab.config.repositories.storages.keys.first }

    describe '#add_namespace' do
      it 'creates a namespace' 

    end

    describe '#exists?' do
      context 'when the namespace does not exist' do
        it 'returns false' 

      end

      context 'when the namespace exists' do
        it 'returns true' 

      end
    end

    describe '#remove' do
      it 'removes the namespace' 

    end

    describe '#mv_namespace' do
      it 'renames the namespace' 

    end
  end

  def find_in_authorized_keys_file(key_id)
    gitlab_shell.batch_read_key_ids do |ids|
      return true if ids.include?(key_id) # rubocop:disable Cop/AvoidReturnFromBlocks
    end

    false
  end
end

