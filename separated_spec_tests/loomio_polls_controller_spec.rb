require 'rails_helper'

describe API::PollsController do
  let(:group) { create :formal_group }
  let(:another_group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:another_discussion) { create :discussion, group: group }
  let(:non_group_discussion) { create :discussion }
  let(:user) { create :user }
  let(:another_user) { create :user }
  let!(:poll) { create :poll, title: "POLL!", discussion: discussion, author: user }
  let(:another_poll) { create :poll, title: "ANOTHER", discussion: another_discussion }
  let(:closed_poll) { create :poll, title: "CLOSED", author: user, closed_at: 1.day.ago }
  let(:non_group_poll) { create :poll }
  let(:poll_params) {{
    title: "hello",
    poll_type: "proposal",
    details: "is it me you're looking for?",
    discussion_id: discussion.id,
    poll_option_names: ["agree", "abstain", "disagree", "block"],
    closing_at: 3.days.from_now
  }}

  before { group.add_member! user }

  describe 'show' do
    it 'shows a poll' 


    it 'does not show a poll you do not have access to' 

  end

  describe 'index' do
    before { poll; another_poll; closed_poll }

    it 'shows polls in a discussion' 


    it 'does not allow user to see polls theyre not allowed to see' 

  end

  describe 'search' do
    let(:participated_poll) { create :poll }
    let!(:my_stance) { create :stance, poll: participated_poll, participant: user, poll_options: [participated_poll.poll_options.first] }
    let!(:authored_poll) { create :poll, author: user }
    let!(:group_poll) { create :poll, discussion: discussion }
    let!(:another_poll) { create :poll }

    describe 'search_results_count' do
      it 'returns a count of possible results' 

    end

    describe 'signed in' do
      before { sign_in user }

      it 'returns visible polls' 


      it 'filters by status' 


      it 'filters by group' 


      it 'filters by discussion' 


      it 'filters by participated' 


      it 'filters by authored' 


      it 'filters by search fragment' 

    end
  end

  describe 'create' do
    let(:identity) { create :slack_identity, user: user }
    let(:community) { create :slack_community, identity: identity }
    let(:another_identity) { create :slack_identity }
    let(:another_community) { create :slack_community, identity: another_identity }

    it 'creates a poll' 


    it 'can create a standalone poll' 


    it 'does not allow visitors to create polls' 


    it 'does not allow non-members to create polls' 


    it 'can store an event duration for meeting polls' 


    describe 'group.members_can_raise_motions false' do
      before do
        discussion.group.update(members_can_raise_motions: false)
        sign_in user
      end

      it 'admin of formal group can raise motions' 


      it 'admin of discussion guest group can raise motions' 


      it 'member of formal group cannot raise motions' 


      it 'member of discussion guest group cannot raise motions' 

    end

    describe 'group.members_can_raise motions true' do
      before do
        discussion.group.update(members_can_raise_motions: true)
        sign_in user
      end

      it 'member of formal group can raise motions' 


      it 'member of discussion guest group can raise motions' 

    end
  end

  describe 'update' do
    it 'updates a poll' 


    it 'cannot move a poll between discussions' 


    it 'does not allow visitors to update polls' 


    it 'does not allow members other than the author to update polls' 

  end

  describe 'add_options' do
    before { poll.update(voter_can_add_options: true) }

    it 'adds options to a poll' 


    it 'does not allow unauthorized users to add options' 


    it 'does nothing if no options passed' 


    it 'cannot add actions to a closed poll' 

  end

  describe 'close' do
    it 'closes a poll' 


    it 'does not close an already closed poll' 


    it 'does not allow visitors to close polls' 


    it 'does not allow members other than the author to close polls' 

  end

  describe 'reopen' do
    let(:poll_params) {{
      closing_at: 1.day.from_now
    }}
    let!(:did_not_vote) { PollDidNotVote.create(poll: poll, user: another_user) }
    before { poll.update(closed_at: 1.day.ago) }

    it 'can reopen a poll' 


    it 'cannot reopen an active poll' 


    it 'does not allow non-admins to reopen a poll' 


    it 'does not allow visitors to reopen polls' 

  end

  describe 'destroy' do
    it 'destroys a poll' 


    it 'allows group admins to destroy polls' 


    it 'does not allow an unauthed user to destroy a poll' 


  end

  describe 'toggle_subscription' do
    it 'creates an unsubscription if one does not exist' 


    it 'deletes an unsubscription if one does exist' 


    it 'does not allow visitors to have an unsubscription' 


    it 'does not allow users who cant see the poll to have unsubscriptions' 

  end
end

