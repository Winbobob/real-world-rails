require 'spec_helper'

describe Gitlab::Git::GitlabProjects do
  after do
    TestEnv.clean_test_path
  end

  let(:project) { create(:project, :repository) }

  if $VERBOSE
    let(:logger) { Logger.new(STDOUT) }
  else
    let(:logger) { double('logger').as_null_object }
  end

  let(:tmp_repos_path) { TestEnv.repos_path }
  let(:repo_name) { project.disk_path + '.git' }
  let(:tmp_repo_path) { File.join(tmp_repos_path, repo_name) }
  let(:gl_projects) { build_gitlab_projects(TestEnv::REPOS_STORAGE, repo_name) }

  describe '#initialize' do
    it { expect(gl_projects.shard_path).to eq(tmp_repos_path) }
    it { expect(gl_projects.repository_relative_path).to eq(repo_name) }
    it { expect(gl_projects.repository_absolute_path).to eq(File.join(tmp_repos_path, repo_name)) }
    it { expect(gl_projects.logger).to eq(logger) }
  end

  describe '#push_branches' do
    let(:remote_name) { 'remote-name' }
    let(:branch_name) { 'master' }
    let(:cmd) { %W(#{Gitlab.config.git.bin_path} push -- #{remote_name} #{branch_name}) }
    let(:force) { false }

    subject { gl_projects.push_branches(remote_name, 600, force, [branch_name]) }

    it 'executes the command' 


    it 'fails' 


    context 'with --force' do
      let(:cmd) { %W(#{Gitlab.config.git.bin_path} push --force -- #{remote_name} #{branch_name}) }
      let(:force) { true }

      it 'executes the command' 

    end
  end

  describe '#fetch_remote' do
    let(:remote_name) { 'remote-name' }
    let(:branch_name) { 'master' }
    let(:force) { false }
    let(:prune) { true }
    let(:tags) { true }
    let(:args) { { force: force, tags: tags, prune: prune }.merge(extra_args) }
    let(:extra_args) { {} }
    let(:cmd) { %W(#{Gitlab.config.git.bin_path} fetch #{remote_name} --quiet --prune --tags) }

    subject { gl_projects.fetch_remote(remote_name, 600, args) }

    def stub_tempfile(name, filename, opts = {})
      chmod = opts.delete(:chmod)
      file = StringIO.new

      allow(file).to receive(:close!)
      allow(file).to receive(:path).and_return(name)

      expect(Tempfile).to receive(:new).with(filename).and_return(file)
      expect(file).to receive(:chmod).with(chmod) if chmod

      file
    end

    context 'with default args' do
      it 'executes the command' 


      it 'fails' 

    end

    context 'with --force' do
      let(:force) { true }
      let(:cmd) { %W(#{Gitlab.config.git.bin_path} fetch #{remote_name} --quiet --prune --force --tags) }

      it 'executes the command with forced option' 

    end

    context 'with --no-tags' do
      let(:tags) { false }
      let(:cmd) { %W(#{Gitlab.config.git.bin_path} fetch #{remote_name} --quiet --prune --no-tags) }

      it 'executes the command' 

    end

    context 'with no prune' do
      let(:prune) { false }
      let(:cmd) { %W(#{Gitlab.config.git.bin_path} fetch #{remote_name} --quiet --tags) }

      it 'executes the command' 

    end

    describe 'with an SSH key' do
      let(:extra_args) { { ssh_key: 'SSH KEY' } }

      it 'sets GIT_SSH to a custom script' 

    end

    describe 'with known_hosts data' do
      let(:extra_args) { { known_hosts: 'KNOWN HOSTS' } }

      it 'sets GIT_SSH to a custom script' 

    end
  end

  describe '#import_project' do
    let(:project) { create(:project) }
    let(:import_url) { TestEnv.factory_repo_path_bare }
    let(:cmd) { %W(#{Gitlab.config.git.bin_path} clone --bare -- #{import_url} #{tmp_repo_path}) }
    let(:timeout) { 600 }

    subject { gl_projects.import_project(import_url, timeout) }

    shared_examples 'importing repository' do
      context 'success import' do
        it 'imports a repo' 

      end

      context 'already exists' do
        it "doesn't import" 

      end
    end

    context 'when Gitaly import_repository feature is enabled' do
      it_behaves_like 'importing repository'
    end

    context 'when Gitaly import_repository feature is disabled', :disable_gitaly do
      describe 'logging' do
        it 'imports a repo' 

      end

      context 'timeout' do
        it 'does not import a repo' 

      end

      it_behaves_like 'importing repository'
    end
  end

  describe '#fork_repository' do
    let(:dest_repos) { TestEnv::REPOS_STORAGE }
    let(:dest_repos_path) { tmp_repos_path }
    let(:dest_repo_name) { File.join('@hashed', 'aa', 'bb', 'xyz.git') }
    let(:dest_repo) { File.join(dest_repos_path, dest_repo_name) }

    subject { gl_projects.fork_repository(dest_repos, dest_repo_name) }

    before do
      FileUtils.mkdir_p(dest_repos_path)

      # Undo spec_helper stub that deletes hooks
      allow_any_instance_of(described_class).to receive(:fork_repository).and_call_original
    end

    after do
      FileUtils.rm_rf(dest_repos_path)
    end

    shared_examples 'forking a repository' do
      it 'forks the repository' 


      it 'does not fork if a project of the same name already exists' 

    end

    context 'when Gitaly fork_repository feature is enabled' do
      it_behaves_like 'forking a repository'
    end

    context 'when Gitaly fork_repository feature is disabled', :disable_gitaly do
      it_behaves_like 'forking a repository'

      # We seem to be stuck to having only one working Gitaly storage in tests, changing
      # that is not very straight-forward so I'm leaving this test here for now till
      # https://gitlab.com/gitlab-org/gitlab-ce/issues/41393 is fixed.
      context 'different storages' do
        let(:dest_repos) { 'alternative' }
        let(:dest_repos_path) { File.join(File.dirname(tmp_repos_path), dest_repos) }

        before do
          stub_storage_settings(dest_repos => { 'path' => dest_repos_path })
        end

        it 'forks the repo' 

      end

      describe 'log messages' do
        describe 'successful fork' do
          it do
            message = "Forking repository from <#{tmp_repo_path}> to <#{dest_repo}>."
            expect(logger).to receive(:info).with(message)

            subject
          end
        end

        describe 'failed fork due existing destination' do
          it do
            FileUtils.mkdir_p(dest_repo)
            message = "fork-repository failed: destination repository <#{dest_repo}> already exists."
            expect(logger).to receive(:error).with(message)

            subject
          end
        end
      end
    end
  end

  def build_gitlab_projects(*args)
    described_class.new(
      *args,
      global_hooks_path: Gitlab.config.gitlab_shell.hooks_path,
      logger: logger
    )
  end

  def stub_spawn(*args, success: true)
    exitstatus = success ? 0 : nil
    expect(gl_projects).to receive(:popen_with_timeout).with(*args)
      .and_return(["output", exitstatus])
  end

  def stub_spawn_timeout(*args)
    expect(gl_projects).to receive(:popen_with_timeout).with(*args)
      .and_raise(Timeout::Error)
  end
end

