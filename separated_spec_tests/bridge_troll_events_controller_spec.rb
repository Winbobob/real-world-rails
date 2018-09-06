require 'rails_helper'

describe EventsController do
  describe "GET index" do
    let!(:event) { create(:event, title: 'DonutBridge') }

    it "successfully assigns upcoming events" 


    describe "when rendering views" do
      render_views

      describe "#allow_student_rsvp?" do
        let(:attend_text) { 'Attend' }

        it "shows an 'Attend' button when allowing student RSVP" 


        it "hides the 'Attend' button when not allowing student RSVP" 

      end
    end
  end

  describe "GET index (json)" do
    before do
      @future_event = create(:event, title: 'FutureBridge', starts_at: 5.days.from_now, ends_at: 6.days.from_now, time_zone: 'Alaska')
      @future_external_event = create(:external_event, name: 'FutureExternalBridge', starts_at: 3.days.from_now, ends_at: 4.days.from_now)
      @past_event = create(:event, title: 'PastBridge', time_zone: 'Alaska')
      @past_event.update_attributes(starts_at: 5.days.ago, ends_at: 4.days.ago)
      @past_external_event = create(:external_event, name: 'PastExternalBridge', starts_at: 3.days.ago, ends_at: 2.days.ago)
      @unpublished_event = create(:event, starts_at: 5.days.from_now, ends_at: 6.days.from_now, current_state: :pending_approval)
    end

    it 'can render published past events as json' 


    it 'can render all published events as json' 


    it 'can render only upcoming published events as json' 

  end

  describe "GET show" do
    let!(:event) { create(:event, title: 'DonutBridge') }

    it "successfully assigns the event" 


    describe "when rendering views" do
      render_views
      before do
        event.location = create(:location, name: 'Carbon Nine')
        event.save!
      end

      it "includes the location" 


      describe "authorization message" do
        it "can tell the user they are a chapter leader" 


        it "can tell the user they are an organization leader" 

      end

      describe "#allow_student_rsvp?" do
        let(:attend_text) { 'Attend' }
        before do
          sign_in create(:user)
        end

        it "shows an 'Attend' button when allowing student RSVP" 


        it "hides the 'Attend' button when not allowing student RSVP" 

      end

      context "when no volunteers or students are attending" do
        it "shows messages about the lack of volunteers and students" 

      end

      context "when volunteers are attending" do
        before do
          volunteer = create(:user, first_name: 'Ron', last_name: 'Swanson')
          create(:rsvp, event: event, user: volunteer, role: Role::VOLUNTEER)
        end

        it "shows the volunteer somewhere on the page" 

      end

      context "when students are attending" do
        before do
          student = create(:user, first_name: 'Jane', last_name: 'Fontaine')
          create(:student_rsvp, event: event, user: student, role: Role::STUDENT)
        end

        it "shows the student somewhere on the page" 


        describe 'waitlists' do
          let(:waitlist_label) { 'waitlist' }

          context "when there is no waitlist" do
            it "doesn't have the waitlist header" 

          end

          context "when there is a waitlist" do
            before do
              event.update_attribute(:student_rsvp_limit, 1)
              student = create(:user, first_name: 'Sandy', last_name: 'Sontaine')
              create(:student_rsvp, event: event, user: student, role: Role::STUDENT, waitlist_position: 1)
            end

            it "shows waitlisted students in a waitlist section" 

          end
        end
      end
    end
  end

  describe "GET new" do
    def make_request
      get :new
    end

    it_behaves_like "an action that requires user log-in"

    context "when a user is logged in" do
      before do
        @user = create(:user, time_zone: 'Alaska')
        sign_in @user
      end

      it "successfully assigns an event" 


      it "uses the logged in user's time zone as the event's time zone" 


      it "assigns an empty location" 

    end
  end

  describe "GET edit" do
    let!(:event) { create(:event, title: 'DonutBridge') }

    def make_request
      get :edit, params: { id: event.id }
    end

    it_behaves_like "an event action that requires an organizer"

    context "organizer is logged in" do
      before do
        user = create(:user)
        event.organizers << user
        sign_in user
      end

      it "successfully assigns the event" 

    end
  end

  describe "GET levels" do
    let!(:event) { create(:event, title: 'DonutBridge') }

    it "succeeds without requiring any permissions" 

  end

  describe "POST create" do
    def make_request(params = {})
      post :create, params: params
    end

    it_behaves_like "an action that requires user log-in"

    context "when a user is logged in" do
      before do
        @user = create(:user)
        sign_in @user
      end

      describe "with valid params" do
        let!(:chapter) { create(:chapter) }
        let!(:location) { create(:location) }
        let(:create_params) {
          next_year = Date.current.year + 1
          {
            "event" => {
              "title" => "Party Zone",
              "target_audience" => "yaya",
              "time_zone" => "Alaska",
              "food_provided" => false,
              "student_rsvp_limit" => 100,
              "event_sessions_attributes" => {
                "0" => {
                  "name" => 'I am good at naming sessions',
                  "starts_at(1i)" => next_year.to_s,
                  "starts_at(2i)" => "1",
                  "starts_at(3i)" => "12",
                  "starts_at(4i)" => "12",
                  "starts_at(5i)" => "30",
                  "ends_at(1i)" => next_year.to_s,
                  "ends_at(2i)" => "1",
                  "ends_at(3i)" => "12",
                  "ends_at(4i)" => "22",
                  "ends_at(5i)" => "30"
                }
              },
              "location_id" => location.id,
              "chapter_id" => chapter.id,
              "details" => "sdfasdfasdf"
            }
          }
        }

        it "creates a new event with the creator as an organizer" 


        it "sets the event's session times in the event's time zone" 


        context "but the user is flagged as a spammer" do
          before do
            @user.update_attribute(:spammer, true)
          end

          it "sends no email and flags the event as spam after creation" 

        end

        describe "notifying publishers of events" do
          before do
            @user.update_attributes(first_name: 'Nitro', last_name: 'Boost')
            @admin = create(:user, admin: true)
            @publisher = create(:user, publisher: true)
          end

          let(:mail) do
            ActionMailer::Base.deliveries.select {|d| d.subject.include? 'awaits approval' }.last
          end

          it "sends an email to all admins/publishers on event creation" 

        end

        describe "notifying the user of pending approval" do
          before do
            @user.update_attributes(first_name: 'Evel', last_name: 'Knievel')
          end

          let(:mail) do
            ActionMailer::Base.deliveries.select {|d| d.subject.include? 'Your Bridge Troll event' }.last
          end
          let(:recipients) { JSON.parse(mail.header['X-SMTPAPI'].to_s)['to'] }

          it "sends an email to the user" 

        end

      end

      describe "with invalid params" do
        let(:invalid_params) {
          {
            "event" => {
              "title" => "Party Zone"
            }
          }
        }

        it "renders :new without creating an event" 

      end
    end
  end

  describe "PUT update" do
    let!(:event) { create(:event, title: 'DonutBridge') }

    def make_request(params = {})
      put :update, params: { id: event.id, event: params, create_event: true }
    end

    it_behaves_like "an event action that requires an organizer"

    context "organizer is logged in" do
      before do
        user = create(:user)
        event.organizers << user
        sign_in user
      end

      describe "with valid params" do
        let(:caracas_zone) { 'Caracas' }
        let(:update_params) {
          {
            "title" => "Updated event title",
            "details" => "Updated event details",
            "time_zone" => caracas_zone
          }
        }

        it "updates the event and redirects to the event page" 


        describe "when the event has been published" do
          before do
            event.update_attribute(:current_state, :published)
          end

          it "updates attributes while keeping the event in published state" 

        end

        it "sets the event's session times in the event's time zone" 


        context 'when the event was previously in a draft state' do
          before do
            event.update_attributes(current_state: :draft)
          end

          it "sends an approval email to all admins/publishers on event creation" 

        end
      end

      describe "with invalid params" do
        let(:invalid_params) {
          {
            "title" => ""
          }
        }

        it "re-renders the edit form" 

      end
    end
  end

  describe "DELETE destroy" do
    let!(:event) { create(:event, title: 'DonutBridge') }

    def make_request
      delete :destroy, params: { id: event.id }
    end

    it_behaves_like "an event action that requires an organizer"

    context "organizer is logged in" do
      before do
        user = create(:user)
        event.organizers << user
        sign_in user
      end

      it "destroys the event and redirects to the events page" 

    end
  end

  describe "GET feed" do
    render_views
    let(:rss_item_tag) { 'item' }
    let(:atom_item_tag) { 'entry' }

    context 'when there are no events' do
      it 'returns an empty feed' 

    end

    context "when format is RSS" do
      let!(:event) { create(:event, title: 'DonutBridge') }
      let!(:other_event) { create(:event, title: 'C5 Event!') }
      let(:item_tag) { rss_item_tag }

      before do
        get :feed, format: :rss
      end

      it "successfully directs to xml rss feed" 


      it "has rss formatting" 


      it "includes the website title" 


      it "includes all events" 

    end

    context "when format is Atom" do
      let!(:event) { create(:event, title: 'DonutBridge') }
      let!(:other_event) { create(:event, title: 'C5 Event!') }
      let(:item_tag) { atom_item_tag }

      before do
        get :feed, format: :atom
      end

      it "successfully directs to xml rss feed" 


      it "has atom formatting" 


      it "includes the website title" 


      it "includes all events" 

    end
  end
end

