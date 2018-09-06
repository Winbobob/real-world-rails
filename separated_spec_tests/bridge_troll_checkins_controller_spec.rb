require 'rails_helper'

describe CheckinsController do
  before do
    @event = create(:event)
    @session = @event.event_sessions.first

    @user_organizer = create(:user)
    @event.organizers << @user_organizer

    sign_in @user_organizer
  end

  describe "GET index" do
    it "succeeds" 


    it "assigns the event and session" 

  end

  describe "POST create" do
    before do
      @vol = create(:user)
      @rsvp = create(:rsvp, user: @vol, event: @event)
      @rsvp_session = @rsvp.rsvp_sessions.last
      @event_session = @rsvp_session.event_session
    end

    it "checks in the volunteer and returns the number of checked-in persons" 

  end

  describe "DELETE destroy" do
    before do
      @vol = create(:user)
      @rsvp = create(:rsvp, user: @vol, event: @event)
      @rsvp_session = @rsvp.rsvp_sessions.last
      @event_session = @rsvp_session.event_session
      @rsvp_session.update_attribute(:checked_in, true)
    end

    it "removes checked-in status for the volunteer and returns the number of checked-in persons" 

  end
end

