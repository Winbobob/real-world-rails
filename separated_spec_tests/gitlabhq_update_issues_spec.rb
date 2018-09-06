require 'rails_helper'

feature 'Multiple issue updating from issues#index', :js do
  let!(:project)   { create(:project) }
  let!(:issue)     { create(:issue, project: project) }
  let!(:user)      { create(:user)}

  before do
    project.add_master(user)
    sign_in(user)
  end

  context 'status' do
    it 'sets to closed' 


    it 'sets to open' 

  end

  context 'assignee' do
    it 'updates to current user' 


    it 'updates to unassigned' 

  end

  context 'milestone' do
    let!(:milestone) { create(:milestone, project: project) }

    it 'updates milestone' 


    it 'sets to no milestone' 

  end

  def create_closed
    create(:issue, project: project, state: :closed)
  end

  def create_assigned
    create(:issue, project: project, assignees: [user])
  end

  def create_with_milestone
    create(:issue, project: project, milestone: milestone)
  end

  def click_update_assignee_button
    find('.js-update-assignee').click
    wait_for_requests
  end

  def click_update_issues_button
    find('.update-selected-issues').click
    wait_for_requests
  end
end

