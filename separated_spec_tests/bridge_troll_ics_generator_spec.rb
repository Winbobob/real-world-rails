require 'rails_helper'

describe IcsGenerator do
  describe '#event_session_ics' do
    let(:event_location) { create(:location, name: 'Office Labs') }
    let(:event) { create(:event, title: 'Test Event', location: event_location) }
    let(:event_session) { event.event_sessions.first }

    context 'when the session has no location set' do
      it 'generates a calendar event for the event location' 

    end

    context 'when the session has a location set' do
      let(:session_location) { create(:location) }
      before do
        event_session.update_attribute(:location, session_location)
      end

      it 'generates a calendar event for the session location' 

    end
  end
end

