require 'rails_helper'

describe "the event listing page" do
  it "show blanks Location if no location_id exists" 


  it "shows both locations for multiple-location events" 


  it "shows formatted dates" 


  describe 'when an upcoming event has many sessions' do
    it "shows sessions in date order" 

  end

  describe "the past events table", js: true do
    before do
      event = create(:event, title: 'InternalPastBridge', time_zone: 'Alaska')
      event.update_attributes(starts_at: 5.days.ago, ends_at: 4.days.ago)
      create(:external_event, name: 'ExternalPastBridge', starts_at: 3.days.ago, ends_at: 2.days.ago)
    end

    it 'renders a combination of internal and external events' 

  end

  it "does not show event organizers column" 


  context "chapter show page" do
    it 'shows organizers for each event' 

  end

  context 'as a non-logged in user', js: true do
    before do
      @user = create(:user)
    end

    it "redirects to event detail page when non-logged in user volunteers" 

  end

  context 'as a logged in user' do
    before(:each) do
      @user = create(:user)
      sign_in_as(@user)
    end

    context 'when organizing an event', js: true do
      let!(:chapter) { create(:chapter) }

      before do
        create(:course)
        create(:event, course: create(:course, name: "FRONTEND",
                                               title: "Front End",
                                               description: "This is a Front End workshop. The focus will be on designing web apps with HTML and CSS."))
        visit events_path
        click_link "Organize Event"
        expand_all_event_sections
      end

      it "can create a new event" 


      it "sanitizes user input" 


      it "can create a non-teaching event" 


      it "displays frontend content for frontend events" 

    end

    context 'given an event' do
      before(:each) do
        @event = create(:event)
        @session1 = @event.event_sessions.first
        @session1.update_attributes!(
          name: 'Installfest',
          starts_at: 10.days.from_now,
          ends_at: 11.days.from_now
        )
        @session2 = create(
          :event_session,
          event: @event,
          name: 'Curriculum',
          starts_at: 12.days.from_now,
          ends_at: 13.days.from_now
        )
        @event.reload
      end

      context 'when volunteering' do
        before do
          visit events_path
          click_link("Volunteer")
          fill_in "rsvp_subject_experience", with: "I am cool and I use a Mac (but those two things are not related)"
        end

        it "allows registration as a teacher" 


        it "allows registration without course level for non-teaching roles" 

      end

      it "allows a student to register for an event" 


      context 'given a volunteered user' do
        before(:each) do
          @rsvp = create(:teacher_rsvp, event: @event, user: @user)
          visit events_path
        end

        it "allows user to cancel their event RSVP" 


        it "allows user to edit volunteer responsibilities" 

      end
    end
  end
end

