require 'rails_helper'
require_dependency 'jobs/scheduled/grant_new_user_of_the_month_badges'

describe Jobs::GrantNewUserOfTheMonthBadges do

  let(:granter) { described_class.new }

  it "runs correctly" 


  it "does nothing if badges are disabled" 


  it "does nothing if the badge is disabled" 


  it "does nothing if it's been awarded recently" 


  describe '.scores' do

    it "doesn't award it to accounts over a month old" 


    it "doesn't score users who haven't posted in two topics" 


    it "doesn't count private topics" 


    it "requires at least two likes to be considered" 


    it "returns scores for accounts created within the last month" 


    it "likes from older accounts are scored higher" 


    it "is limited to two accounts" 


  end

end

