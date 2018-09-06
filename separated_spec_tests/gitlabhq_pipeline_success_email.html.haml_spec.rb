require 'spec_helper'

describe 'notify/pipeline_success_email.html.haml' do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }
  let(:merge_request) { create(:merge_request, :simple, source_project: project) }

  let(:pipeline) do
    create(:ci_pipeline,
           project: project,
           user: user,
           ref: project.default_branch,
           sha: project.commit.sha,
           status: :success)
  end

  before do
    assign(:project, project)
    assign(:pipeline, pipeline)
    assign(:merge_request, merge_request)
  end

  context 'pipeline with user' do
    it 'renders the email correctly' 

  end

  context 'pipeline without user' do
    before do
      pipeline.update_attribute(:user, nil)
    end

    it 'renders the email correctly' 

  end
end

