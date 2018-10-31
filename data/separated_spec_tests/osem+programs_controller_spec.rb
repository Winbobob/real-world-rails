# frozen_string_literal: true

require 'spec_helper'

describe Admin::ProgramsController, type: :controller do

  # It is necessary to use bang version of let to build roles before user
  let(:conference) { create(:conference) }
  let!(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let(:organizer) { create(:user, role_ids: organizer_role.id, last_sign_in_at: Time.now - 1.day) }

  context 'not logged in user' do
    describe 'GET #show' do
      it 'does not render admin/programs#show' 

    end
  end

  context 'logged in as admin, organizer or cfp' do
    before :each do
      sign_in(organizer)
    end

    describe 'PATCH #update' do
      it 'redirects to admin/programs#index' 

    end
  end
end

