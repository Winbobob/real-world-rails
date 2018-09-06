require 'rails_helper'

describe "Opening and closing an event for RSVP" do

  context "when RSVPs are open" do
    before do
      @event = create(:event)
      @event.open = true
      @event.save
    end

    context "when potential attendees view closed event" do
      before do
        visit root_path
      end

      it "allows volunteers to RSVP" 


      it "allows students to RSVP" 

    end

    context "when organizer manages the event" do
      it "allows the organizers to close RSVPs" 

    end
  end

  context "when RSVPs are closed" do
    before do
      @event = create(:event)
      @event.open = false
      @event.save
    end

    context "when potential attendees view closed event" do
      before do
        visit root_path
      end

      it "prevents volunteers from RSVPing" 


      it "prevents students from RSVPing" 


      it "presents message that RSVPs are closed" 

    end

    context "when organizer manages the event" do
      it "allows organizers to reopen RSVPs" 

    end
  end
end

