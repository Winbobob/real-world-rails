require 'spec_helper'

describe UserRecentEventsFinder do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:project_owner) { project.creator }
  let!(:event) { create(:event, project: project, author: project_owner) }

  subject(:finder) { described_class.new(user, project_owner) }

  describe '#execute' do
    it 'does not include the event when a user does not have access to the project' 


    context 'when the user has access to a project' do
      before do
        project.add_developer(user)
      end

      it 'includes the event' 


      it 'does not include the event if the user cannot read cross project' 

    end
  end
end

