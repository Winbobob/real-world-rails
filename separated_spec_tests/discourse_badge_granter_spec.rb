require 'rails_helper'

describe BadgeGranter do

  let(:badge) { Fabricate(:badge) }
  let(:user) { Fabricate(:user) }

  describe 'revoke_titles' do
    it 'can correctly revoke titles' 

  end

  describe 'preview' do
    it 'can correctly preview' 

  end

  describe 'backfill' do

    it 'has no broken badge queries' 


    it 'can backfill the welcome badge' 


    it 'should grant missing badges' 


    it 'should grant badges in the user locale' 

  end

  describe 'grant' do

    it 'allows overriding of granted_at does not notify old bronze' 


    it "doesn't grant disabled badges" 


    it 'grants multiple badges' 


    it 'sets granted_at' 


    it 'sets granted_by if the option is present' 


    it 'defaults granted_by to the system user' 


    it 'does not allow a regular user to grant badges' 


    it 'increments grant_count on the badge and creates a notification' 


  end

  describe 'revoke' do

    let(:admin) { Fabricate(:admin) }
    let!(:user_badge) { BadgeGranter.grant(badge, user) }

    it 'revokes the badge and does necessary cleanup' 


  end

  context "update_badges" do
    let(:user) { Fabricate(:user) }
    let(:liker) { Fabricate(:user) }

    before do
      BadgeGranter.clear_queue!
    end

    it "grants autobiographer" 


    it "grants read guidlines" 


    it "grants first link" 


    it "grants first edit" 


    it "grants and revokes trust level badges" 


    it "grants system like badges" 

  end

end

