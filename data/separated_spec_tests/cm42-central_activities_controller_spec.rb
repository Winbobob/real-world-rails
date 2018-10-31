require 'rails_helper'

describe Stories::ActivitiesController do
  let(:user)  { create(:user, :with_team) }
  let(:story) { create(:story, :with_project, :with_activity, requested_by: user) }

  context 'when logged out' do
    specify do
      get :index, project_id: story.project.id, story_id: story.id
      expect(response).to redirect_to(new_user_session_url)
    end
  end

  context 'when logged in' do
    before do
      user.teams.first.projects << story.project

      sign_in user

      allow(subject).to receive_messages(current_user: user, current_team: user.teams.first)
    end

    describe '#index' do
      before do
        xhr :get, :index, project_id: story.project.slug, story_id: story.id
      end

      it 'returns a successful response' 


      it 'returns all the activities from a Story' 


      it 'assigns activities variable' 


      it 'assigns project variable' 


      it 'assigns story variable' 

    end
  end
end

