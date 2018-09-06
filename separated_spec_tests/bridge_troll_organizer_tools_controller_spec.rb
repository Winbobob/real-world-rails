require 'rails_helper'

describe Events::OrganizerToolsController do
  let(:event) { FactoryBot.create(:event) }
  let(:admin) { create(:admin) }

  describe "GET #index" do
    def make_request
      get :index, params: { event_id: event.id }
    end

    it_behaves_like "an event action that requires an organizer"

    it "always allows admins, even if they aren't organizers of the event" 


    context "logged in as the organizer" do
      before do
        user = create(:user)
        event.organizers << user
        sign_in user
      end

      it "assigns properties for the view" 


      context "historical event" do
        it "redirects" 

      end
    end
  end

  describe "GET #rsvp_preview" do
    let(:role) { Role::STUDENT }

    def make_request
      get :rsvp_preview, params: { event_id: event.id, role_id: role.id }
    end

    it_behaves_like "an event action that requires an organizer"

    it "always allows admins, even if they aren't organizers of the event" 


    context "logged in as the organizer" do
      before do
        user = create(:user)
        event.organizers << user
        sign_in user
      end

      describe "previewing students" do
        let(:role) { Role::STUDENT }

        it "shows the volunteer RSVP for that event" 

      end

      describe "previewing volunteers" do
        let(:role) { Role::VOLUNTEER }

        it "shows the volunteer RSVP for that event" 

      end
    end
  end

  describe "POST #send_announcement_email" do
    let(:organizer) { create(:user) }

    def make_request
      post :send_announcement_email, params: { event_id: event.id }
    end

    it_behaves_like "an event action that requires an organizer"

    before do
      event.update_attribute(:email_on_approval, false)
    end

    context "as an event organizer" do
      before do
        sign_in organizer
        event.organizers << organizer
      end

      context "when announcement has been sent" do
        before do
          event.update_attribute(:announcement_email_sent_at, DateTime.now)
        end

        it "doesn't send the email" 

      end

      context "when the event has not be published" do
        before do
          event.update_attributes(current_state: :pending_approval)
        end

        it "doesn't send the email" 

      end
      
      context "when the event has been published and announcement email has not been sent" do
        before do
          event.update_attributes(
            current_state: :published,
            announcement_email_sent_at: nil
          )
        end

        it "sends the email" 

      end
    end
  end
end

