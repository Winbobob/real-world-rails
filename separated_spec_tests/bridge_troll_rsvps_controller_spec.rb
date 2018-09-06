require 'rails_helper'

describe RsvpsController do
  def extract_rsvp_params(rsvp)
    accessible_attrs = RsvpPolicy.new(nil, Rsvp).permitted_attributes.map(&:to_s) + ['role_id']
    rsvp.attributes.select { |attr, val| accessible_attrs.include?(attr) }.symbolize_keys
  end

  before do
    @event = create(:event, title: 'The Best Railsbridge')
  end

  describe "#quick_destroy_confirm" do
    def make_request
      get :quick_destroy_confirm, params: { event_id: @event.id, rsvp_id: rsvp.id, token: rsvp.token }
    end

    let!(:rsvp) { create(:rsvp,
      event: @event,
      token: 'IamAtoken'
    )}

    it "assigns the rsvp" 

  end

  describe "when signed in" do
    before do
      @user = create(:user)
      sign_in @user
    end

    describe "when the event is in the past" do
      before do
        @event.update_attributes(ends_at: 1.day.ago)
      end

      it 'does not allow RSVPing' 

    end

    describe "when the event is closed" do
      before do
        @event.update_attributes(open: false)
      end

      it 'does not allow RSVPing' 

    end

    describe "#volunteer" do

      it "creates an RSVP for the volunteer role" 


      describe "when the user has previously volunteered" do
        before do
          frontend_event = create(:event, course: create(:course, name: "FRONTEND", title: "Front End"))
          @frontend_rsvp = create(:rsvp, {
            user: @user,
            event: frontend_event,
            subject_experience: 'I know about HTML',
            teaching_experience: 'I have taught many websites',
            job_details: 'Software Engineer'
          })

          rails_event = create(:event, course: @event.course)
          @rails_rsvp = create(:rsvp, {
            user: @user,
            event: rails_event,
            subject_experience: 'I know about Rails',
            teaching_experience: 'I have taught many rubies',
            job_details: 'Software Engineer'
          })
        end

        it "creates a new RSVP with details from their last RSVP for the same course" 


        context 'when the RSVP is for a course they have never attended' do
          before do
            @course = create(:course, name: "JAVASCRIPT", title: "Intro to JavaScript")
            @event.update_attributes(course_id: @course.id)
          end

          it "carries over only limited details" 

        end
      end
    end

    describe "#learn" do
      it "creates an RSVP for the student role" 


      describe "when the user has previously attended" do
        let!(:existing_rsvp) do
          create(:rsvp, user: @user, job_details: 'Firetruck')
        end

        it "creates a new RSVP with some details from their last RSVP" 

      end
    end

    describe "when there is an existing RSVP for this user" do
      before do
        @rsvp = create(:rsvp, user: @user, event: @event)
      end

      it 'redirects to the event page when trying to create a new RSVP' 

    end

    describe "when user is signing up for a region they have signed up for before" do
      before do
        create(:rsvp, user: @user, event: @event)
      end

      it 'does not show a warning' 

    end

    describe "when user is signing up for a region they haven't signed up for before" do
      context "when they have never signed up for an event" do
        it 'does not show a warning' 

      end

      context "when they have already signed up for some other region" do
        before do
          @other_event = create(:event, title: 'The other RailsBridge event')
          create(:rsvp, user: @user, event: @event)
        end

        it 'shows them a warning to double check their location' 

      end
    end
  end

  describe "#edit" do
    context "as an organizer" do
      let(:organizer) { create(:user) }
      let(:organizer_rsvp) { create(:organizer_rsvp, event: @event, user: organizer) }

      before do
        create(:event_session, event: @event)
        sign_in organizer
      end

      it "redirects to the event page" 

    end
  end

  describe "#create" do
    before do
      @rsvp_params = extract_rsvp_params build(:rsvp, event: @event)
    end

    def make_request
      post :create, params: { event_id: @event.id, rsvp: @rsvp_params }
    end

    context "when not logged in" do
      it_behaves_like "an action that requires user log-in"

      it "does not create any new rsvps" 

    end

    context "when there is no rsvp for the volunteer/event" do
      before do
        @user = create(:user)
        sign_in @user
        @rsvp_params = extract_rsvp_params build(:rsvp, event: @event)
      end

      def do_request
        post :create, params: { event_id: @event.id, rsvp: @rsvp_params, user: { gender: "human" } }
      end

      it "should generate a token for the RSVP" 


      it "should allow the user to newly volunteer for an event" 


      it "redirects to the event page related to the rsvp with flash confirmation" 


      it "should create a rsvp that persists and is valid" 


      it "should set the new rsvp with the selected event, and current user" 


      it "should update the user's gender" 


      context "when the event is not full" do
        before do
          @event.update_attribute(:student_rsvp_limit, 2)
          create(:volunteer_rsvp, event: @event)
          create(:volunteer_rsvp, event: @event)
          create(:student_rsvp, event: @event)
        end

        describe "and a student rsvps" do
          before do
            @rsvp_params = extract_rsvp_params build(:student_rsvp, event: @event)
            expect {
              post :create, params: { event_id: @event.id, rsvp: @rsvp_params, user: { gender: "human" } }
            }.to change(Rsvp, :count).by(1)
          end

          it "adds the a newly rsvp'd student as a confirmed user" 


          it "gives a notice that does not mention the waitlist" 

        end
      end

      describe "session attendance" do
        context "when there is only one session" do
          it 'assigns the user to the session' 

        end

        context "when there are multiple sessions" do
          before do
            create(:event_session, event: @event)
            create(:event_session, event: @event, required_for_students: false)
            @event.reload
          end

          context "a student" do
            before do
              @rsvp_params = extract_rsvp_params build(:student_rsvp, event: @event)
            end

            it 'is assigned as attending all required sessions' 

          end

          context "a volunteer" do
            before do
              @rsvp_params[:event_session_ids] = [@event.event_sessions.first.id]
            end

            it 'is assigned as attending only the desired sessions' 

          end
        end
      end

      context "when the event is full of students" do
        before do
          @event.update_attribute(:student_rsvp_limit, 2)
          create(:student_rsvp, event: @event)
          create(:student_rsvp, event: @event)
        end

        describe "and a student rsvps" do
          before do
            @rsvp_params = extract_rsvp_params build(:student_rsvp, event: @event, role: Role::STUDENT)
            expect {
              post :create, params: { event_id: @event.id, rsvp: @rsvp_params, user: { gender: "human" } }
            }.to change(Rsvp, :count).by(1)
          end

          it "adds the student to the waitlist" 


          it "gives a notice that mentions the waitlist" 


          describe "then another student rsvps" do
            before do
              sign_out @user
              sign_in create(:user)

              expect {
                post :create, params: { event_id: @event.id, rsvp: @rsvp_params, user: { gender: "human" } }
              }.to change(Rsvp, :count).by(1)
            end

            it "adds the student the waitlist after the original student" 

          end
        end

        describe "and a volunteer rsvps" do
          before do
            @rsvp_params = extract_rsvp_params build(:volunteer_rsvp, event: @event, role: Role::VOLUNTEER)
          end

          it "adds the volunteer as confirmed" 

        end
      end

      context "when the event is full of volunteers" do
        before do
          allow_any_instance_of(Event).to receive(:volunteers_at_limit?).and_return(true)
        end

        describe "and a volunteer rsvps" do
          before do
            @rsvp_params = extract_rsvp_params build(:volunteer_rsvp, event: @event, role: Role::VOLUNTEER)
            expect {
              post :create, params: { event_id: @event.id, rsvp: @rsvp_params, user: { gender: "human" } }
            }.to change(Rsvp, :count).by(1)
          end

          it "adds the volunteer to the waitlist" 


          it "gives a notice that mentions the waitlist" 


          describe "then another volunteer rsvps" do
            before do
              sign_out @user
              sign_in create(:user)

              expect {
                post :create, params: { event_id: @event.id, rsvp: @rsvp_params, user: { gender: "human" } }
              }.to change(Rsvp, :count).by(1)
            end

            it "adds the volunteer the waitlist after the original student" 

          end
        end

        describe "and a student rsvps" do
          before do
            @rsvp_params = extract_rsvp_params build(:student_rsvp, event: @event, role: Role::STUDENT)
          end

          it "adds the student as confirmed" 

        end
      end

      describe "childcare information" do
        context "when childcare_needed is unchecked" do
          before do
            post :create, params: { event_id: @event.id, rsvp: @rsvp_params.merge(
              needs_childcare: '0', childcare_info: 'goodbye, cruel world'), user: { gender: "human" } }
          end

          it "should clear childcare_info" 

        end

        context "when childcare_needed is checked" do
          let(:child_info) { "Johnnie Kiddo, 7\nJane Kidderino, 45" }

          it "should has validation errors for blank childcare_info" 


          it "updates sets childcare_info when not blank" 


          context "the email" do
            let(:organizers) { create_list :user, 2 }

            before do
              @event.organizers = organizers
            end

            it "is sent to organizers" 


            it "has the correct recipients" 

          end
        end
      end

      describe "dietary restriction information" do
        context "when a dietary restriction is checked" do
          it "adds a dietary restriction" 

        end
      end
    end

    context "when there is already a rsvp for the volunteer/event" do
      #the user may have canceled, changed his/her mind, and decided to volunteer again
      before do
        @user = create(:user)
        sign_in @user
        @rsvp = create(:rsvp, user: @user, event: @event)
        @rsvp_params = extract_rsvp_params @rsvp
      end

      it "does not create any new rsvps" 

    end
  end

  describe "#update" do
    before do
      @user = create(:user)
      @my_rsvp = create(:rsvp, user: @user, event: @event)
      @other_rsvp = create(:rsvp, event: @event)

      sign_in @user
    end

    let(:rsvp_params) do
      {subject_experience: 'Abracadabra'}
    end

    it 'updates rsvps owned by the logged in user' 


    it 'can update region affiliation' 


    it 'cannot update rsvps owned by other users' 

  end

  describe "#destroy" do
    context "when an organizer deletes by id" do
      before do
        @user = create(:user)
        sign_in @user
        create(:organizer_rsvp, event: @event, user: @user)
        @rsvp = create(:student_rsvp, event: @event, user: create(:user))
      end

      it "should destroy the rsvp and reorder the waitlist" 

    end

    context "when not signed in and an RSVP token is available" do
      let!(:rsvp) { create(:student_rsvp, event: @event, token: 'iamatoken') }

      it "should destroy the rsvp and reorder the waitlist" 

    end

    context 'when using an invalid RSVP token' do
      before do
        @user = create(:user)
        sign_in @user
      end

      it 'does nothing' 

    end

    context "when a user has an existing rsvp" do
      before do
        @user = create(:user)
        sign_in @user
      end

      it "should destroy the rsvp" 


      describe 'as a student' do
        before do
          @rsvp = create(:student_rsvp, event: @event, user: @user)

          @event.update_attribute(:student_rsvp_limit, 2)
          create(:student_rsvp, event: @event)
          @waitlisted = create(:student_rsvp, event: @event, waitlist_position: 1)

          expect(@event.reload).to be_students_at_limit
        end

        it "should reorder the student waitlist" 

      end

      describe 'as a volunteer' do
        before do
          @rsvp = create(:volunteer_rsvp, event: @event, user: @user)

          @event.update_attribute(:volunteer_rsvp_limit, 2)
          create(:volunteer_rsvp, event: @event)
          @waitlisted = create(:volunteer_rsvp, event: @event, waitlist_position: 1)

          expect(@event.reload).to be_volunteers_at_limit
        end

        it "should reorder the volunteer waitlist" 

      end
    end

    context "when there is no RSVP for this user" do
      before do
        @user = create(:user)
        sign_in @user
      end

      it "should notify the user s/he has not signed up to volunteer for the event" 

    end
  end
end

