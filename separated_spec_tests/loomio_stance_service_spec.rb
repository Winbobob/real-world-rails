require 'rails_helper'

describe StanceService do
  let(:agree) { create :poll_option, poll: poll, name: "agree" }
  let(:disagree) { create :poll_option, poll: poll, name: "disagree" }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:poll) { create :poll, discussion: discussion }
  let(:proposal) { create :poll_proposal, discussion: discussion }
  let(:public_poll) { create :poll, anyone_can_participate: true }
  let(:public_stance) { build :stance, poll: public_poll, stance_choices: [agree_choice], participant: nil }
  let(:user) { create :user }
  let(:another_group_member) { create :user }
  let(:another_user) { create :user }
  let(:stance) { create :stance, poll: poll, stance_choices: [agree_choice], participant: user, reason: "Old one" }
  let(:another_stance) { create :stance, poll: poll, stance_choices: [disagree_choice], participant: another_group_member }
  let(:stance_created) { build :stance, poll: poll, stance_choices: [agree_choice], participant: nil }
  let(:agree_choice) { build(:stance_choice, poll_option: agree) }
  let(:disagree_choice) { build(:stance_choice, poll_option: disagree) }
  let(:poll_created_event) { PollService.create(poll: poll, actor: user) }

  before do
    discussion.created_event
    group.add_member! user
    group.add_member! another_group_member
  end

  describe 'create' do
    it 'creates a new stance' 


    it 'does not create an invalid stance' 


    it 'updates existing stances for that user to no longer be latest' 


    it 'sets event parent to the poll created event' 


    it 'does not create a stance for a logged out user' 


    it 'does not allow visitors to create unauthorized stances' 


    it 'does not allow an unauthorized member to create a stance' 


    it 'updates stance data on the poll' 


    it 'does not include old stance data on the poll' 


    describe 'notify_on_participate' do
      it 'emails the poll author when notify_on_participate is true' 


      it 'notifies the poll author when notify_on_participate is true' 


      it 'does not email the poll author when notify_on_participate is false' 


      it 'does not notify the poll author when notify_on_participate is false' 

    end
  end
end

