# frozen_string_literal: true

require 'spec_helper'

feature 'BaseController' do
  let(:conference) { create(:conference) }
  let(:user) { create(:user) }

  let!(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let!(:volunteers_coordinator_role) { Role.find_by(name: 'volunteers_coordinator', resource: conference) }
  let!(:cfp_role) { Role.find_by(name: 'cfp', resource: conference) }
  let!(:info_desk_role) { Role.find_by(name: 'info_desk', resource: conference) }

  describe 'GET #verify_user_admin' do
    context 'when user is a guest' do
      it 'redirects to sign in page' 

    end

    context 'when user is ' do
      before(:each) do
        sign_in(user)
      end

      it 'not an admin it redirects to root_path' 


      it 'an admin he can access the admin area' 


      it 'an organizer he can access the admin area' 


      it 'a volunteers_coordinator he can access the admin area' 


      it 'a cfp he can access the admin area' 


      it 'an info_desk he can access the admin area' 

    end
  end
end

