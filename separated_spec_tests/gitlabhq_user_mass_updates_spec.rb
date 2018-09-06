require 'rails_helper'

describe 'Merge requests > User mass updates', :js do
  let(:project) { create(:project, :repository) }
  let(:user)    { project.creator }
  let!(:merge_request) { create(:merge_request, source_project: project, target_project: project) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  context 'status' do
    describe 'close merge request' do
      before do
        visit project_merge_requests_path(project)
      end

      it 'closes merge request' 

    end

    describe 'reopen merge request' do
      before do
        merge_request.close
        visit project_merge_requests_path(project, state: 'closed')
      end

      it 'reopens merge request' 

    end
  end

  context 'assignee' do
    describe 'set assignee' do
      before do
        visit project_merge_requests_path(project)
      end

      it 'updates merge request with assignee' 

    end

    describe 'remove assignee' do
      before do
        merge_request.assignee = user
        merge_request.save
        visit project_merge_requests_path(project)
      end

      it 'removes assignee from the merge request' 

    end
  end

  context 'milestone' do
    let(:milestone)  { create(:milestone, project: project) }

    describe 'set milestone' do
      before do
        visit project_merge_requests_path(project)
      end

      it 'updates merge request with milestone' 

    end

    describe 'unset milestone' do
      before do
        merge_request.milestone = milestone
        merge_request.save
        visit project_merge_requests_path(project)
      end

      it 'removes milestone from the merge request' 

    end
  end

  def change_status(text)
    click_button 'Edit merge requests'
    find('#check-all-issues').click
    find('.js-issue-status').click
    find('.dropdown-menu-status a', text: text).click
    click_update_merge_requests_button
  end

  def change_assignee(text)
    click_button 'Edit merge requests'
    find('#check-all-issues').click
    find('.js-update-assignee').click
    wait_for_requests

    page.within '.dropdown-menu-user' do
      click_link text
    end

    click_update_merge_requests_button
  end

  def change_milestone(text)
    click_button 'Edit merge requests'
    find('#check-all-issues').click
    find('.issues-bulk-update .js-milestone-select').click
    find('.dropdown-menu-milestone a', text: text).click
    click_update_merge_requests_button
  end

  def click_update_merge_requests_button
    find('.update-selected-issues').click
    wait_for_requests
  end
end

