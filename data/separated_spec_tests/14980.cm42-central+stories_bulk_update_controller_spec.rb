require 'rails_helper'

describe StoriesBulkUpdateController do
  describe '#create' do
    def map_to_attribute(stories, arg)
      stories.map do |record|
        record.reload[arg.to_sym]
      end
    end

    def response_body(field)
      JSON.parse(response.body)[field]
    end

    before do
      sign_in user_1
    end

    let(:user_1)  { create(:user, :with_team) }
    let(:user_2)  { create(:user, :with_team) }
    let(:user_3)  { create(:user, :with_team) }
    let(:user_4)  { create(:user, :with_team) }
    let(:project) { create(:project, users: [user_1, user_2, user_3], teams: [user_1.teams.first]) }
    let(:stories) { create_list(:story, 2, project: project, requested_by: user_1) }

    let(:params) do
      {
        project_id: project.id, story_ids: stories.map(&:id), requested_by_id: user_2.id,
        owned_by_id: user_3.id, labels: 'back, front'
      }
    end

    context 'when receive an array of story ids' do
      context 'when set valid attributes' do
        before do
          post :create, params
        end

        it 'updates the story requester' 


        it 'updates the story owner' 


        it 'updates the story labels' 


        it 'responds with 200' 


        it 'returns a successfully message' 

      end

      context 'when set invalid owner' do
        before do
          post :create, params.merge(owned_by_id: user_4)
        end

        it 'responds with 422' 


        it 'returns an error message' 

      end

      context 'when stories are not found' do
        before do
          post :create, params.merge(story_ids: nil)
        end

        it 'returns a message' 


        it 'responds with 404' 

      end
    end
  end
end

