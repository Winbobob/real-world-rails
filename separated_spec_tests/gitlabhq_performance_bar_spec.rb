require 'spec_helper'

describe Gitlab::PerformanceBar do
  shared_examples 'allowed user IDs are cached' do
    before do
      # Warm the Redis cache
      described_class.enabled?(user)
    end

    it 'caches the allowed user IDs in cache', :use_clean_rails_memory_store_caching do
      expect do
        expect(described_class.enabled?(user)).to be_truthy
      end.not_to exceed_query_limit(0)
    end
  end

  describe '.enabled?' do
    let(:user) { create(:user) }

    before do
      stub_application_setting(performance_bar_allowed_group_id: -1)
    end

    it 'returns false when given user is nil' 


    it 'returns true when given user is an admin' 


    it 'returns false when allowed_group_id is nil' 


    context 'when allowed group ID does not exist' do
      it 'returns false' 

    end

    context 'when allowed group exists' do
      let!(:my_group) { create(:group, path: 'my-group') }

      before do
        stub_application_setting(performance_bar_allowed_group_id: my_group.id)
      end

      context 'when user is not a member of the allowed group' do
        it 'returns false' 


        it_behaves_like 'allowed user IDs are cached'
      end

      context 'when user is a member of the allowed group' do
        before do
          my_group.add_developer(user)
        end

        it 'returns true' 


        it_behaves_like 'allowed user IDs are cached'
      end
    end

    context 'when allowed group is nested', :nested_groups do
      let!(:nested_my_group) { create(:group, parent: create(:group, path: 'my-org'), path: 'my-group') }

      before do
        create(:group, path: 'my-group')
        nested_my_group.add_developer(user)
        stub_application_setting(performance_bar_allowed_group_id: nested_my_group.id)
      end

      it 'returns the nested group' 

    end

    context 'when a nested group has the same path', :nested_groups do
      before do
        create(:group, :nested, path: 'my-group').add_developer(user)
      end

      it 'returns false' 

    end
  end
end

