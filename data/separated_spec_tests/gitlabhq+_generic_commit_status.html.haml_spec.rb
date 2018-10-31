require 'spec_helper'

describe 'projects/generic_commit_statuses/_generic_commit_status.html.haml' do
  include Devise::Test::ControllerHelpers

  let(:project) { create(:project, :repository) }
  let(:pipeline) { create(:ci_empty_pipeline, id: 1337, project: project, sha: project.commit.id) }
  let(:generic_commit_status) { create(:generic_commit_status, pipeline: pipeline, stage: 'external', name: 'jenkins', stage_idx: 3) }

  before do
    controller.prepend_view_path('app/views/projects')
    allow(view).to receive(:can?).and_return(true)
  end

  it 'won\'t include a column with a link to its pipeline by default' 


  it 'can include a column with a link to its pipeline' 

end

