require "spec_helper"

describe "Members controller (within a community)" do

  before(:all) do
    load_foundation_cache
    Capybara.reset_sessions!
    @community = Community.gen
    @manager = @community.add_member(User.gen)
    @manager.grant_manager
    @user = User.gen
    @member = @community.add_member(@user)
    @nonmember = User.gen
    visit logout_path
    visit community_members_path(@community)
    @community_nonmembers_page = page.body
    login_as @user
    visit community_member_path(@community, @member)
    @community_member_page = page.body
    login_as @manager.user
    visit community_member_path(@community, @member)
    @community_manager_page = page.body
  end

  it 'nonmembers should list members of a community' 


  #TODO
  it 'should be able to grant manager'
  it 'should be able to revoke manager'

  it 'members should have a link to the user\'s page' 


end

