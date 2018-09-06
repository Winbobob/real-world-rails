# coding: utf-8
require 'spec_helper'

describe Gitlab::Git do
  let(:committer_email) { 'user@example.org' }
  let(:committer_name) { 'John Doe' }

  describe 'committer_hash' do
    it "returns a hash containing the given email and name" 


    context 'when email is nil' do
      it "returns nil" 

    end

    context 'when name is nil' do
      it "returns nil" 

    end
  end

  describe '.ref_name' do
    it 'ensure ref is a valid UTF-8 string' 

  end

  describe '.shas_eql?' do
    using RSpec::Parameterized::TableSyntax

    where(:sha1, :sha2, :result) do
      sha           = RepoHelpers.sample_commit.id
      short_sha     = sha[0, Gitlab::Git::Commit::MIN_SHA_LENGTH]
      too_short_sha = sha[0, Gitlab::Git::Commit::MIN_SHA_LENGTH - 1]

      [
        [sha, sha,           true],
        [sha, short_sha,     true],
        [sha, sha.reverse,   false],
        [sha, too_short_sha, false],
        [sha, nil,           false]
      ]
    end

    with_them do
      it { expect(described_class.shas_eql?(sha1, sha2)).to eq(result) }
      it 'is commutative' 

    end
  end
end

