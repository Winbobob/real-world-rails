require 'rails_helper'

describe Queries::ExploreGroups do
  let(:group)              { create :formal_group }
  let(:second_group)       { create :formal_group }
  let(:archived_group)     { create :formal_group, archived_at: 1.day.ago }

  before do
    group.update_attribute(:is_visible_to_public, true)
    second_group.update_attribute(:is_visible_to_public, true)
    archived_group.update_attribute(:is_visible_to_public, true)
    group.update_attribute(:memberships_count, 4)
    second_group.update_attribute(:memberships_count, 2)
    archived_group.update_attribute(:memberships_count, 4)
  end

  describe 'visible groups' do

    it 'shows groups on the explore page' 


    it 'only shows groups that are visible to public' 


    it 'only shows parent groups' 

  end

  describe '#search_for' do

    it 'returns groups with names that match the query' 


    it 'returns groups with descriptions that match the query' 


    it 'does not return groups with names or descriptions that do not match the query' 


    it 'returns all visible groups when query is not present' 

  end
end

