require File.dirname(__FILE__) + '/../../spec_helper'

describe 'API:hierarchies' do
  before(:all) do
    load_foundation_cache
    @test_hierarchy = Hierarchy.gen(label: 'Some test hierarchy', browsable: 1)
    @test_hierarchy_entry_published = HierarchyEntry.gen(hierarchy: @test_hierarchy, identifier: 'Animalia',
      parent_id: 0, published: 1, visibility_id: Visibility.visible.id, rank: Rank.kingdom)
  end

  # not logging API anymore!
  # it 'should create an API log including API key' do
    # user = User.gen(api_key: User.generate_key)
    # check_api_key("/api/hierarchies/#{@test_hierarchy.id}?key=#{user.api_key}", user)
  # end

  it 'hierarchies should list the hierarchy roots' 

end

