
require 'rails_helper'

describe PollsController do
  let(:user) { create :user }
  let(:group) { create :formal_group, is_visible_to_public: true }
  let(:discussion) { create :discussion, private: false, group: group }
  let(:poll) { create :poll, author: user }
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:identity) { create :facebook_identity, user: user }
  let(:community) { create :facebook_community, identity: identity, poll_id: poll.id, identifier: "fb_one" }
  let(:another_community) { create :facebook_community, identifier: "fb_two" }
  let(:another_poll) { create :poll }
  let(:closed_poll) { create :poll, author: user, closed_at: 1.day.ago }
  let(:received_email) { create :received_email }

  describe 'show' do
    it 'sets metadata for public polls' 


    it 'does not set metadata for private polls' 


    describe "logged out with pending membership" do
      let(:user) { create :user, email_verified: false }
      let(:membership) { create :membership, group: poll.guest_group, user: user }

      it "logs you in as unverified user and redeems membership" 

    end

    describe "logged in with pending membership" do
      let(:unverified_user) { create :user, email_verified: false }
      let(:verified_user) { create :user }
      let(:membership) { create :membership, group: poll.guest_group, user: unverified_user }

      it "logs you in as unverified user and redeems membership" 

    end
  end


  describe 'export' do
    it 'displays an html export' 


    it 'displays a csv export' 


    it 'does not show export to non-coordinators' 

  end

  describe 'unsubscribe' do
    it 'unsubscribes from a poll' 


    it 'does not remove unsubscriptions' 


    it 'can unsubscribe via unsubscribe token' 

  end
end

