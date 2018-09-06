# frozen_string_literal: true

require 'spec_helper'

describe Admin::CommentsController, type: :controller do

  # It is necessary to use bang version of let to build roles before user
  let(:conference) { create(:conference) }
  let!(:organizer_role) { Role.find_by(name: 'organizer', resource: conference) }
  let(:organizer) { create(:user, role_ids: organizer_role.id, last_sign_in_at: Time.now - 1.day) }
  let(:participant) { create(:user) }
  let(:event) { create(:event, program: conference.program) }
  let(:comment) { create(:comment, commentable_type: 'Event', commentable_id: event.id) }

  context 'not logged in user' do
    describe 'GET #index' do
      it 'renders the :index template' 

    end
  end

  context 'logged in as admin, organizer or cfp' do
    before :each do
      sign_in(organizer)
      comment
    end
    describe 'GET #index' do
      it 'populates a hash with comments' 

      it 'has status 200: OK' 

      it 'renders the :index template' 

    end
  end

  context 'logged in with any other role or normal user' do
    describe 'GET#index' do
      it 'requires organizer privileges' 

    end
  end
end

