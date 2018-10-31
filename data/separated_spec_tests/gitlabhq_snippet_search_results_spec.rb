require 'spec_helper'

describe Gitlab::SnippetSearchResults do
  let!(:snippet) { create(:snippet, content: 'foo', file_name: 'foo') }

  let(:results) { described_class.new(Snippet.all, 'foo') }

  describe '#snippet_titles_count' do
    it 'returns the amount of matched snippet titles' 

  end

  describe '#snippet_blobs_count' do
    it 'returns the amount of matched snippet blobs' 

  end
end

