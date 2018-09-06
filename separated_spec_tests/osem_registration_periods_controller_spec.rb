# frozen_string_literal: true

require 'spec_helper'

describe Admin::RegistrationPeriodsController do

  # It is necessary to use bang version of let to build roles before user
  let(:conference) { create(:conference) }
  let!(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let!(:registration_ticket) { create(:registration_ticket, conference: conference) }
  let(:organizer) { create(:user, role_ids: organizer_role.id) }
  let(:organizer2) { create(:user, email: 'organizer2@email.osem', role_ids: organizer_role.id) }
  let(:participant) { create(:user) }

  shared_examples 'access as administration or organizer' do

    before do
      conference.registration_period = create(:registration_period)
    end

    describe 'PATCH #update' do

      context 'valid attributes' do

        it 'locates the requested registration period object' 


        it 'changes registration period attributes' 


        it 'redirects to the updated registration period' 


        it 'sends email notification on conference registration date update' 

      end
    end

    describe 'POST #create' do
      context 'with valid attributes' do
        it 'saves the registration period to the database' 


        it 'redirects to registration_periods#show' 

      end

      context 'with invalid attributes' do
        it 'does not save the registration period to the database' 


        it 're-renders the new template' 

      end
    end

    describe 'GET #edit' do
      it 'assigns the requested registration period to @registration_period' 


      it 'renders the show template' 

    end

    describe 'GET #show' do
      it 'assigns the requested registration period to @registration_period' 


      it 'renders the show template' 

    end

    describe 'GET #new' do
      it 'assigns a new registration period to @registration_period' 


      it 'renders the :new template' 

    end

    describe 'DELETE #destroy' do
      it 'it deletes the registration period' 

      it 'redirects to users#show' 

    end
  end

  describe 'organizer access' do

    before(:each) do
      sign_in(organizer)
    end

    it_behaves_like 'access as administration or organizer'

  end
end

