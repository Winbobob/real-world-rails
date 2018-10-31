require 'spec_helper'

describe Users::LastPushEventService do
  let(:user) { build(:user, id: 1) }
  let(:project) { build(:project, id: 2) }
  let(:event) { build(:push_event, id: 3, author: user, project: project) }
  let(:service) { described_class.new(user) }

  describe '#cache_last_push_event' do
    it "caches the event for the event's project and current user" 


    it 'caches the event for the origin project when pushing to a fork' 

  end

  describe '#last_event_for_user' do
    it 'returns the last push event for the current user' 


    it 'returns nil when no push event could be found' 

  end

  describe '#last_event_for_project' do
    it 'returns the last push event for the given project' 


    it 'returns nil when no push event could be found' 

  end

  describe '#find_cached_event', :use_clean_rails_memory_store_caching do
    context 'with a non-existing cache key' do
      it 'returns nil' 

    end

    context 'with an existing cache key' do
      before do
        service.cache_last_push_event(event)
      end

      it 'returns a PushEvent when no merge requests exist for the event' 


      it 'removes the cache key when no event could be found and returns nil' 

    end
  end
end

