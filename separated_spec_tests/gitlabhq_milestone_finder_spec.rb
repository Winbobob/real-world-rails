require 'spec_helper'

describe Gitlab::GithubImport::MilestoneFinder, :clean_gitlab_redis_cache do
  let!(:project) { create(:project) }
  let!(:milestone) { create(:milestone, project: project) }
  let(:finder) { described_class.new(project) }

  describe '#id_for' do
    let(:issuable) { double(:issuable, milestone_number: milestone.iid) }

    context 'with a cache in place' do
      before do
        finder.build_cache
      end

      it 'returns the milestone ID of the given issuable' 


      it 'returns nil for an empty cache key' 


      it 'returns nil for an issuable with a non-existing milestone' 

    end

    context 'without a cache in place' do
      it 'returns nil' 

    end
  end

  describe '#build_cache' do
    it 'builds the cache of all project milestones' 

  end

  describe '#cache_key_for' do
    it 'returns the cache key for an IID' 

  end
end

