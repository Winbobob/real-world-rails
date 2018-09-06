require 'spec_helper'

describe 'User browses jobs' do
  let!(:build) { create(:ci_build, :coverage, pipeline: pipeline) }
  let(:pipeline) { create(:ci_empty_pipeline, project: project, sha: project.commit.sha, ref: 'master') }
  let(:project) { create(:project, :repository, namespace: user.namespace) }
  let(:user) { create(:user) }

  before do
    project.add_master(user)
    project.enable_ci
    project.update_attribute(:build_coverage_regex, /Coverage (\d+)%/)

    sign_in(user)

    visit(project_jobs_path(project))
  end

  it 'shows the coverage' 


  it 'shows the "CI Lint" button' 


  context 'with a failed job' do
    let!(:build) { create(:ci_build, :coverage, :failed, pipeline: pipeline) }

    it 'displays a tooltip with the failure reason' 

  end
end

