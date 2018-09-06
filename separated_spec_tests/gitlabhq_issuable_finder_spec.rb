require 'spec_helper'

describe Gitlab::GithubImport::IssuableFinder, :clean_gitlab_redis_cache do
  let(:project) { double(:project, id: 4) }
  let(:issue) do
    double(:issue, issuable_type: MergeRequest, iid: 1)
  end

  let(:finder) { described_class.new(project, issue) }

  describe '#database_id' do
    it 'returns nil when no cache is in place' 


    it 'returns the ID of an issuable when the cache is in place' 


    it 'raises TypeError when the object is not supported' 

  end

  describe '#cache_database_id' do
    it 'caches the ID of a database row' 

  end
end

