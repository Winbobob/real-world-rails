require 'rails_helper'

describe SectionArranger do
  def preference(volunteer_rsvp)
    if volunteer_rsvp.teaching && volunteer_rsvp.taing?
      '?'
    elsif volunteer_rsvp.teaching?
      'T'
    elsif volunteer_rsvp.taing?
      't'
    else
      'x'
    end
  end
  
  def calculate_arrangement(event)
    arrangement = Hash.new { |hsh, key| hsh[key] = [] }
    event.sections.each do |section|
      arrangement[section.class_level] << {
        students: section.student_rsvps.count,
        volunteers: section.volunteer_rsvps.count
      }
    end
    arrangement
  end

  def volunteer_preferences(event)
    event.sections.map do |section|
      section.volunteer_rsvps.map { |rsvp| preference(rsvp) }
    end
  end

  describe "#arrange" do
    context "given a significantly large event" do
      before do
        @event = create(:event)
        @student_rsvps = {
          1 => [create(:student_rsvp, event: @event, class_level: 1)],
          2 => (1..10).map { create(:student_rsvp, event: @event, class_level: 2) },
          3 => (1..7).map { create(:student_rsvp, event: @event, class_level: 3) },
          4 => [create(:student_rsvp, event: @event, class_level: 4)],
          5 => [create(:student_rsvp, event: @event, class_level: 5)]
        }
        (1..3).map { create(:volunteer_rsvp, event: @event, class_level: 0, teaching: true, taing: false) }
        (1..3).map { create(:volunteer_rsvp, event: @event, class_level: 0, teaching: false, taing: true) }
        (1..3).map { create(:volunteer_rsvp, event: @event, class_level: 0, teaching: true, taing: true) }
        (1..3).map { create(:volunteer_rsvp, event: @event, class_level: 0, teaching: false, taing: true) }

        (1..3).map { create(:volunteer_rsvp, event: @event, class_level: 0, teaching: false, taing: false) }
      end

      it 'arranges students into classes based on their level' 

    end

    context "when there are only students" do
      before do
        @event = create(:event)
        create(:student_rsvp, event: @event, class_level: 1)
        create(:student_rsvp, event: @event, class_level: 2)
      end

      it "assigns the students to sections without incident" 

    end

    context "when there are only volunteers" do
      before do
        @event = create(:event)
        create(:volunteer_rsvp, event: @event, class_level: 0)
        create(:volunteer_rsvp, event: @event, class_level: 1)
      end

      it "doesn't do anything, successfully" 

    end

    describe "limiting to checked-in attendees" do
      let(:placed_attendee_ids) {
        attendee_ids = []
        @event.sections.each do |section|
          attendee_ids += section.rsvps.pluck(:id)
        end
        attendee_ids
      }

      before do
        @event = create(:event)
        create(:event_session, event: @event)
        @event.reload
        expect(@event.event_sessions.count).to eq(2)

        @session1, @session2 = @event.event_sessions.to_a

        @session1_rsvp = create(:student_rsvp, event: @event, session_checkins: {@session1.id => true, @session2.id => false})

        @session2_rsvp = create(:student_rsvp, event: @event, session_checkins: {@session1.id => false, @session2.id => true})

        @both_rsvp = create(:student_rsvp, event: @event, session_checkins: {@session1.id => true, @session2.id => true})

        @neither_attendee = create(:student_rsvp, event: @event, session_checkins: {@session1.id => false, @session2.id => false})
      end

      context "when asked to arrange for only the first session" do
        before do
          SectionArranger.new(@event).arrange(@session1.id)
        end

        it 'arranges only those people' 

      end

      context "when asked to arrange for only the second session" do
        before do
          SectionArranger.new(@event).arrange(@session2.id)
        end

        it 'arranges only those people' 

      end

      context "when asked to arrange for people who have checked in to any session" do
        before do
          SectionArranger.new(@event).arrange('any')
        end

        it 'arranges only those people' 

      end
    end
  end
end

