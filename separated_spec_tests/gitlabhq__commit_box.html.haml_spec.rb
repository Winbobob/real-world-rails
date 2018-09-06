require 'spec_helper'

describe 'projects/commit/_commit_box.html.haml' do
  let(:user) { create(:user) }
  let(:project) { create(:project, :repository) }

  before do
    assign(:project, project)
    assign(:commit, project.commit)
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive(:can_collaborate_with_project?).and_return(false)
  end

  it 'shows the commit SHA' 


  context 'when there is a pipeline present' do
    context 'when there are multiple pipelines for a commit' do
      it 'shows the last pipeline' 

    end

    context 'when pipeline for the commit is blocked' do
      let!(:pipeline) do
        create(:ci_pipeline, :blocked, project: project,
                                       sha: project.commit.id)
      end

      it 'shows correct pipeline description' 

    end
  end

  context 'viewing a commit' do
    context 'as a developer' do
      before do
        project.add_developer(user)
        allow(view).to receive(:can_collaborate_with_project?).and_return(true)
      end

      it 'has a link to create a new tag' 

    end

    context 'as a non-developer' do
      it 'does not have a link to create a new tag' 

    end
  end
end

