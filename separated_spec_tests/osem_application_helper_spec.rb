# frozen_string_literal: true

require 'spec_helper'

describe ApplicationHelper, type: :helper do
  let(:conference) { create(:full_conference) }
  let(:event) { create(:event, program: conference.program) }
  let(:sponsor) { create(:sponsor) }

  describe '#date_string' do
    it 'when conference lasts 1 day' 


    it 'when conference starts and ends in the same month and year' 


    it 'when conference ends in another month, of the same year' 


    it 'when conference ends in another month, of a different year' 

  end

  describe '#concurrent_events' do
    before :each do
      @other_event = create(:event, program: conference.program, state: 'confirmed')
      schedule = create(:schedule, program: conference.program)
      conference.program.update_attributes!(selected_schedule: schedule)
      @event_schedule = create(:event_schedule, event: event, start_time: conference.start_date + conference.start_hour.hours, room: create(:room), schedule: schedule)
      @other_event_schedule = create(:event_schedule, event: @other_event, start_time: conference.start_date + conference.start_hour.hours, room: create(:room), schedule: schedule)
    end

    describe 'does return correct concurrent events' do
      it 'when events starts at the same time' 


      it 'when event is in between the other event' 

    end

    describe 'does not return as concurrent event ' do
      it 'when event is not scheduled' 


      it 'when one event starts and other ends at the same time' 


      it 'when conference program does not have a selected schedule' 

    end

    describe 'navigation title link' do
      it 'should default to OSEM' 


      it 'should use the environment variable' 


      it 'should use the conference organization name' 

    end
  end

  describe '#get_logo' do
    context 'first sponsorship_level' do
      before do
        first_sponsorship_level = create(:sponsorship_level, position: 1)
        sponsor.update_attributes(sponsorship_level: first_sponsorship_level)
      end

      it 'returns correct url' 

    end

    context 'second sponsorship_level' do
      before do
        second_sponsorship_level = create(:sponsorship_level, position: 2)
        sponsor.update_attributes(sponsorship_level: second_sponsorship_level)
      end

      it 'returns correct url' 

    end

    context 'other sponsorship_level' do
      before do
        other_sponsorship_level = create(:sponsorship_level, position: 3)
        sponsor.update_attributes(sponsorship_level: other_sponsorship_level)
      end

      it 'returns correct url' 

    end

    context 'non-sponsor' do
      it 'returns correct url' 

    end
  end
end

