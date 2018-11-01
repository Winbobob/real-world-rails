require 'spec_helper'

describe 'projects/issues/_related_branches' do
  include Devise::Test::ControllerHelpers

  let(:project) { create(:project, :repository) }
  let(:branch) { project.repository.find_branch('feature') }
  let!(:pipeline) { create(:ci_pipeline, project: project, sha: branch.dereferenced_target.id, ref: 'feature') }

  before do
    assign(:project, project)
    assign(:related_branches, ['feature'])

    render
  end

  it 'shows the related branches with their build status' 

end

