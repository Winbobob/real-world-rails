require 'rails_helper'

describe "arranging sections for an event", js: true do
  before do
    @event = create(:event, course: create(:course, levels_count: 5))
    create(:event_session, event: @event)
    expect(@event.reload.event_sessions.count).to eq(2)

    @session1, @session2 = @event.event_sessions.to_a

    @session1_rsvp = create(:student_rsvp, event: @event, class_level: 1, session_checkins: {@session1.id => true, @session2.id => false})

    @session2_rsvp = create(:student_rsvp, event: @event, class_level: 2, session_checkins: {@session1.id => false, @session2.id => true})

    @both_rsvp = create(:student_rsvp, event: @event, class_level: 3, session_checkins: {@session1.id => true, @session2.id => true})

    @neither_attendee = create(:student_rsvp, event: @event, class_level: 4, session_checkins: {@session1.id => false, @session2.id => false})

    @user_organizer = create(:user)
    @event.organizers << @user_organizer
    sign_in_as @user_organizer
  end

  it "groups the attendees by their chosen level" 

end

