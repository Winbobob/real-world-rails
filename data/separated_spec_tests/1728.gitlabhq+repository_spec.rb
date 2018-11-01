# coding: utf-8
require "spec_helper"

describe Gitlab::Git::Repository, :seed_helper do
  include Gitlab::EncodingHelper
  using RSpec::Parameterized::TableSyntax

  shared_examples 'wrapping gRPC errors' do |gitaly_client_class, gitaly_client_method|
    it 'wraps gRPC not found error' 


    it 'wraps gRPC unknown error' 

  end

  let(:mutable_repository) { Gitlab::Git::Repository.new('default', TEST_MUTABLE_REPO_PATH, '') }
  let(:repository) { Gitlab::Git::Repository.new('default', TEST_REPO_PATH, '') }
  let(:repository_path) { File.join(TestEnv.repos_path, repository.relative_path) }
  let(:repository_rugged) { Rugged::Repository.new(repository_path) }
  let(:storage_path) { TestEnv.repos_path }
  let(:user) { build(:user) }

  describe '.create_hooks' do
    let(:repo_path) { File.join(storage_path, 'hook-test.git') }
    let(:hooks_dir) { File.join(repo_path, 'hooks') }
    let(:target_hooks_dir) { Gitlab.config.gitlab_shell.hooks_path }
    let(:existing_target) { File.join(repo_path, 'foobar') }

    before do
      FileUtils.rm_rf(repo_path)
      FileUtils.mkdir_p(repo_path)
    end

    context 'hooks is a directory' do
      let(:existing_file) { File.join(hooks_dir, 'my-file') }

      before do
        FileUtils.mkdir_p(hooks_dir)
        FileUtils.touch(existing_file)
        described_class.create_hooks(repo_path, target_hooks_dir)
      end

      it { expect(File.readlink(hooks_dir)).to eq(target_hooks_dir) }
      it { expect(Dir[File.join(repo_path, "hooks.old.*/my-file")].count).to eq(1) }
    end

    context 'hooks is a valid symlink' do
      before do
        FileUtils.mkdir_p existing_target
        File.symlink(existing_target, hooks_dir)
        described_class.create_hooks(repo_path, target_hooks_dir)
      end

      it { expect(File.readlink(hooks_dir)).to eq(target_hooks_dir) }
    end

    context 'hooks is a broken symlink' do
      before do
        FileUtils.rm_f(existing_target)
        File.symlink(existing_target, hooks_dir)
        described_class.create_hooks(repo_path, target_hooks_dir)
      end

      it { expect(File.readlink(hooks_dir)).to eq(target_hooks_dir) }
    end
  end

  describe "Respond to" do
    subject { repository }

    it { is_expected.to respond_to(:root_ref) }
    it { is_expected.to respond_to(:tags) }
  end

  describe '#root_ref' do
    it 'returns UTF-8' 


    it 'gets the branch name from GitalyClient' 


    it_behaves_like 'wrapping gRPC errors', Gitlab::GitalyClient::RefService, :default_branch_name do
      subject { repository.root_ref }
    end
  end

  describe '#branch_names' do
    subject { repository.branch_names }

    it 'has SeedRepo::Repo::BRANCHES.size elements' 


    it 'returns UTF-8' 


    it { is_expected.to include("master") }
    it { is_expected.not_to include("branch-from-space") }

    it 'gets the branch names from GitalyClient' 


    it_behaves_like 'wrapping gRPC errors', Gitlab::GitalyClient::RefService, :branch_names
  end

  describe '#tag_names' do
    subject { repository.tag_names }

    it { is_expected.to be_kind_of Array }

    it 'has SeedRepo::Repo::TAGS.size elements' 


    it 'returns UTF-8' 


    describe '#last' do
      subject { super().last }
      it { is_expected.to eq("v1.2.1") }
    end
    it { is_expected.to include("v1.0.0") }
    it { is_expected.not_to include("v5.0.0") }

    it 'gets the tag names from GitalyClient' 


    it_behaves_like 'wrapping gRPC errors', Gitlab::GitalyClient::RefService, :tag_names
  end

  describe '#archive_metadata' do
    let(:storage_path) { '/tmp' }
    let(:cache_key) { File.join(repository.gl_repository, SeedRepo::LastCommit::ID) }

    let(:append_sha) { true }
    let(:ref) { 'master' }
    let(:format) { nil }

    let(:expected_extension) { 'tar.gz' }
    let(:expected_filename) { "#{expected_prefix}.#{expected_extension}" }
    let(:expected_path) { File.join(storage_path, cache_key, expected_filename) }
    let(:expected_prefix) { "gitlab-git-test-#{ref}-#{SeedRepo::LastCommit::ID}" }

    subject(:metadata) { repository.archive_metadata(ref, storage_path, 'gitlab-git-test', format, append_sha: append_sha) }

    it 'sets CommitId to the commit SHA' 


    it 'sets ArchivePrefix to the expected prefix' 


    it 'sets ArchivePath to the expected globally-unique path' 


    context 'append_sha varies archive path and filename' do
      where(:append_sha, :ref, :expected_prefix) do
        sha = SeedRepo::LastCommit::ID

        true  | 'master' | "gitlab-git-test-master-#{sha}"
        true  | sha      | "gitlab-git-test-#{sha}-#{sha}"
        false | 'master' | "gitlab-git-test-master"
        false | sha      | "gitlab-git-test-#{sha}"
        nil   | 'master' | "gitlab-git-test-master-#{sha}"
        nil   | sha      | "gitlab-git-test-#{sha}"
      end

      with_them do
        it { expect(metadata['ArchivePrefix']).to eq(expected_prefix) }
        it { expect(metadata['ArchivePath']).to eq(expected_path) }
      end
    end

    context 'format varies archive path and filename' do
      where(:format, :expected_extension) do
        nil      | 'tar.gz'
        'madeup' | 'tar.gz'
        'tbz2'   | 'tar.bz2'
        'zip'    | 'zip'
      end

      with_them do
        it { expect(metadata['ArchivePrefix']).to eq(expected_prefix) }
        it { expect(metadata['ArchivePath']).to eq(expected_path) }
      end
    end
  end

  describe '#size' do
    subject { repository.size }

    it { is_expected.to be < 2 }
  end

  describe '#empty?' do
    it { expect(repository).not_to be_empty }
  end

  describe '#ref_names' do
    let(:ref_names) { repository.ref_names }
    subject { ref_names }

    it { is_expected.to be_kind_of Array }

    describe '#first' do
      subject { super().first }
      it { is_expected.to eq('feature') }
    end

    describe '#last' do
      subject { super().last }
      it { is_expected.to eq('v1.2.1') }
    end
  end

  describe '#submodule_url_for' do
    let(:ref) { 'master' }

    def submodule_url(path)
      repository.submodule_url_for(ref, path)
    end

    it { expect(submodule_url('six')).to eq('git://github.com/randx/six.git') }
    it { expect(submodule_url('nested/six')).to eq('git://github.com/randx/six.git') }
    it { expect(submodule_url('deeper/nested/six')).to eq('git://github.com/randx/six.git') }
    it { expect(submodule_url('invalid/path')).to eq(nil) }

    context 'uncommitted submodule dir' do
      let(:ref) { 'fix-existing-submodule-dir' }

      it { expect(submodule_url('submodule-existing-dir')).to eq(nil) }
    end

    context 'tags' do
      let(:ref) { 'v1.2.1' }

      it { expect(submodule_url('six')).to eq('git://github.com/randx/six.git') }
    end

    context 'no .gitmodules at commit' do
      let(:ref) { '9596bc54a6f0c0c98248fe97077eb5ccf48a98d0' }

      it { expect(submodule_url('six')).to eq(nil) }
    end

    context 'no gitlink entry' do
      let(:ref) { '6d39438' }

      it { expect(submodule_url('six')).to eq(nil) }
    end
  end

  describe '#commit_count' do
    it { expect(repository.commit_count("master")).to eq(25) }
    it { expect(repository.commit_count("feature")).to eq(9) }
    it { expect(repository.commit_count("does-not-exist")).to eq(0) }

    it_behaves_like 'wrapping gRPC errors', Gitlab::GitalyClient::CommitService, :commit_count do
      subject { repository.commit_count('master') }
    end
  end

  describe '#has_local_branches?' do
    context 'check for local branches' do
      it { expect(repository.has_local_branches?).to eq(true) }

      context 'mutable' do
        let(:repository) { mutable_repository }

        after do
          ensure_seeds
        end

        it 'returns false when there are no branches' 

      end

      context 'memoizes the value' do
        it 'returns true' 

      end
    end
  end

  describe "#delete_branch" do
    let(:repository) { mutable_repository }

    after do
      ensure_seeds
    end

    it "removes the branch from the repo" 


    context "when branch does not exist" do
      it "raises a DeleteBranchError exception" 

    end
  end

  describe "#create_branch" do
    let(:repository) { mutable_repository }

    after do
      ensure_seeds
    end

    it "should create a new branch" 


    it "should create a new branch with the right name" 


    it "should fail if we create an existing branch" 


    it "should fail if we create a branch from a non existing ref" 

  end

  describe '#delete_refs' do
    let(:repository) { mutable_repository }

    after do
      ensure_seeds
    end

    it 'deletes the ref' 


    it 'deletes all refs' 


    it 'does not fail when deleting an empty list of refs' 


    it 'raises an error if it failed' 

  end

  describe '#branch_names_contains_sha' do
    let(:head_id) { repository_rugged.head.target.oid }
    let(:new_branch) { head_id }
    let(:utf8_branch) { 'branch-é' }

    before do
      repository.create_branch(new_branch, 'master')
      repository.create_branch(utf8_branch, 'master')
    end

    after do
      repository.delete_branch(new_branch)
      repository.delete_branch(utf8_branch)
    end

    it 'displays that branch' 

  end

  describe "#refs_hash" do
    subject { repository.refs_hash }

    it "should have as many entries as branches and tags" 


    it 'has valid commit ids as keys' 

  end

  describe '#fetch_repository_as_mirror' do
    let(:new_repository) do
      Gitlab::Git::Repository.new('default', 'my_project.git', '')
    end

    subject { new_repository.fetch_repository_as_mirror(repository) }

    before do
      Gitlab::Shell.new.create_repository('default', 'my_project')
    end

    after do
      Gitlab::Shell.new.remove_repository('default', 'my_project')
    end

    it 'fetches a repository as a mirror remote' 


    context 'with keep-around refs' do
      let(:sha) { SeedRepo::Commit::ID }
      let(:keep_around_ref) { "refs/keep-around/#{sha}" }
      let(:tmp_ref) { "refs/tmp/#{SecureRandom.hex}" }

      before do
        repository_rugged.references.create(keep_around_ref, sha, force: true)
        repository_rugged.references.create(tmp_ref, sha, force: true)
      end

      it 'includes the temporary and keep-around refs' 

    end

    def new_repository_path
      File.join(TestEnv.repos_path, new_repository.relative_path)
    end
  end

  describe '#find_remote_root_ref' do
    it 'gets the remote root ref from GitalyClient' 


    it 'returns UTF-8' 


    it 'returns nil when remote name is nil' 


    it 'returns nil when remote name is empty' 


    it_behaves_like 'wrapping gRPC errors', Gitlab::GitalyClient::RemoteService, :find_remote_root_ref do
      subject { repository.find_remote_root_ref('origin') }
    end
  end

  describe "#log" do
    shared_examples 'repository log' do
      let(:commit_with_old_name) do
        Gitlab::Git::Commit.find(repository, @commit_with_old_name_id)
      end
      let(:commit_with_new_name) do
        Gitlab::Git::Commit.find(repository, @commit_with_new_name_id)
      end
      let(:rename_commit) do
        Gitlab::Git::Commit.find(repository, @rename_commit_id)
      end

      before do
        # Add new commits so that there's a renamed file in the commit history
        @commit_with_old_name_id = new_commit_edit_old_file(repository_rugged).oid
        @rename_commit_id = new_commit_move_file(repository_rugged).oid
        @commit_with_new_name_id = new_commit_edit_new_file(repository_rugged).oid
      end

      after do
        # Erase our commits so other tests get the original repo
        repository_rugged.references.update("refs/heads/master", SeedRepo::LastCommit::ID)
      end

      context "where 'follow' == true" do
        let(:options) { { ref: "master", follow: true } }

        context "and 'path' is a directory" do
          it "does not follow renames" 

        end

        context "and 'path' is a file that matches the new filename" do
          context 'without offset' do
            it "follows renames" 

          end

          context 'with offset=1' do
            it "follows renames and skip the latest commit" 

          end

          context 'with offset=1', 'and limit=1' do
            it "follows renames, skip the latest commit and return only one commit" 

          end

          context 'with offset=1', 'and limit=2' do
            it "follows renames, skip the latest commit and return only two commits" 

          end

          context 'with offset=2' do
            it "follows renames and skip the latest commit" 

          end

          context 'with offset=2', 'and limit=1' do
            it "follows renames, skip the two latest commit and return only one commit" 

          end

          context 'with offset=2', 'and limit=2' do
            it "follows renames, skip the two latest commit and return only one commit" 

          end
        end

        context "and 'path' is a file that matches the old filename" do
          it "does not follow renames" 

        end

        context "unknown ref" do
          it "returns an empty array" 

        end
      end

      context "where 'follow' == false" do
        options = { follow: false }

        context "and 'path' is a directory" do
          let(:log_commits) do
            repository.log(options.merge(path: "encoding"))
          end

          it "does not follow renames" 

        end

        context "and 'path' is a file that matches the new filename" do
          let(:log_commits) do
            repository.log(options.merge(path: "encoding/CHANGELOG"))
          end

          it "does not follow renames" 

        end

        context "and 'path' is a file that matches the old filename" do
          let(:log_commits) do
            repository.log(options.merge(path: "CHANGELOG"))
          end

          it "does not follow renames" 

        end

        context "and 'path' includes a directory that used to be a file" do
          let(:log_commits) do
            repository.log(options.merge(ref: "refs/heads/fix-blob-path", path: "files/testdir/file.txt"))
          end

          it "returns a list of commits" 

        end
      end

      context "where provides 'after' timestamp" do
        options = { after: Time.iso8601('2014-03-03T20:15:01+00:00') }

        it "should returns commits on or after that timestamp" 

      end

      context "where provides 'before' timestamp" do
        options = { before: Time.iso8601('2014-03-03T20:15:01+00:00') }

        it "should returns commits on or before that timestamp" 

      end

      context 'when multiple paths are provided' do
        let(:options) { { ref: 'master', path: ['PROCESS.md', 'README.md'] } }

        def commit_files(commit)
          Gitlab::GitalyClient::StorageSettings.allow_disk_access do
            commit.deltas.flat_map do |delta|
              [delta.old_path, delta.new_path].uniq.compact
            end
          end
        end

        it 'only returns commits matching at least one path' 

      end

      context 'limit validation' do
        where(:limit) do
          [0, nil, '', 'foo']
        end

        with_them do
          it { expect { repository.log(limit: limit) }.to raise_error(ArgumentError) }
        end
      end

      context 'with all' do
        it 'returns a list of commits' 

      end
    end

    context 'when Gitaly find_commits feature is enabled' do
      it_behaves_like 'repository log'
    end
  end

  describe '#count_commits_between' do
    subject { repository.count_commits_between('feature', 'master') }

    it { is_expected.to eq(17) }
  end

  describe '#raw_changes_between' do
    let(:old_rev) { }
    let(:new_rev) { }
    let(:changes) { repository.raw_changes_between(old_rev, new_rev) }

    context 'initial commit' do
      let(:old_rev) { Gitlab::Git::BLANK_SHA }
      let(:new_rev) { '1a0b36b3cdad1d2ee32457c102a8c0b7056fa863' }

      it 'returns the changes' 

    end

    context 'with an invalid rev' do
      let(:old_rev) { 'foo' }
      let(:new_rev) { 'bar' }

      it 'returns an error' 

    end

    context 'with valid revs' do
      let(:old_rev) { 'fa1b1e6c004a68b7d8763b86455da9e6b23e36d6' }
      let(:new_rev) { '4b4918a572fa86f9771e5ba40fbd48e1eb03e2c6' }

      it 'returns the changes' 

    end
  end

  describe '#merge_base' do
    where(:from, :to, :result) do
      '570e7b2abdd848b95f2f578043fc23bd6f6fd24d' | '40f4a7a617393735a95a0bb67b08385bc1e7c66d' | '570e7b2abdd848b95f2f578043fc23bd6f6fd24d'
      '40f4a7a617393735a95a0bb67b08385bc1e7c66d' | '570e7b2abdd848b95f2f578043fc23bd6f6fd24d' | '570e7b2abdd848b95f2f578043fc23bd6f6fd24d'
      '40f4a7a617393735a95a0bb67b08385bc1e7c66d' | 'foobar' | nil
      'foobar' | '40f4a7a617393735a95a0bb67b08385bc1e7c66d' | nil
    end

    with_them do
      it { expect(repository.merge_base(from, to)).to eq(result) }
    end
  end

  describe '#count_commits' do
    describe 'extended commit counting' do
      context 'with after timestamp' do
        it 'returns the number of commits after timestamp' 

      end

      context 'with before timestamp' do
        it 'returns the number of commits before timestamp' 

      end

      context 'with max_count' do
        it 'returns the number of commits with path ' 

      end

      context 'with path' do
        it 'returns the number of commits with path ' 

      end

      context 'with option :from and option :to' do
        it 'returns the number of commits ahead for fix-mode..fix-blob-path' 


        it 'returns the number of commits ahead for fix-blob-path..fix-mode' 


        context 'with option :left_right' do
          it 'returns the number of commits for fix-mode...fix-blob-path' 


          context 'with max_count' do
            it 'returns the number of commits with path ' 

          end
        end
      end

      context 'with max_count' do
        it 'returns the number of commits up to the passed limit' 

      end

      context "with all" do
        it "returns the number of commits in the whole repository" 

      end

      context 'without all or ref being specified' do
        it "raises an ArgumentError" 

      end
    end
  end

  describe '#find_branch' do
    it 'should return a Branch for master' 


    it 'should handle non-existent branch' 

  end

  describe '#ref_name_for_sha' do
    let(:ref_path) { 'refs/heads' }
    let(:sha) { repository.find_branch('master').dereferenced_target.id }
    let(:ref_name) { 'refs/heads/master' }

    it 'returns the ref name for the given sha' 


    it "returns an empty name if the ref doesn't exist" 


    it "raise an exception if the ref is empty" 


    it "raise an exception if the ref is nil" 

  end

  describe '#branches' do
    subject { repository.branches }

    context 'with local and remote branches' do
      let(:repository) { mutable_repository }

      before do
        create_remote_branch('joe', 'remote_branch', 'master')
        repository.create_branch('local_branch', 'master')
      end

      after do
        ensure_seeds
      end

      it 'returns the local and remote branches' 

    end

    it_behaves_like 'wrapping gRPC errors', Gitlab::GitalyClient::RefService, :branches
  end

  describe '#branch_count' do
    it 'returns the number of branches' 


    context 'with local and remote branches' do
      let(:repository) { mutable_repository }

      before do
        create_remote_branch('joe', 'remote_branch', 'master')
        repository.create_branch('local_branch', 'master')
      end

      after do
        ensure_seeds
      end

      it 'returns the count of local branches' 


      context 'with Gitaly disabled' do
        before do
          allow(Gitlab::GitalyClient).to receive(:feature_enabled?).and_return(false)
        end

        it 'returns the count of local branches' 

      end
    end
  end

  describe '#merged_branch_names' do
    context 'when branch names are passed' do
      it 'only returns the names we are asking' 


      it 'does not return unmerged branch names' 

    end

    context 'when no root ref is available' do
      it 'returns empty list' 

    end

    context 'when no branch names are specified' do
      before do
        repository.create_branch('identical', 'master')
      end

      after do
        ensure_seeds
      end

      it 'returns all merged branch names except for identical one' 

    end
  end

  describe '#diff_stats' do
    let(:left_commit_id) { 'feature' }
    let(:right_commit_id) { 'master' }

    it 'returns a DiffStatsCollection' 


    it 'yields Gitaly::DiffStats objects' 


    it 'returns no Gitaly::DiffStats when SHAs are invalid' 


    it 'returns no Gitaly::DiffStats when there is a nil SHA' 

  end

  describe "#ls_files" do
    let(:master_file_paths) { repository.ls_files("master") }
    let(:utf8_file_paths) { repository.ls_files("ls-files-utf8") }
    let(:not_existed_branch) { repository.ls_files("not_existed_branch") }

    it "read every file paths of master branch" 


    it "reads full file paths of master branch" 


    it "does not read submodule directory and empty directory of master branch" 


    it "does not include 'nil'" 


    it "returns empty array when not existed branch" 


    it "returns valid utf-8 data" 

  end

  describe "#copy_gitattributes" do
    let(:attributes_path) { File.join(SEED_STORAGE_PATH, TEST_REPO_PATH, 'info/attributes') }

    after do
      FileUtils.rm_rf(attributes_path) if Dir.exist?(attributes_path)
    end

    it "raises an error with invalid ref" 


    context 'when forcing encoding issues' do
      let(:branch_name) { "ʕ•ᴥ•ʔ" }

      before do
        repository.create_branch(branch_name, "master")
      end

      after do
        repository.rm_branch(branch_name, user: build(:admin))
      end

      it "doesn't raise with a valid unicode ref" 

    end

    context "with no .gitattrbutes" do
      before do
        repository.copy_gitattributes("master")
      end

      it "does not have an info/attributes" 

    end

    context "with .gitattrbutes" do
      before do
        repository.copy_gitattributes("gitattributes")
      end

      it "has an info/attributes" 


      it "has the same content in info/attributes as .gitattributes" 

    end

    context "with updated .gitattrbutes" do
      before do
        repository.copy_gitattributes("gitattributes")
        repository.copy_gitattributes("gitattributes-updated")
      end

      it "has an info/attributes" 


      it "has the updated content in info/attributes" 

    end

    context "with no .gitattrbutes in HEAD but with previous info/attributes" do
      before do
        repository.copy_gitattributes("gitattributes")
        repository.copy_gitattributes("master")
      end

      it "does not have an info/attributes" 

    end
  end

  describe '#gitattribute' do
    let(:repository) { Gitlab::Git::Repository.new('default', TEST_GITATTRIBUTES_REPO_PATH, '') }

    after do
      ensure_seeds
    end

    it 'returns matching language attribute' 


    it 'returns matching language attribute with additional options' 


    it 'returns nil if nothing matches' 


    context 'without gitattributes file' do
      let(:repository) { Gitlab::Git::Repository.new('default', TEST_REPO_PATH, '') }

      it 'returns nil' 

    end
  end

  describe '#ref_exists?' do
    it 'returns true for an existing tag' 


    it 'returns false for a non-existing tag' 


    it 'raises an ArgumentError for an empty string' 


    it 'raises an ArgumentError for an invalid ref' 

  end

  describe '#tag_exists?' do
    it 'returns true for an existing tag' 


    it 'returns false for a non-existing tag' 

  end

  describe '#branch_exists?' do
    it 'returns true for an existing branch' 


    it 'returns false for a non-existing branch' 


    it 'returns false when using an invalid branch name' 

  end

  describe '#local_branches' do
    let(:repository) { mutable_repository }

    before do
      create_remote_branch('joe', 'remote_branch', 'master')
      repository.create_branch('local_branch', 'master')
    end

    after do
      ensure_seeds
    end

    it 'returns the local branches' 


    it 'returns a Branch with UTF-8 fields' 


    it 'gets the branches from GitalyClient' 


    it_behaves_like 'wrapping gRPC errors', Gitlab::GitalyClient::RefService, :local_branches do
      subject { repository.local_branches }
    end
  end

  describe '#languages' do
    it 'returns exactly the expected results' 


    it "uses the repository's HEAD when no ref is passed" 

  end

  describe '#license_short_name' do
    subject { repository.license_short_name }

    context 'when no license file can be found' do
      let(:project) { create(:project, :repository) }
      let(:repository) { project.repository.raw_repository }

      before do
        project.repository.delete_file(project.owner, 'LICENSE', message: 'remove license', branch_name: 'master')
      end

      it { is_expected.to be_nil }
    end

    context 'when an mit license is found' do
      it { is_expected.to eq('mit') }
    end
  end

  describe '#fetch_source_branch!' do
    let(:local_ref) { 'refs/merge-requests/1/head' }
    let(:source_repository) { mutable_repository }

    after do
      ensure_seeds
    end

    context 'when the branch exists' do
      context 'when the commit does not exist locally' do
        let(:source_branch) { 'new-branch-for-fetch-source-branch' }
        let(:source_path) { File.join(TestEnv.repos_path, source_repository.relative_path) }
        let(:source_rugged) { Rugged::Repository.new(source_path) }
        let(:new_oid) { new_commit_edit_old_file(source_rugged).oid }

        before do
          source_rugged.branches.create(source_branch, new_oid)
        end

        it 'writes the ref' 

      end

      context 'when the commit exists locally' do
        let(:source_branch) { 'master' }
        let(:expected_oid) { SeedRepo::LastCommit::ID }

        it 'writes the ref' 

      end
    end

    context 'when the branch does not exist' do
      let(:source_branch) { 'definitely-not-master' }

      it 'does not write the ref' 

    end
  end

  describe '#rm_branch' do
    let(:project) { create(:project, :repository) }
    let(:repository) { project.repository.raw }
    let(:branch_name) { "to-be-deleted-soon" }

    before do
      project.add_developer(user)
      repository.create_branch(branch_name)
    end

    it "removes the branch from the repo" 

  end

  describe '#write_ref' do
    context 'validations' do
      using RSpec::Parameterized::TableSyntax

      where(:ref_path, :ref) do
        'foo bar' | '123'
        'foobar'  | "12\x003"
      end

      with_them do
        it 'raises ArgumentError' 

      end
    end
  end

  describe '#write_config' do
    before do
      repository_rugged.config["gitlab.fullpath"] = repository_path
    end

    context 'is given a path' do
      it 'writes it to disk' 

    end

    context 'it is given an empty path' do
      it 'does not write it to disk' 

    end

    context 'repository does not exist' do
      it 'raises NoRepository and does not call Gitaly WriteConfig' 

    end
  end

  describe '#set_config' do
    let(:repository) { mutable_repository }
    let(:entries) do
      {
        'test.foo1' => 'bla bla',
        'test.foo2' => 1234,
        'test.foo3' => true
      }
    end

    it 'can set config settings' 


    after do
      entries.keys.each { |k| repository_rugged.config.delete(k) }
    end
  end

  describe '#delete_config' do
    let(:repository) { mutable_repository }
    let(:entries) do
      {
        'test.foo1' => 'bla bla',
        'test.foo2' => 1234,
        'test.foo3' => true
      }
    end

    it 'can delete config settings' 

  end

  describe '#merge' do
    let(:repository) { mutable_repository }
    let(:source_sha) { '913c66a37b4a45b9769037c55c2d238bd0942d2e' }
    let(:target_branch) { 'test-merge-target-branch' }

    before do
      repository.create_branch(target_branch, '6d394385cf567f80a8fd85055db1ab4c5295806f')
    end

    after do
      ensure_seeds
    end

    it 'can perform a merge' 


    it 'returns nil if there was a concurrent branch update' 

  end

  describe '#ff_merge' do
    let(:repository) { mutable_repository }
    let(:branch_head) { '6d394385cf567f80a8fd85055db1ab4c5295806f' }
    let(:source_sha) { 'cfe32cf61b73a0d5e9f13e774abde7ff789b1660' }
    let(:target_branch) { 'test-ff-target-branch' }

    before do
      repository.create_branch(target_branch, branch_head)
    end

    after do
      ensure_seeds
    end

    subject { repository.ff_merge(user, source_sha, target_branch) }

    shared_examples '#ff_merge' do
      it 'performs a ff_merge' 


      context 'with a non-existing target branch' do
        subject { repository.ff_merge(user, source_sha, 'this-isnt-real') }

        it 'throws an ArgumentError' 

      end

      context 'with a non-existing source commit' do
        let(:source_sha) { 'f001' }

        it 'throws an ArgumentError' 

      end

      context 'when the source sha is not a descendant of the branch head' do
        let(:source_sha) { '1a0b36b3cdad1d2ee32457c102a8c0b7056fa863' }

        it "doesn't perform the ff_merge" 

      end
    end

    it "calls Gitaly's OperationService" 


    it_behaves_like '#ff_merge'
  end

  describe '#delete_all_refs_except' do
    let(:repository) { mutable_repository }

    before do
      repository.write_ref("refs/delete/a", "0b4bc9a49b562e85de7cc9e834518ea6828729b9")
      repository.write_ref("refs/also-delete/b", "12d65c8dd2b2676fa3ac47d955accc085a37a9c1")
      repository.write_ref("refs/keep/c", "6473c90867124755509e100d0d35ebdc85a0b6ae")
      repository.write_ref("refs/also-keep/d", "0b4bc9a49b562e85de7cc9e834518ea6828729b9")
    end

    after do
      ensure_seeds
    end

    it 'deletes all refs except those with the specified prefixes' 

  end

  describe 'remotes' do
    let(:repository) { mutable_repository }
    let(:remote_name) { 'my-remote' }
    let(:url) { 'http://my-repo.git' }

    after do
      ensure_seeds
    end

    describe '#add_remote' do
      let(:mirror_refmap) { '+refs/*:refs/*' }

      it 'added the remote' 

    end

    describe '#remove_remote' do
      it 'removes the remote' 

    end
  end

  describe '#bundle_to_disk' do
    let(:save_path) { File.join(Dir.tmpdir, "repo-#{SecureRandom.hex}.bundle") }

    after do
      FileUtils.rm_rf(save_path)
    end

    it 'saves a bundle to disk' 

  end

  describe '#create_from_bundle' do
    let(:bundle_path) { File.join(Dir.tmpdir, "repo-#{SecureRandom.hex}.bundle") }
    let(:project) { create(:project) }
    let(:imported_repo) { project.repository.raw }

    before do
      expect(repository.bundle_to_disk(bundle_path)).to be_truthy
    end

    after do
      FileUtils.rm_rf(bundle_path)
    end

    it 'creates a repo from a bundle file' 


    it 'creates a symlink to the global hooks dir' 

  end

  describe '#checksum' do
    it 'calculates the checksum for non-empty repo' 


    it 'returns 0000000000000000000000000000000000000000 for an empty repo' 


    it 'raises Gitlab::Git::Repository::InvalidRepository error for non-valid git repo' 


    it 'raises Gitlab::Git::Repository::NoRepository error when there is no repo' 

  end

  describe '#clean_stale_repository_files' do
    let(:worktree_path) { File.join(repository_path, 'worktrees', 'delete-me') }

    it 'cleans up the files' 


    def rev_list_all
      system(*%W[git -C #{repository_path} rev-list --all], out: '/dev/null', err: '/dev/null')
    end

    it 'increments a counter upon an error' 

  end

  describe '#squash' do
    let(:squash_id) { '1' }
    let(:branch_name) { 'fix' }
    let(:start_sha) { '4b4918a572fa86f9771e5ba40fbd48e1eb03e2c6' }
    let(:end_sha) { '12d65c8dd2b2676fa3ac47d955accc085a37a9c1' }

    subject do
      opts = {
        branch: branch_name,
        start_sha: start_sha,
        end_sha: end_sha,
        author: user,
        message: 'Squash commit message'
      }

      repository.squash(user, squash_id, opts)
    end

    # Should be ported to gitaly-ruby rspec suite https://gitlab.com/gitlab-org/gitaly/issues/1234
    skip 'sparse checkout' do
      let(:expected_files) { %w(files files/js files/js/application.js) }

      it 'checks out only the files in the diff' 


      context 'when the diff contains a rename' do
        let(:end_sha) { new_commit_move_file(repository_rugged).oid }

        after do
          # Erase our commits so other tests get the original repo
          repository_rugged.references.update('refs/heads/master', SeedRepo::LastCommit::ID)
        end

        it 'does not include the renamed file in the sparse checkout' 

      end
    end

    # Should be ported to gitaly-ruby rspec suite https://gitlab.com/gitlab-org/gitaly/issues/1234
    skip 'with an ASCII-8BIT diff' do
      let(:diff) { "diff --git a/README.md b/README.md\nindex faaf198..43c5edf 100644\n--- a/README.md\n+++ b/README.md\n@@ -1,4 +1,4 @@\n-testme\n+✓ testme\n ======\n \n Sample repo for testing gitlab features\n" }

      it 'applies a ASCII-8BIT diff' 

    end

    # Should be ported to gitaly-ruby rspec suite https://gitlab.com/gitlab-org/gitaly/issues/1234
    skip 'with trailing whitespace in an invalid patch' do
      let(:diff) { "diff --git a/README.md b/README.md\nindex faaf198..43c5edf 100644\n--- a/README.md\n+++ b/README.md\n@@ -1,4 +1,4 @@\n-testme\n+   \n ======   \n \n Sample repo for testing gitlab features\n" }

      it 'does not include whitespace warnings in the error' 

    end
  end

  def create_remote_branch(remote_name, branch_name, source_branch_name)
    source_branch = repository.branches.find { |branch| branch.name == source_branch_name }
    repository_rugged.references.create("refs/remotes/#{remote_name}/#{branch_name}", source_branch.dereferenced_target.sha)
  end

  # Build the options hash that's passed to Rugged::Commit#create
  def commit_options(repo, index, message)
    options = {}
    options[:tree] = index.write_tree(repo)
    options[:author] = {
      email: "test@example.com",
      name: "Test Author",
      time: Time.gm(2014, "mar", 3, 20, 15, 1)
    }
    options[:committer] = {
      email: "test@example.com",
      name: "Test Author",
      time: Time.gm(2014, "mar", 3, 20, 15, 1)
    }
    options[:message] ||= message
    options[:parents] = repo.empty? ? [] : [repo.head.target].compact
    options[:update_ref] = "HEAD"

    options
  end

  # Writes a new commit to the repo and returns a Rugged::Commit.  Replaces the
  # contents of CHANGELOG with a single new line of text.
  def new_commit_edit_old_file(repo)
    oid = repo.write("I replaced the changelog with this text", :blob)
    index = repo.index
    index.read_tree(repo.head.target.tree)
    index.add(path: "CHANGELOG", oid: oid, mode: 0100644)

    options = commit_options(
      repo,
      index,
      "Edit CHANGELOG in its original location"
    )

    sha = Rugged::Commit.create(repo, options)
    repo.lookup(sha)
  end

  # Writes a new commit to the repo and returns a Rugged::Commit.  Replaces the
  # contents of encoding/CHANGELOG with new text.
  def new_commit_edit_new_file(repo)
    oid = repo.write("I'm a new changelog with different text", :blob)
    index = repo.index
    index.read_tree(repo.head.target.tree)
    index.add(path: "encoding/CHANGELOG", oid: oid, mode: 0100644)

    options = commit_options(repo, index, "Edit encoding/CHANGELOG")

    sha = Rugged::Commit.create(repo, options)
    repo.lookup(sha)
  end

  # Writes a new commit to the repo and returns a Rugged::Commit.  Moves the
  # CHANGELOG file to the encoding/ directory.
  def new_commit_move_file(repo)
    blob_oid = repo.head.target.tree.detect { |i| i[:name] == "CHANGELOG" }[:oid]
    file_content = repo.lookup(blob_oid).content
    oid = repo.write(file_content, :blob)
    index = repo.index
    index.read_tree(repo.head.target.tree)
    index.add(path: "encoding/CHANGELOG", oid: oid, mode: 0100644)
    index.remove("CHANGELOG")

    options = commit_options(repo, index, "Move CHANGELOG to encoding/")

    sha = Rugged::Commit.create(repo, options)
    repo.lookup(sha)
  end

  def refs(dir)
    IO.popen(%W[git -C #{dir} for-each-ref], &:read).split("\n").map do |line|
      line.split("\t").last
    end
  end
end

