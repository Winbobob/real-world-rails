require 'rails_helper'

describe API::StancesController do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:poll) { create :poll, discussion: discussion }
  let(:proposal) { create :poll_proposal, discussion: discussion }
  let(:poll_option) { create :poll_option, poll: poll }
  let(:old_stance) { create :stance, poll: poll, participant: user, poll_options: [poll_option] }
  let(:discussion) { create :discussion, group: group }
  let(:group) { create :formal_group }
  let(:stance_params) {{
    poll_id: poll.id,
    stance_choices_attributes: [{poll_option_id: poll_option.id}],
    reason: "here is my stance"
  }}
  let(:public_poll) { create :poll, discussion: nil, anyone_can_participate: true }
  let(:public_poll_option) { create :poll_option, poll: public_poll }
  let(:visitor_stance_params) {{
    poll_id: public_poll.id,
    stance_choices_attributes: [{poll_option_id: public_poll_option.id}],
    visitor_attributes: { name: "Johnny Doe", email: "john@doe.ninja" }
  }}

  describe 'index' do
    before { group.add_member! user }

    let(:recent_stance) { create :stance, poll: poll, created_at: 1.day.ago, choice: [low_priority_option.name] }
    let(:old_stance) { create :stance, poll: poll, created_at: 5.days.ago, choice: [low_priority_option.name] }
    let(:high_priority_stance) { create :stance, poll: poll, choice: [high_priority_option.name] }
    let(:low_priority_stance) { create :stance, poll: poll, choice: [low_priority_option.name] }
    let(:high_priority_option) { create(:poll_option, poll: poll, priority: 0) }
    let(:low_priority_option) { create(:poll_option, poll: poll, priority: 10) }

    it 'can order by recency asc' 


    it 'can order by recency desc' 


    it 'does not reveal participant for other peoples votes' 


    it 'can order by priority asc' 


    it 'can order by priority desc' 


    it 'does not allow unauthorized users to get stances' 

  end

  describe do
    let(:unverified_user)       { create :user, email: 'user@example.com', email_verified: false }
    let(:user)                  { create :user, email: 'user@example.com', email_verified: true }
    let(:stance)                { create :stance, participant: unverified_user }

    describe 'unverified' do
      it 'lists unconfirmed stances' 

    end

    describe 'verify' do
      it 'verifies unverified stances by verified email address' 


      it 'cannot verify stances by another email address' 


      it 'cannot verify stances already verified' 

    end

    describe 'destroy' do
      it 'destroys unverified stances' 


      it 'cannot destroy verified stances' 

    end
  end

  describe 'create' do

    let(:another_user) { create :user, email: 'another_user@example.com', email_verified: false }
    let(:membership) { create :membership, user: build(:user, name: "unverified", email: 'user@example.com', email_verified: false), group: poll.guest_group }
    let(:user)       { create :user, name: "unverified", email: 'user@example.com', email_verified: false }
    let(:poll)       { create :poll }
    let(:poll_option) { create :poll_option, poll: poll }
    let(:visitor_stance_params) {{
      poll_id: poll.id,
      stance_choices_attributes: [{poll_option_id: poll_option.id}],
      visitor_attributes: { name: "Johnny Doe, not logged in", email: "user@example.com" }
    }}

    # test logged out cannot create a stance
    # non member cannot create a stance
    # unverified user gets verification email on stance create
    # if polls is anonymous you still get your own stance back

    it 'returns 403 for logged out users' 


    describe "non member votes" do
      it "denies access" 

    end

    describe "unverified member votes" do
      it "creates stance and updates name and email" 

    end

    describe "verified user votes" do
      it "creates stance and updates name and email" 

    end

    it 'includes the participant of the stance for anonymous polls' 


    describe 'poll.group.members_can_vote false' do
      let(:user) { create(:user) }

      before do
        group = create(:formal_group, members_can_vote: false)
        poll.update(group: group, discussion: create(:discussion, group: group))
        sign_in user
      end

      it 'admin of formal group can vote' 


      it 'admin of discussion guest group can vote' 


      it 'admin of poll guest group can vote' 


      it 'member of formal group cannot vote' 


      it 'member of discussion guest group cannot vote' 


      it 'member of poll guest group can vote' 

    end

    describe 'poll.group.members_can_vote true' do
      let(:user) { create(:user) }
      before do
        group = create(:formal_group, members_can_vote: true)
        poll.update(group: group, discussion: create(:discussion, group: group))
        sign_in user
      end

      it 'member of formal group cannot vote' 


      it 'member of discussion guest group cannot vote' 


      it 'member of poll guest group can vote' 

    end

    describe 'poll.anyone_can_participate = true' do
      before do
        poll.update(anyone_can_participate: true)
        user
      end

      it 'logged in' 


      describe 'not logged in' do
        it 'user enters verified users email' 


        it 'user enters unverified users email' 


        it 'user enters unrecognised email' 

      end
    end
  end

  describe "create as logged out without token on public poll" do
    it 'creates a new stance' 


  end

  describe "create as logged in member without token" do
    before { group.add_member! user }

    it 'creates a new stance' 


    it 'overwrites existing stances' 


    it 'does not allow non members to create stances' 


    it 'does not allow creating an invalid stance' 

  end
end

