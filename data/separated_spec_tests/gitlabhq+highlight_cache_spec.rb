# frozen_string_literal: true

require 'spec_helper'

describe Gitlab::Diff::HighlightCache do
  let(:merge_request) { create(:merge_request_with_diffs) }

  subject(:cache) { described_class.new(merge_request.diffs, backend: backend) }

  describe '#decorate' do
    let(:backend) { double('backend').as_null_object }

    # Manually creates a Diff::File object to avoid triggering the cache on
    # the FileCollection::MergeRequestDiff
    let(:diff_file) do
      diffs = merge_request.diffs
      raw_diff = diffs.diffable.raw_diffs(diffs.diff_options.merge(paths: ['CHANGELOG'])).first
      Gitlab::Diff::File.new(raw_diff,
                             repository: diffs.project.repository,
                             diff_refs: diffs.diff_refs,
                             fallback_diff_refs: diffs.fallback_diff_refs)
    end

    it 'does not calculate highlighting when reading from cache' 


    it 'assigns highlighted diff lines to the DiffFile' 


    it 'submits a single reading from the cache' 

  end

  describe '#write_if_empty' do
    let(:backend) { double('backend', read: {}).as_null_object }

    it 'submits a single writing to the cache' 

  end

  describe '#clear' do
    let(:backend) { double('backend').as_null_object }

    it 'clears cache' 

  end
end

