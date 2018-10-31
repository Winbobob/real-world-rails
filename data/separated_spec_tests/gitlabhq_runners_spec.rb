require 'spec_helper'

describe API::V3::Runners do
  let(:admin) { create(:user, :admin) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  let(:project) { create(:project, creator_id: user.id) }
  let(:project2) { create(:project, creator_id: user.id) }

  let!(:shared_runner) { create(:ci_runner, :shared) }
  let!(:unused_specific_runner) { create(:ci_runner) }

  let!(:specific_runner) do
    create(:ci_runner).tap do |runner|
      create(:ci_runner_project, runner: runner, project: project)
    end
  end

  let!(:two_projects_runner) do
    create(:ci_runner).tap do |runner|
      create(:ci_runner_project, runner: runner, project: project)
      create(:ci_runner_project, runner: runner, project: project2)
    end
  end

  before do
    # Set project access for users
    create(:project_member, :master, user: user, project: project)
    create(:project_member, :reporter, user: user2, project: project)
  end

  describe 'DELETE /runners/:id' do
    context 'admin user' do
      context 'when runner is shared' do
        it 'deletes runner' 

      end

      context 'when runner is not shared' do
        it 'deletes unused runner' 


        it 'deletes used runner' 

      end

      it 'returns 404 if runner does not exists' 

    end

    context 'authorized user' do
      context 'when runner is shared' do
        it 'does not delete runner' 

      end

      context 'when runner is not shared' do
        it 'does not delete runner without access to it' 


        it 'does not delete runner with more than one associated project' 


        it 'deletes runner for one owned project' 

      end
    end

    context 'unauthorized user' do
      it 'does not delete runner' 

    end
  end

  describe 'DELETE /projects/:id/runners/:runner_id' do
    context 'authorized user' do
      context 'when runner have more than one associated projects' do
        it "disables project's runner" 

      end

      context 'when runner have one associated projects' do
        it "does not disable project's runner" 

      end

      it 'returns 404 is runner is not found' 

    end

    context 'authorized user without permissions' do
      it "does not disable project's runner" 

    end

    context 'unauthorized user' do
      it "does not disable project's runner" 

    end
  end
end

