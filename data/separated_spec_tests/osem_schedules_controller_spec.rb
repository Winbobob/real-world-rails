# frozen_string_literal: true

require 'spec_helper'

describe Admin::SchedulesController do
  let(:conference) { create(:conference) }
  let(:schedule) { create(:schedule, program: conference.program)}
  let!(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let(:organizer) { create(:user, role_ids: organizer_role.id) }

  context 'logged in as an organizer' do
    before :each do
      sign_in(organizer)
      schedule
    end

    describe 'GET #index' do
      it 'renders the index template' 

    end

    describe 'POST #create' do
      let(:create_action){ post :create, conference_id: conference.short_title }

      it 'saves the schedule to the database' 


      it 'redirects to schedules#show' 

    end

    describe 'GET #show' do
      let(:show_action){ get :show, id: schedule.id, conference_id: conference.short_title }

      it 'assigns the requested schedule to schedule' 


      it 'renders the show template' 

    end

    describe 'DELETE #destroy' do
      let(:destroy_action){ delete :destroy, id: schedule.id, conference_id: conference.short_title }

      it 'deletes the schedule' 


      it 'redirects to schedules#index' 

    end
  end
end

