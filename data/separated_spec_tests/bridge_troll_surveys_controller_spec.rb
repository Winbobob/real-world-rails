require 'rails_helper'

describe SurveysController do
  before do
    @event = create(:event, title: 'The Best Railsbridge')
    @user = create(:user)
    @rsvp = create(:volunteer_rsvp, user: @user, event: @event)
  end

  describe "when signed in" do
    before do
      sign_in @user
    end

    describe "#new" do
      it "shows the survey form" 


      it "shows the survey form when only an event_id is provided" 


      describe "for an invalid RSVP" do
        before do
          @destroyed_rsvp_id = @rsvp.id
          @rsvp.destroy
        end

        it "redirects to the event with an error" 

      end

      context "if the survey has already been taken" do
        before do
          Survey.create(rsvp_id: @rsvp.id)
        end

        it "shows a warning message" 

      end

      context "if the user is try to take a survey that isn't theirs" do
        before do
          @other_user = create(:user)
          @other_rsvp = create(:rsvp, user: @other_user)
        end

        it "takes the survey for the logged-in user instead" 

      end
    end

    describe "#create" do
      context "with good params" do
        it "makes the survey" 

      end

      context "if the user is try to take a survey that isn't theirs" do
        before do
          @other_user = create(:user)
          @other_rsvp = create(:rsvp, user: @other_user)
        end

        it "creates a survey for the logged-in user" 

      end
    end
  end

  describe "#index" do
    context "as the organizer" do
      before do
        @organizer = create(:user)
        @event.organizers << @organizer
        create(:survey, rsvp: @rsvp)
        sign_in @organizer
      end

      it "shows the survey results" 

    end

    context "as someone who is not the organizer" do
      before do
        sign_in @user
      end

      it "doesn't show the survey results" 

    end
  end
end

