require 'spec_helper'

describe 'Issuables Close/Reopen/Report toggle' do
  let(:user) { create(:user) }

  shared_examples 'an issuable close/reopen/report toggle' do
    let(:container) { find('.issuable-close-dropdown') }
    let(:human_model_name) { issuable.model_name.human.downcase }

    it 'shows toggle' 


    it 'opens a dropdown when toggle is clicked' 


    it 'changes the button when an item is selected' 

  end

  context 'on an issue' do
    let(:project) { create(:project) }
    let(:issuable) { create(:issue, project: project) }

    before do
      project.add_master(user)
      login_as user
    end

    context 'when user has permission to update', :js do
      before do
        visit project_issue_path(project, issuable)
      end

      it_behaves_like 'an issuable close/reopen/report toggle'
    end

    context 'when user doesnt have permission to update' do
      let(:cant_project) { create(:project) }
      let(:cant_issuable) { create(:issue, project: cant_project) }

      before do
        cant_project.add_guest(user)

        visit project_issue_path(cant_project, cant_issuable)
      end

      it 'only shows the `Report abuse` and `New issue` buttons' 

    end
  end

  context 'on a merge request' do
    let(:project) { create(:project, :repository) }
    let(:issuable) { create(:merge_request, source_project: project) }

    before do
      project.add_master(user)
      login_as user
    end

    context 'when user has permission to update', :js do
      before do
        visit project_merge_request_path(project, issuable)
      end

      it_behaves_like 'an issuable close/reopen/report toggle'
    end

    context 'when user doesnt have permission to update' do
      let(:cant_project) { create(:project, :repository) }
      let(:cant_issuable) { create(:merge_request, source_project: cant_project) }

      before do
        cant_project.add_reporter(user)

        visit project_merge_request_path(cant_project, cant_issuable)
      end

      it 'only shows a `Report abuse` button' 

    end
  end
end

