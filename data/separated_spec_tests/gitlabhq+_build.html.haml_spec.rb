require 'spec_helper'

describe 'projects/ci/jobs/_build' do
  include Devise::Test::ControllerHelpers

  let(:project) { create(:project, :repository) }
  let(:pipeline) { create(:ci_empty_pipeline, id: 1337, project: project, sha: project.commit.id) }
  let(:build) { create(:ci_build, pipeline: pipeline, stage: 'test', stage_idx: 1, name: 'rspec 0:2', status: :pending) }

  before do
    controller.prepend_view_path('app/views/projects')
    allow(view).to receive(:can?).and_return(true)
  end

  it 'won\'t include a column with a link to its pipeline by default' 


  it 'can include a column with a link to its pipeline' 

end

