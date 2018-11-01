require "spec_helper"

describe Gitlab::Git::Commit, :seed_helper do
  include GitHelpers

  let(:repository) { Gitlab::Git::Repository.new('default', TEST_REPO_PATH, '') }
  let(:rugged_repo) do
    Rugged::Repository.new(File.join(TestEnv.repos_path, TEST_REPO_PATH))
  end
  let(:commit) { described_class.find(repository, SeedRepo::Commit::ID) }
  let(:rugged_commit) { rugged_repo.lookup(SeedRepo::Commit::ID) }

  describe "Commit info" do
    before do
      @committer = {
        email: 'mike@smith.com',
        name: "Mike Smith",
        time: Time.now
      }

      @author = {
        email: 'john@smith.com',
        name: "John Smith",
        time: Time.now
      }

      @parents = [rugged_repo.head.target]
      @gitlab_parents = @parents.map { |c| described_class.find(repository, c.oid) }
      @tree = @parents.first.tree

      sha = Rugged::Commit.create(
        rugged_repo,
        author: @author,
        committer: @committer,
        tree: @tree,
        parents: @parents,
        message: "Refactoring specs",
        update_ref: "HEAD"
      )

      @raw_commit = rugged_repo.lookup(sha)
      @commit = described_class.find(repository, sha)
    end

    it { expect(@commit.short_id).to eq(@raw_commit.oid[0..10]) }
    it { expect(@commit.id).to eq(@raw_commit.oid) }
    it { expect(@commit.sha).to eq(@raw_commit.oid) }
    it { expect(@commit.safe_message).to eq(@raw_commit.message) }
    it { expect(@commit.created_at).to eq(@raw_commit.author[:time]) }
    it { expect(@commit.date).to eq(@raw_commit.committer[:time]) }
    it { expect(@commit.author_email).to eq(@author[:email]) }
    it { expect(@commit.author_name).to eq(@author[:name]) }
    it { expect(@commit.committer_name).to eq(@committer[:name]) }
    it { expect(@commit.committer_email).to eq(@committer[:email]) }
    it { expect(@commit.different_committer?).to be_truthy }
    it { expect(@commit.parents).to eq(@gitlab_parents) }
    it { expect(@commit.parent_id).to eq(@parents.first.oid) }
    it { expect(@commit.no_commit_message).to eq("--no commit message") }

    after do
      # Erase the new commit so other tests get the original repo
      rugged_repo.references.update("refs/heads/master", SeedRepo::LastCommit::ID)
    end
  end

  describe "Commit info from gitaly commit" do
    let(:subject) { "My commit".force_encoding('ASCII-8BIT') }
    let(:body) { subject + "My body".force_encoding('ASCII-8BIT') }
    let(:body_size) { body.length }
    let(:gitaly_commit) { build(:gitaly_commit, subject: subject, body: body, body_size: body_size) }
    let(:id) { gitaly_commit.id }
    let(:committer) { gitaly_commit.committer }
    let(:author) { gitaly_commit.author }
    let(:commit) { described_class.new(repository, gitaly_commit) }

    it { expect(commit.short_id).to eq(id[0..10]) }
    it { expect(commit.id).to eq(id) }
    it { expect(commit.sha).to eq(id) }
    it { expect(commit.safe_message).to eq(body) }
    it { expect(commit.created_at).to eq(Time.at(committer.date.seconds)) }
    it { expect(commit.author_email).to eq(author.email) }
    it { expect(commit.author_name).to eq(author.name) }
    it { expect(commit.committer_name).to eq(committer.name) }
    it { expect(commit.committer_email).to eq(committer.email) }
    it { expect(commit.parent_ids).to eq(gitaly_commit.parent_ids) }

    context 'body_size != body.size' do
      let(:body) { "".force_encoding('ASCII-8BIT') }

      context 'zero body_size' do
        it { expect(commit.safe_message).to eq(subject) }
      end

      context 'body_size less than threshold' do
        let(:body_size) { 123 }

        it 'fetches commit message seperately' 

      end

      context 'body_size greater than threshold' do
        let(:body_size) { described_class::MAX_COMMIT_MESSAGE_DISPLAY_SIZE + 1 }

        it 'returns the suject plus a notice about message size' 

      end
    end
  end

  context 'Class methods' do
    describe '.find' do
      it "should return first head commit if without params" 


      it "should return valid commit" 


      it "returns an array of parent ids" 


      it "should return valid commit for tag" 


      it "should return nil for non-commit ids" 


      it "should return nil for parent of non-commit object" 


      it "should return nil for nonexisting ids" 


      context 'with broken repo' do
        let(:repository) { Gitlab::Git::Repository.new('default', TEST_BROKEN_REPO_PATH, '') }

        it 'returns nil' 

      end
    end

    describe '.last_for_path' do
      context 'no path' do
        subject { described_class.last_for_path(repository, 'master') }

        describe '#id' do
          subject { super().id }
          it { is_expected.to eq(SeedRepo::LastCommit::ID) }
        end
      end

      context 'path' do
        subject { described_class.last_for_path(repository, 'master', 'files/ruby') }

        describe '#id' do
          subject { super().id }
          it { is_expected.to eq(SeedRepo::Commit::ID) }
        end
      end

      context 'ref + path' do
        subject { described_class.last_for_path(repository, SeedRepo::Commit::ID, 'encoding') }

        describe '#id' do
          subject { super().id }
          it { is_expected.to eq(SeedRepo::BigCommit::ID) }
        end
      end
    end

    shared_examples '.where' do
      context 'path is empty string' do
        subject do
          commits = described_class.where(
            repo: repository,
            ref: 'master',
            path: '',
            limit: 10
          )

          commits.map { |c| c.id }
        end

        it 'has 10 elements' 

        it { is_expected.to include(SeedRepo::EmptyCommit::ID) }
      end

      context 'path is nil' do
        subject do
          commits = described_class.where(
            repo: repository,
            ref: 'master',
            path: nil,
            limit: 10
          )

          commits.map { |c| c.id }
        end

        it 'has 10 elements' 

        it { is_expected.to include(SeedRepo::EmptyCommit::ID) }
      end

      context 'ref is branch name' do
        subject do
          commits = described_class.where(
            repo: repository,
            ref: 'master',
            path: 'files',
            limit: 3,
            offset: 1
          )

          commits.map { |c| c.id }
        end

        it 'has 3 elements' 

        it { is_expected.to include("d14d6c0abdd253381df51a723d58691b2ee1ab08") }
        it { is_expected.not_to include("eb49186cfa5c4338011f5f590fac11bd66c5c631") }
      end

      context 'ref is commit id' do
        subject do
          commits = described_class.where(
            repo: repository,
            ref: "874797c3a73b60d2187ed6e2fcabd289ff75171e",
            path: 'files',
            limit: 3,
            offset: 1
          )

          commits.map { |c| c.id }
        end

        it 'has 3 elements' 

        it { is_expected.to include("2f63565e7aac07bcdadb654e253078b727143ec4") }
        it { is_expected.not_to include(SeedRepo::Commit::ID) }
      end

      context 'ref is tag' do
        subject do
          commits = described_class.where(
            repo: repository,
            ref: 'v1.0.0',
            path: 'files',
            limit: 3,
            offset: 1
          )

          commits.map { |c| c.id }
        end

        it 'has 3 elements' 

        it { is_expected.to include("874797c3a73b60d2187ed6e2fcabd289ff75171e") }
        it { is_expected.not_to include(SeedRepo::Commit::ID) }
      end
    end

    describe '.where with gitaly' do
      it_should_behave_like '.where'
    end

    describe '.where without gitaly', :skip_gitaly_mock do
      it_should_behave_like '.where'
    end

    describe '.between' do
      subject do
        commits = described_class.between(repository, SeedRepo::Commit::PARENT_ID, SeedRepo::Commit::ID)
        commits.map { |c| c.id }
      end

      it 'has 1 element' 

      it { is_expected.to include(SeedRepo::Commit::ID) }
      it { is_expected.not_to include(SeedRepo::FirstCommit::ID) }
    end

    describe '.shas_with_signatures' do
      let(:signed_shas) { %w[5937ac0a7beb003549fc5fd26fc247adbce4a52e 570e7b2abdd848b95f2f578043fc23bd6f6fd24d] }
      let(:unsigned_shas) { %w[19e2e9b4ef76b422ce1154af39a91323ccc57434 c642fe9b8b9f28f9225d7ea953fe14e74748d53b] }
      let(:first_signed_shas) { %w[5937ac0a7beb003549fc5fd26fc247adbce4a52e c642fe9b8b9f28f9225d7ea953fe14e74748d53b] }

      it 'has 2 signed shas' 


      it 'has 0 signed shas' 


      it 'has 1 signed sha' 

    end

    describe '.find_all' do
      it 'should return a return a collection of commits' 


      context 'max_count' do
        subject do
          commits = described_class.find_all(
            repository,
            max_count: 50
          )

          commits.map(&:id)
        end

        it 'has 34 elements' 


        it 'includes the expected commits' 

      end

      context 'ref + max_count + skip' do
        subject do
          commits = described_class.find_all(
            repository,
            ref: 'master',
            max_count: 50,
            skip: 1
          )

          commits.map(&:id)
        end

        it 'has 24 elements' 


        it 'includes the expected commits' 

      end
    end

    describe '#batch_by_oid' do
      context 'when oids is empty' do
        it 'makes no Gitaly request' 

      end
    end

    shared_examples 'extracting commit signature' do
      context 'when the commit is signed' do
        let(:commit_id) { '0b4bc9a49b562e85de7cc9e834518ea6828729b9' }

        it 'returns signature and signed text' 

      end

      context 'when the commit has no signature' do
        let(:commit_id) { '4b4918a572fa86f9771e5ba40fbd48e1eb03e2c6' }

        it 'returns nil' 

      end

      context 'when the commit cannot be found' do
        let(:commit_id) { Gitlab::Git::BLANK_SHA }

        it 'returns nil' 

      end

      context 'when the commit ID is invalid' do
        let(:commit_id) { '4b4918a572fa86f9771e5ba40fbd48e' }

        it 'raises ArgumentError' 

      end
    end

    describe '.extract_signature_lazily' do
      describe 'loading signatures in batch once' do
        it 'fetches signatures in batch once' 

      end

      subject { described_class.extract_signature_lazily(repository, commit_id).itself }

      it_behaves_like 'extracting commit signature'
    end

    describe '.extract_signature' do
      subject { described_class.extract_signature(repository, commit_id) }

      it_behaves_like 'extracting commit signature'
    end
  end

  skip 'move this test to gitaly-ruby' do
    describe '#init_from_rugged' do
      let(:gitlab_commit) { described_class.new(repository, rugged_commit) }
      subject { gitlab_commit }

      describe '#id' do
        subject { super().id }
        it { is_expected.to eq(SeedRepo::Commit::ID) }
      end
    end
  end

  describe '#init_from_hash' do
    let(:commit) { described_class.new(repository, sample_commit_hash) }
    subject { commit }

    describe '#id' do
      subject { super().id }
      it { is_expected.to eq(sample_commit_hash[:id])}
    end

    describe '#message' do
      subject { super().message }
      it { is_expected.to eq(sample_commit_hash[:message])}
    end
  end

  shared_examples '#stats' do
    subject { commit.stats }

    describe '#additions' do
      subject { super().additions }
      it { is_expected.to eq(11) }
    end

    describe '#deletions' do
      subject { super().deletions }
      it { is_expected.to eq(6) }
    end

    describe '#total' do
      subject { super().total }
      it { is_expected.to eq(17) }
    end
  end

  describe '#stats with gitaly on' do
    it_should_behave_like '#stats'
  end

  describe '#stats with gitaly disabled', :skip_gitaly_mock do
    it_should_behave_like '#stats'
  end

  describe '#has_zero_stats?' do
    it { expect(commit.has_zero_stats?).to eq(false) }
  end

  describe '#to_hash' do
    let(:hash) { commit.to_hash }
    subject { hash }

    it { is_expected.to be_kind_of Hash }

    describe '#keys' do
      subject { super().keys.sort }
      it { is_expected.to match(sample_commit_hash.keys.sort) }
    end
  end

  describe '#diffs' do
    subject { commit.diffs }

    it { is_expected.to be_kind_of Gitlab::Git::DiffCollection }
    it { expect(subject.count).to eq(2) }
    it { expect(subject.first).to be_kind_of Gitlab::Git::Diff }
  end

  describe '#ref_names' do
    let(:commit) { described_class.find(repository, 'master') }
    subject { commit.ref_names(repository) }

    it 'has 2 element' 

    it { is_expected.to include("master") }
    it { is_expected.not_to include("feature") }
  end

  describe '.get_message' do
    let(:commit_ids) { %w[6d394385cf567f80a8fd85055db1ab4c5295806f cfe32cf61b73a0d5e9f13e774abde7ff789b1660] }

    subject do
      commit_ids.map { |id| described_class.get_message(repository, id) }
    end

    shared_examples 'getting commit messages' do
      it 'gets commit messages' 

    end

    context 'when Gitaly commit_messages feature is enabled' do
      it_behaves_like 'getting commit messages'

      it 'gets messages in one batch', :request_store do
        expect { subject.map(&:itself) }.to change { Gitlab::GitalyClient.get_request_count }.by(1)
      end
    end

    context 'when Gitaly commit_messages feature is disabled', :disable_gitaly do
      it_behaves_like 'getting commit messages'
    end
  end

  def sample_commit_hash
    {
      author_email: "dmitriy.zaporozhets@gmail.com",
      author_name: "Dmitriy Zaporozhets",
      authored_date: "2012-02-27 20:51:12 +0200",
      committed_date: "2012-02-27 20:51:12 +0200",
      committer_email: "dmitriy.zaporozhets@gmail.com",
      committer_name: "Dmitriy Zaporozhets",
      id: SeedRepo::Commit::ID,
      message: "tree css fixes",
      parent_ids: ["874797c3a73b60d2187ed6e2fcabd289ff75171e"]
    }
  end
end

