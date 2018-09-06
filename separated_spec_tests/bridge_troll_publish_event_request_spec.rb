require 'rails_helper'

describe "the approval page" do
  before do
    @event = create(:event, title: "Exciting event", current_state: :pending_approval)
    @event.organizers << create(:user)

    @spammer = create(:user)
    @spam_event = create(:event, title: "Spammy Event", current_state: :pending_approval)
    @spam_event.organizers << @spammer

    @admin = create(:user, admin: true)
    sign_in_as(@admin)
  end

  describe "publishing an event" do
    it 'removes it from the unpublished events page' 

  end

  describe "flagging an event as spam" do
    it 'removes it from the unpublished events page, marks as spam, and marks the organizer as a spammer' 

  end
end

