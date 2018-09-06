require 'rails_helper'

describe PollService do
  let(:poll_created) { build :poll, discussion: discussion }
  let(:public_poll) { build :poll }
  let(:private_poll) { build :poll }
  let(:poll) { create :poll, discussion: discussion }
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:group) { create :formal_group }
  let(:another_group) { create :formal_group }

  let(:discussion) { create :discussion, group: group }
  let(:stance) { create :stance, poll: poll_created, choice: poll_created.poll_options.first.name }
  let(:identity) { create :slack_identity }

  before { group.add_member!(user) }

  describe '#create' do
    it 'creates a new poll' 


    it 'populates removing custom poll actions' 


    it 'does not allow adding custom proposal actions' 


    it 'does not create an invalid poll' 


    it 'does not allow logged out users to create polls' 


    it 'does not allow users to create polls they are not allowed to' 


    it 'does not email people' 


    it 'notifies new mentions' 


  end

  describe '#update' do
    before { PollService.create(poll: poll_created, actor: user) }

    it 'updates an existing poll' 


    it 'does not allow randos to edit proposals' 


    it 'does not save an invalid poll' 


    it 'doesnt email people' 


    it 'creates a new poll edited event for poll option changes' 


    it 'creates a new poll edited event for major changes' 


    it 'does not create a new poll edited event for minor changes' 

  end

  describe 'add_options' do
    before { poll.update(voter_can_add_options: true) }

    it 'adds new poll options' 


    it 'does not update when poll does not accept new options' 


    it 'does not update when no new options are passed' 


    it 'does not update for unauthorized user' 

  end

  describe 'close' do
    it 'closes a poll' 


    it 'reveals voters if option is set' 


    it 'does not reveal voters if option is unset' 


    it 'disallows the creation of new stances' 


    it 'creates poll_did_not_votes for each member that did not vote' 

  end

  describe 'expire_lapsed_polls' do
    it 'expires a lapsed poll' 


    it 'does not expire active poll' 


    it 'does not touch closed polls' 

  end

  describe '#toggle_subscription' do
    it 'toggles a subscription on' 


    it 'toggles a subscription off' 


    it 'does nothing if the user doesnt have access' 

  end

  describe '#cleanup_examples' do
    it 'removes example polls' 


    it 'does not remove recent example polls' 


    it 'does not remove non-example polls' 

  end
end

