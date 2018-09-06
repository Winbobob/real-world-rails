require 'spec_helper'

describe Gitlab::GithubImport::LabelFinder, :clean_gitlab_redis_cache do
  let(:project) { create(:project) }
  let(:finder) { described_class.new(project) }
  let!(:bug) { create(:label, project: project, name: 'Bug') }
  let!(:feature) { create(:label, project: project, name: 'Feature') }

  describe '#id_for' do
    context 'with a cache in place' do
      before do
        finder.build_cache
      end

      it 'returns the ID of the given label' 


      it 'returns nil for an empty cache key' 


      it 'returns nil for a non existing label name' 

    end

    context 'without a cache in place' do
      it 'returns nil for a label' 

    end
  end

  describe '#build_cache' do
    it 'builds the cache of all project labels' 

  end

  describe '#cache_key_for' do
    it 'returns the cache key for a label name' 

  end
end

