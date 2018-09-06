require 'rails_helper'

describe API::OutcomesController do
  let(:user) { create :user }
  let(:another_user) { create :user }
  let(:outcome) { create :outcome, poll: poll, author: user }
  let(:poll) { create :poll, discussion: discussion, closed_at: 1.day.ago, author: user }
  let(:meeting_poll) { create :poll_meeting, discussion: discussion, closed_at: 1.day.ago, author: user }
  let(:another_poll) { create :poll, discussion: discussion, closed_at: 1.day.ago, author: user }
  let(:discussion) { create :discussion, group: group }
  let(:group) { create :formal_group }
  let(:outcome_params) {{ poll_id: poll.id, statement: "We should do this", custom_fields: {} }}
  let(:meeting_params) { outcome_params.merge(
    poll_id: meeting_poll.id,
    poll_option_id: meeting_poll.poll_option_ids.first,
    custom_fields: { event_description: "Eat those krabs", event_location: "The Krusty Krab" })
  }

  before { group.add_member! user }

  describe 'create' do
    it 'creates a new outcome' 


    it 'does not allow creating an invalid outcome' 


    it 'can associate a poll option with the outcome' 


    it 'validates the poll option id' 


    it 'does not allow visitors to create outcomes' 


    it 'does not allow non members to create outcomes' 


    it 'does not allow outcomes on open polls' 


    it 'can store a calendar invite for date polls' 

  end

  describe 'update' do
    it 'creates a new outcome in place of an existing one' 


    it 'does not allow updating to an invalid outcome' 


    it 'does not allow outcomes to switch polls' 


    it 'does not allow visitors to update outcomes' 


    it 'does not allow non members to update outcomes' 


    it 'does not allow outcomes to be updated on open polls' 

  end
end

