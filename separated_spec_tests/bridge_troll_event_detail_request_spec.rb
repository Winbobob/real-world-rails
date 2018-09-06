require 'rails_helper'

describe "the event detail page" do
  let(:rsvp_actions_selector) { '.rsvp-actions' }
  before do
    @event = create(:event, public_email: "public_email@example.org")
  end

  context "user is not logged in" do
    it "shows a list of volunteers for the event" 


    it "shows who is organizing the event" 


    it "does not display the Edit link, public email, volunteer or student details" 


    it "shows both locations for multiple-location events" 


    describe "course section" do
      let(:chosen_course_text) { "The focus will be on " }

      context "when a course is chosen" do
        it "displays a course and has a link to get the course level descriptions" 

      end

      context "when a course is not chosen" do
        before do
          @event.update_attributes(course_id: nil)
        end

        it "does not display a course" 

      end
    end

    describe 'RSVPing', js: true do
      it 'shows links to RSVP and allows the user to sign in through a modal after clicking them' 


      it 'redirects the user back to the event show page if they sign up using the modal' 

    end
  end

  context "user is logged in but is not an organizer for the event" do
    let(:attend_as_student_text) { "Attend as a student" }
    let(:join_student_waitlist_text) { "Join the student waitlist" }
    let(:attend_as_volunteer_text) { "Volunteer" }
    let(:join_volunteer_waitlist_text){ "Join the volunteer waitlist" }
    before do
      @user = create(:user)
      sign_in_as(@user)
    end

    it "displays the event public email but not the Edit link" 


    context "when user has not rsvp'd to event" do
      it "allows user to rsvp as a volunteer or student" 


      context "when the event is full" do
        before(:each) do
          allow_any_instance_of(Event).to receive(:students_at_limit?).and_return(true)
          allow_any_instance_of(Event).to receive(:volunteers_at_limit?).and_return(true)
        end

        it "allows the user to join the student waitlist" 


        it "allows the user to join the volunteer waitlist" 

      end
    end

    context "when a volunteer has rsvp'd to event" do
      before(:each) do
        create(:rsvp, event: @event, user: @user)
        visit event_path(@event)
      end

      it "allows user to see volunteer details and lets them cancel their RSVP" 

    end

    context "when a student has rsvp'd to an event" do
      before(:each) do
        create(:student_rsvp, event: @event, user: @user)
        visit event_path(@event)
      end

      it "allows user to see student details and lets them cancel their RSVP" 

    end
  end

  context "user is logged in and is an organizer of the event" do
    before do
      user = create(:user)
      @event.organizers << user
      sign_in_as(user)
    end

    it "lets the user edit the event" 


    context 'when an event has some sessions with no RSVPs' do
      before do
        create(:event_session, event: @event)
      end

      it "can remove those sessions", js: true do
        expect(@event.event_sessions.count).to eq(2)

        visit edit_event_path(@event)

        expect(page).to have_css('.remove-session')
        page.all('.remove-session').last.click

        expect(page).to have_css('.event-sessions .fields', count: 1)

        expect(@event.event_sessions.count).to eq(1)
      end
    end
  end

  context "historical (meetup) events" do
    before do
      imported_event_data = {
        type: 'meetup',
        student_event: {
          id: 901,
          url: 'http://example.com/901'
        }, volunteer_event: {
          id: 902,
          url: 'http://example.com/901'
        }
      }
      @event.update_attributes(student_rsvp_limit: nil, imported_event_data: imported_event_data)
    end

    it 'does not render rsvp actions' 

  end

  context "past events" do
    before do
      @event.update_attributes(ends_at: 1.day.ago)
    end

    it 'does not render rsvp actions' 

  end
end

