require "spec_helper"

describe Gitlab::Git::Diff, :seed_helper do
  let(:repository) { Gitlab::Git::Repository.new('default', TEST_REPO_PATH, '') }
  let(:gitaly_diff) do
    Gitlab::GitalyClient::Diff.new(
      from_path: '.gitmodules',
      to_path: '.gitmodules',
      old_mode: 0100644,
      new_mode: 0100644,
      from_id: '0792c58905eff3432b721f8c4a64363d8e28d9ae',
      to_id: 'efd587ccb47caf5f31fc954edb21f0a713d9ecc3',
      overflow_marker: false,
      collapsed: false,
      too_large: false,
      patch: "@@ -4,3 +4,6 @@\n [submodule \"gitlab-shell\"]\n \tpath = gitlab-shell\n \turl = https://github.com/gitlabhq/gitlab-shell.git\n+[submodule \"gitlab-grack\"]\n+\tpath = gitlab-grack\n+\turl = https://gitlab.com/gitlab-org/gitlab-grack.git\n"
    )
  end

  before do
    @raw_diff_hash = {
      diff: <<EOT.gsub(/^ {8}/, "").sub(/\n$/, ""),
        @@ -4,3 +4,6 @@
         [submodule "gitlab-shell"]
         \tpath = gitlab-shell
         \turl = https://github.com/gitlabhq/gitlab-shell.git
        +[submodule "gitlab-grack"]
        +	path = gitlab-grack
        +	url = https://gitlab.com/gitlab-org/gitlab-grack.git

EOT
      new_path: ".gitmodules",
      old_path: ".gitmodules",
      a_mode: '100644',
      b_mode: '100644',
      new_file: false,
      renamed_file: false,
      deleted_file: false,
      too_large: false
    }
  end

  describe '.new' do
    context 'using a Hash' do
      context 'with a small diff' do
        let(:diff) { described_class.new(@raw_diff_hash) }

        it 'initializes the diff' 


        it 'does not prune the diff' 

      end

      context 'using a diff that is too large' do
        it 'prunes the diff' 

      end
    end

    context 'using a GitalyClient::Diff' do
      let(:gitaly_diff) do
        Gitlab::GitalyClient::Diff.new(
          to_path: ".gitmodules",
          from_path: ".gitmodules",
          old_mode: 0100644,
          new_mode: 0100644,
          from_id: '357406f3075a57708d0163752905cc1576fceacc',
          to_id: '8e5177d718c561d36efde08bad36b43687ee6bf0',
          patch: raw_patch
        )
      end
      let(:diff) { described_class.new(gitaly_diff) }

      context 'with a small diff' do
        let(:raw_patch) { @raw_diff_hash[:diff] }

        it 'initializes the diff' 


        it 'does not prune the diff' 

      end

      context 'using a diff that is too large' do
        let(:raw_patch) { 'a' * 204800 }

        it 'prunes the diff' 

      end

      context 'using a collapsable diff that is too large' do
        let(:raw_patch) { 'a' * 204800 }

        it 'prunes the diff as a large diff instead of as a collapsed diff' 

      end

      context 'when the patch passed is not UTF-8-encoded' do
        let(:raw_patch) { @raw_diff_hash[:diff].encode(Encoding::ASCII_8BIT) }

        it 'encodes diff patch to UTF-8' 

      end
    end
  end

  describe 'straight diffs' do
    let(:options) { { straight: true } }
    let(:diffs) { described_class.between(repository, 'feature', 'master', options) }

    it 'has the correct size' 


    context 'diff' do
      it 'is an instance of Diff' 


      it 'has the correct new_path' 


      it 'has the correct diff' 

    end
  end

  describe '.between' do
    let(:diffs) { described_class.between(repository, 'feature', 'master') }
    subject { diffs }

    it { is_expected.to be_kind_of Gitlab::Git::DiffCollection }

    describe '#size' do
      subject { super().size }

      it { is_expected.to eq(1) }
    end

    context 'diff' do
      subject { diffs.first }

      it { is_expected.to be_kind_of described_class }

      describe '#new_path' do
        subject { super().new_path }

        it { is_expected.to eq('files/ruby/feature.rb') }
      end

      describe '#diff' do
        subject { super().diff }

        it { is_expected.to include '+class Feature' }
      end
    end
  end

  describe '.filter_diff_options' do
    let(:options) { { max_files: 100, invalid_opt: true } }

    context "without default options" do
      let(:filtered_options) { described_class.filter_diff_options(options) }

      it "should filter invalid options" 

    end

    context "with default options" do
      let(:filtered_options) do
        default_options = { max_files: 5, bad_opt: 1, ignore_whitespace_change: true }
        described_class.filter_diff_options(options, default_options)
      end

      it "should filter invalid options" 


      it "should merge with default options" 


      it "should override default options" 

    end
  end

  describe '#json_safe_diff' do
    let(:project) { create(:project, :repository) }

    it 'fake binary message when it detects binary' 


    it 'leave non-binary diffs as-is' 

  end

  describe '#submodule?' do
    let(:gitaly_submodule_diff) do
      Gitlab::GitalyClient::Diff.new(
        from_path: 'gitlab-grack',
        to_path: 'gitlab-grack',
        old_mode: 0,
        new_mode: 57344,
        from_id: '0000000000000000000000000000000000000000',
        to_id: '645f6c4c82fd3f5e06f67134450a570b795e55a6',
        overflow_marker: false,
        collapsed: false,
        too_large: false,
        patch: "@@ -0,0 +1 @@\n+Subproject commit 645f6c4c82fd3f5e06f67134450a570b795e55a6\n"
      )
    end

    it { expect(described_class.new(gitaly_diff).submodule?).to eq(false) }
    it { expect(described_class.new(gitaly_submodule_diff).submodule?).to eq(true) }
  end

  describe '#line_count' do
    it 'returns the correct number of lines' 

  end

  describe '#too_large?' do
    it 'returns true for a diff that is too large' 


    it 'returns false for a diff that is small enough' 


    it 'returns true for a diff that was explicitly marked as being too large' 

  end

  describe '#collapsed?' do
    it 'returns false by default even on quite big diff' 


    it 'returns false by default for a diff that is small enough' 


    it 'returns true for a diff that was explicitly marked as being collapsed' 

  end

  describe '#collapsed?' do
    it 'returns true for a diff that is quite large' 


    it 'returns false for a diff that is small enough' 

  end

  describe '#collapse!' do
    it 'prunes the diff' 

  end
end

