require 'spec_helper'

describe Projects::RunnersController do
  let(:user) { create(:user) }
  let(:project) { create(:project) }
  let(:runner) { create(:ci_runner, :project, projects: [project]) }

  let(:params) do
    {
      namespace_id: project.namespace,
      project_id: project,
      id: runner
    }
  end

  before do
    sign_in(user)
    project.add_maintainer(user)
  end

  describe '#update' do
    it 'updates the runner and ticks the queue' 

  end

  describe '#destroy' do
    it 'destroys the runner' 

  end

  describe '#resume' do
    it 'marks the runner as active and ticks the queue' 

  end

  describe '#pause' do
    it 'marks the runner as inactive and ticks the queue' 

  end
end

