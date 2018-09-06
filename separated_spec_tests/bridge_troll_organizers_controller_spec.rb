require 'rails_helper'

describe OrganizersController do
  before do
    @event = create(:event)
    @user = create(:user)
  end

  describe "permissions" do
    context "a user that is not logged in" do
      it "can not edit, create, or delete an event organizer" 

    end
  end

  context "a user that is not an organizer for the event" do
    before do
      sign_in @user
    end

    it "can not edit, create, or delete an event organizer" 

  end

  context "a user that is logged in and is an organizer for an unpublished event" do
    before do
      @event = create(:event, current_state: :pending_approval)
      @event.organizers << @user

      sign_in @user
    end

    it "can not edit, create, or delete an event organizer" 

  end

  context "a user that is logged in and is an organizer for a published event" do
    before do
      @other_user = create(:user)
      @event.organizers << @user
      @volunteer_rsvp = create(:rsvp, event: @event, role: Role::VOLUNTEER)
      sign_in @user
    end

    it "can see list of organizers" 


    describe "assigning organizers" do
      it "can create an organizer and redirect to the event organizer assignment page" 


      it "shows an error if no user is provided" 

    end

    it "can promote an existing volunteer to organizer" 


    it "emails the new organizer to let them know they've been added" 


    describe "#destroy" do
      it "can delete an event organizer" 


      it "redirects to the event instead of the tools if you delete yourself" 


      it "does not allow removing the last organizer" 

    end
  end
end

