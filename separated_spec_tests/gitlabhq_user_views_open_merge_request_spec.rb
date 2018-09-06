require 'spec_helper'

describe 'User views an open merge request' do
  let(:merge_request) do
    create(:merge_request, source_project: project, target_project: project, description: '# Description header')
  end

  context 'when a merge request does not have repository' do
    let(:project) { create(:project, :public, :repository) }

    before do
      visit(merge_request_path(merge_request))
    end

    it 'renders both the title and the description' 

  end

  context 'when a merge request has repository', :js do
    let(:project) { create(:project, :public, :repository) }

    context 'when rendering description preview' do
      let(:user) { create(:user) }

      before do
        project.add_master(user)
        sign_in(user)

        visit(edit_project_merge_request_path(project, merge_request))
      end

      it 'renders empty description preview' 


      it 'renders description preview' 

    end

    context 'when the branch is rebased on the target' do
      let(:merge_request) { create(:merge_request, :rebased, source_project: project, target_project: project) }

      before do
        visit(merge_request_path(merge_request))
      end

      it 'does not show diverged commits count' 

    end

    context 'when the branch is diverged on the target' do
      let(:merge_request) { create(:merge_request, :diverged, source_project: project, target_project: project) }

      before do
        visit(merge_request_path(merge_request))
      end

      it 'shows diverged commits count' 

    end
  end
end

