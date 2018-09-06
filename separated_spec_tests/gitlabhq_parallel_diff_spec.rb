require 'spec_helper'

describe Gitlab::Diff::ParallelDiff do
  include RepoHelpers

  let(:project) { create(:project, :repository) }
  let(:repository) { project.repository }
  let(:commit) { project.commit(sample_commit.id) }
  let(:diffs) { commit.raw_diffs }
  let(:diff) { diffs.first }
  let(:diff_file) { Gitlab::Diff::File.new(diff, diff_refs: commit.diff_refs, repository: repository) }
  subject { described_class.new(diff_file) }

  describe '#parallelize' do
    it 'returns an array of arrays containing the parsed diff' 

  end
end

