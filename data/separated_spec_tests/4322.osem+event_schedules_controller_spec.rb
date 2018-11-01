# frozen_string_literal: true

require 'spec_helper'

describe Admin::EventSchedulesController do
  let(:venue) { create(:venue) }
  let(:conference) { create(:conference, venue: venue) }
  let(:room) { create(:room, venue: venue) }
  let(:schedule) { create(:schedule, program: conference.program)}
  let(:event_schedule) { create(:event_schedule, schedule: schedule)}
  let!(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let(:organizer) { create(:user, role_ids: organizer_role.id) }

  context 'logged in as an organizer' do
    before :each do
      sign_in(organizer)
      event_schedule
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        let(:create_action) do
          post :create, conference_id: conference.short_title, event_schedule:
               attributes_for(:event_schedule,
                              schedule_id: schedule.id,
                              event_id: create(:event, program: conference.program).id,
                              room_id: create(:room, venue: venue).id,
                              start_time: conference.start_date + conference.start_hour.hours)
        end

        it 'saves the event schedule to the database' 


        it 'has 200 status code' 

      end

      context 'with invalid attributes' do

        let(:create_action) do
          post :create, conference_id: conference.short_title, event_schedule:
               attributes_for(:event_schedule,
                              schedule_id: schedule.id,
                              event_id: nil,
                              room_id: nil,
                              start_time: nil)
        end

        it 'does not save the event schedule to the database' 


        it 'has 422 status code' 

      end
    end

    describe 'POST #update' do
      context 'with valid attributes' do
        before :each do
          patch :update, id: event_schedule.id, conference_id: conference.short_title, event_schedule:
                 attributes_for(:event_schedule,
                                schedule_id: schedule.id,
                                event_id: create(:event, program: conference.program).id,
                                room_id: room.id,
                                start_time: conference.start_date + conference.start_hour.hours)
          event_schedule.reload
        end

        it 'updates the room' 


        it 'updates the start_time' 


        it 'has 200 status code' 

      end

      context 'with invalid attributes' do
        let(:update_action) do
          patch :update, id: event_schedule.id, conference_id: conference.short_title, event_schedule:
               attributes_for(:event_schedule,
                              schedule_id: schedule.id,
                              event_id: nil,
                              room_id: nil,
                              start_time: nil)
        end
        it 'does not save the event schedule to the database' 


        it 'has 422 status code' 

      end
    end

    describe 'DELETE #destroy' do
      let(:destroy_action) do
        delete :destroy, id: event_schedule.id, conference_id: conference.short_title
      end

      it 'deletes the event schedule' 


      it 'has 200 status code' 

    end
  end
end

