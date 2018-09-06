require "spec_helper"

describe 'Community Activity (loaded via scenario)' do

  before(:all) do
    truncate_all_tables
    load_scenario_with_caching(:community_activity)
    @activity = EOL::TestInfo.load('community_activity')
  end

  it 'should have 10 users and 10 communities' 


  it 'should have 10 owners, one for each community' 


  it 'should have a busy user who joins all of the communities' 


  it 'should have a fickle user who is NOT in any of the communities' 


end

