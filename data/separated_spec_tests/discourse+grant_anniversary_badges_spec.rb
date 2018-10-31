require 'rails_helper'
require_dependency 'jobs/scheduled/grant_anniversary_badges'

describe Jobs::GrantAnniversaryBadges do

  let(:granter) { described_class.new }

  it "doesn't award to a user who is less than a year old" 


  it "doesn't award to an inactive user" 


  it "doesn't award to a silenced user" 


  it "doesn't award when a post is deleted" 


  it "doesn't award when a post is hidden" 


  it "doesn't award to PMs" 


  it "doesn't award to a user without a post" 


  it "doesn't award when badges are disabled" 


  it "awards the badge to a user with a post active for a year" 


  context "repeated grants" do
    it "won't award twice in the same year" 


    it "will award again if a year has passed" 


    it "supports date ranges" 

  end

end

