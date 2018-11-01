require 'rails_helper'

describe Beta::ProjectBoardOperations do
  describe 'Read' do
    context 'when the project exists' do
      let(:project) do
        create(:project, :with_past_iteration, users: [user], teams: [user.teams.first])
      end
      let(:user) { create(:user, :with_team) }

      before do
        allow(StoryOperations::ReadAll)
          .to receive(:call).with(project: project)
          .and_return(
            active_stories: 'Active Stories',
            past_iterations: 'Past Iterations'
          )
      end

      it 'returns all the project board data' 

    end

    context 'when the project does not exist' do
      it 'returns a failed response with the error' 

    end
  end
end

