require 'rails_helper'

describe WaitlistManager do
  describe "#reorder_waitlist!" do
    context 'for a workshop event' do
      before do
        @event = create(:event, student_rsvp_limit: 2)
        @confirmed1 = create(:student_rsvp, event: @event)
        @confirmed2 = create(:student_rsvp, event: @event)
        @waitlist1 = create(:student_rsvp, event: @event, waitlist_position: 1)
        @waitlist2 = create(:student_rsvp, event: @event, waitlist_position: 2)
        @waitlist3 = create(:student_rsvp, event: @event, waitlist_position: 3)
      end

      context "when the limit has increased" do
        before do
          @event.update_attribute(:student_rsvp_limit, 4)
        end

        it "promotes people on the waitlist into available slots when the limit increases" 

      end

      context "when a confirmed rsvp has been destroyed" do
        before do
          @confirmed1.destroy
          WaitlistManager.new(@event).reorder_waitlist!
        end

        it 'promotes a waitlisted user to confirmed when the rsvp is destroyed' 

      end

      context "when a waitlisted rsvp has been destroyed" do
        before do
          @waitlist1.destroy
          WaitlistManager.new(@event).reorder_waitlist!
        end

        it 'reorders the waitlist when the rsvp is destroyed' 

      end

      context "when the volunteer waitlist limit is removed" do
        before do
          @event.update_attribute(:volunteer_rsvp_limit, 1)
          @confirmed = create(:volunteer_rsvp, event: @event)
          @waitlist = create(:volunteer_rsvp, event: @event, waitlist_position: 1)
          @event.update_column(:volunteer_rsvp_limit, nil)
        end

        it 'promotes everyone from the volunteer waitlist' 

      end
    end

    context 'for a volunteer-only event' do
      before do
        @event = create(:event, allow_student_rsvp: false, student_rsvp_limit: nil, volunteer_rsvp_limit: 1)
        @confirmed = create(:volunteer_rsvp, event: @event)
        @waitlist1 = create(:volunteer_rsvp, event: @event, waitlist_position: 1)
        @waitlist2 = create(:volunteer_rsvp, event: @event, waitlist_position: 2)
      end

      it 'promotes volunteers from the waitlist when the limit is increased' 

    end
  end

  describe "#promote_from_waitlist!" do
    before do
      @event = create(:event, student_rsvp_limit: 2)
      @confirmed1 = create(:student_rsvp, event: @event)
      @waitlisted = create(:student_rsvp, event: @event, waitlist_position: 1)
    end

    it "removes waitlist_position if there is room" 


    it 'sends an email' 


    it 'does nothing if there is no room' 

  end
end

