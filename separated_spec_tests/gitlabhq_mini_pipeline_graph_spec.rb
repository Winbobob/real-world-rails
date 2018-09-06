require 'rails_helper'

feature 'Mini Pipeline Graph in Commit View', :js do
  let(:project) { create(:project, :public, :repository) }

  context 'when commit has pipelines' do
    let(:pipeline) do
      create(:ci_empty_pipeline,
              project: project,
              ref: project.default_branch,
              sha: project.commit.sha)
    end
    let(:build) { create(:ci_build, pipeline: pipeline) }

    it 'display icon with status' 


    it 'displays a mini pipeline graph' 

  end

  context 'when commit does not have pipelines' do
    before do
      visit project_commit_path(project, project.commit.id)
    end

    it 'should not display a mini pipeline graph' 

  end
end

