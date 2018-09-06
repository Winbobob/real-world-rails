require 'spec_helper'

describe Projects::MoveUsersStarProjectsService do
  let!(:user) { create(:user) }
  let!(:project_with_stars) { create(:project, namespace: user.namespace) }
  let!(:target_project) { create(:project, namespace: user.namespace) }

  subject { described_class.new(target_project, user) }

  describe '#execute' do
    before do
      create_list(:users_star_project, 2, project: project_with_stars)
    end

    it 'moves the user\'s stars from one project to another' 


    it 'rollbacks changes if transaction fails' 

  end
end

