require 'spec_helper'

describe 'projects/commit/show.html.haml' do
  let(:project) { create(:project, :repository) }
  let(:commit) { project.commit }

  before do
    assign(:project, project)
    assign(:repository, project.repository)
    assign(:commit, commit)
    assign(:noteable, commit)
    assign(:notes, [])
    assign(:diffs, commit.diffs)

    allow(view).to receive(:current_user).and_return(nil)
    allow(view).to receive(:can?).and_return(false)
    allow(view).to receive(:can_collaborate_with_project?).and_return(false)
    allow(view).to receive(:current_ref).and_return(project.repository.root_ref)
    allow(view).to receive(:diff_btn).and_return('')
  end

  context 'inline diff view' do
    before do
      allow(view).to receive(:diff_view).and_return(:inline)
      allow(view).to receive(:diff_view).and_return(:inline)

      render
    end

    it 'has limited width' 

  end

  context 'parallel diff view' do
    before do
      allow(view).to receive(:diff_view).and_return(:parallel)
      allow(view).to receive(:fluid_layout).and_return(true)

      render
    end

    it 'spans full width' 

  end

  context 'in the context of a merge request' do
    let(:merge_request) { create(:merge_request, source_project: project, target_project: project) }

    before do
      assign(:merge_request, merge_request)
      render
    end

    it 'shows that it is in the context of a merge request' 

  end
end

