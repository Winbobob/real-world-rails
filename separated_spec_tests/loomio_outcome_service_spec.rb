require 'rails_helper'

describe OutcomeService do
  let(:user) { create :user }
  let(:group) { create :formal_group }
  let(:discussion) { create :discussion, group: group }
  let(:poll) { create :poll, discussion: discussion, author: user, closed_at: 1.day.ago }
  let(:outcome) { create :outcome, poll: poll, author: user }
  let(:new_outcome) { build :outcome, poll: poll }
  before { group.add_member! user }

  describe 'create' do
    it 'creates a new outcome' 


    it 'does not create an invalid outcome' 


    it 'does not allow randos to create outcomes' 


    it 'does not allow creating outcomes on open proposals' 

  end
end

