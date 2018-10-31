require 'rails_helper'

describe SurveySender do
  describe ".send_all_surveys" do
    def create_event_for_date(d)
      create(:event).tap do |e|
        e.event_sessions.first.update_attributes(starts_at: d, ends_at: d + 10.seconds)
      end
    end

    it "sends surveys for all past events" 

  end

  describe ".send_surveys" do
    let(:event) { create(:event, student_rsvp_limit: 1) }
    before do
      event_session = event.event_sessions.first

      create(:volunteer_rsvp, event: event, session_checkins: {event_session.id => true})

      create(:student_rsvp, event: event, session_checkins: {event_session.id => true})

      create(:volunteer_rsvp, event: event, session_checkins: {event_session.id => false})
    end

    it "sends survey emails to all the attendees who checked in" 


    it "does not send any surveys if the survey has already been sent" 


    it "updates survey_sent_at to the current time" 

  end
end

