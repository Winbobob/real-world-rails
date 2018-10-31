require 'rails_helper'

describe UserBadgesController do
  let(:user) { Fabricate(:user) }
  let(:badge) { Fabricate(:badge) }

  context 'index' do
    let(:badge) { Fabricate(:badge, target_posts: true, show_posts: false) }
    it 'does not leak private info' 


    it "fails when badges are disabled" 

  end

  context 'index' do
    let!(:user_badge) { UserBadge.create(badge: badge, user: user, granted_by: Discourse.system_user, granted_at: Time.now) }

    it 'requires username or badge_id to be specified' 


    it 'returns user_badges for a user' 


    it 'returns user_badges for a badge' 


    it 'includes counts when passed the aggregate argument' 

  end

  context 'create' do
    it 'requires username to be specified' 


    it 'does not allow regular users to grant badges' 


    it 'grants badges from staff' 


    it 'does not grant badges from regular api calls' 


    it 'grants badges from master api calls' 


    it 'will trigger :user_badge_granted' 

  end

  context 'destroy' do
    let!(:user_badge) { UserBadge.create(badge: badge, user: user, granted_by: Discourse.system_user, granted_at: Time.now) }

    it 'checks that the user is authorized to revoke a badge' 


    it 'revokes the badge' 


    it 'will trigger :user_badge_removed' 

  end
end

