require 'rails_helper'

RSpec.describe EventEmailPresenter do
  subject(:presenter) { EventEmailPresenter.new(event_email) }
  let(:event_email) { FactoryBot.create(:event_email, event: event) }

  let(:event) { FactoryBot.create(:event) }
  let!(:volunteer_rsvp) { FactoryBot.create(:volunteer_rsvp, event: event) }
  let!(:student_accepted_rsvp) { FactoryBot.create(:student_rsvp, event: event) }
  let!(:student_waitlisted_rsvp) { FactoryBot.create(:student_rsvp, event: event, waitlist_position: 1) }

  describe '#rsvps' do
    it 'presents the rsvps for the event' 

  end

  describe '#volunteers_rsvps' do
    it 'presents the rsvps for the event volunteers' 

  end

  describe '#students_accepted_rsvps' do
    it 'presents the rsvps for the event students who were accepted' 

  end

  describe '#students_waitlisted_rsvps' do
    it 'presents the rsvps for the event students who were waitlisted' 

  end
end

