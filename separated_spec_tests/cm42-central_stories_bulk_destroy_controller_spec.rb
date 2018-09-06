require 'rails_helper'

describe StoriesBulkDestroyController do
  describe '#create' do
    before do
      sign_in user
    end

    def response_json(status)
      JSON.parse(response.body)[status]
    end

    let(:user) { create(:user, :with_team) }
    let(:project) { create(:project, users: [user], teams: [user.teams.first]) }
    let(:story_1) { create(:story, project: project, requested_by: user) }
    let(:story_2) { create(:story, project: project, requested_by: user) }
    let(:story_3) { create(:story, project: project, requested_by: user) }

    context 'when receive an array of story ids' do
      before do
        post :create, project_id: project.id, story_ids: [story_1.id, story_2.id]
      end

      it 'destroys stories' 


      it 'responds with 200' 


      it 'returns a successfully message' 

    end

    context 'when bulk destroy fails' do
      before do
        allow(StoryOperations::DestroyAll).to receive(:call).and_return(false)
        post :create, project_id: project.id, story_ids: [story_1.id, story_2.id]
      end

      it 'responds with 422' 


      it 'returns an error message' 

    end
  end
end

