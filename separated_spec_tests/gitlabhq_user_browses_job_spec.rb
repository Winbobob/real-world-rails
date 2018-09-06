require 'spec_helper'

describe 'User browses a job', :js do
  let(:user) { create(:user) }
  let(:user_access_level) { :developer }
  let(:project) { create(:project, :repository, namespace: user.namespace) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project, sha: project.commit.sha, ref: 'master') }
  let!(:build) { create(:ci_build, :success, :trace_artifact, :coverage, pipeline: pipeline) }

  before do
    project.add_master(user)
    project.enable_ci

    sign_in(user)

    visit(project_job_path(project, build))
  end

  it 'erases the job log' 


  context 'with a failed job' do
    let!(:build) { create(:ci_build, :failed, :trace_artifact, pipeline: pipeline) }

    it 'displays the failure reason' 

  end

  context 'when a failed job has been retried' do
    let!(:build) { create(:ci_build, :failed, :retried, :trace_artifact, pipeline: pipeline) }

    it 'displays the failure reason and retried label' 

  end
end

