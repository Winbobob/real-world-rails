require 'spec_helper'

feature 'Dashboard Issues filtering', :js do
  include Spec::Support::Helpers::Features::SortingHelpers

  let(:user)      { create(:user) }
  let(:project)   { create(:project) }
  let(:milestone) { create(:milestone, project: project) }

  let!(:issue)  { create(:issue, project: project, author: user, assignees: [user]) }
  let!(:issue2) { create(:issue, project: project, author: user, assignees: [user], milestone: milestone) }

  before do
    project.add_master(user)
    sign_in(user)

    visit_issues
  end

  context 'without any filter' do
    it 'shows error message' 

  end

  context 'filtering by milestone' do
    it 'shows all issues with no milestone' 


    it 'shows all issues with the selected milestone' 


    it 'updates atom feed link' 

  end

  context 'filtering by label' do
    let(:label) { create(:label, project: project) }
    let!(:label_link) { create(:label_link, label: label, target: issue) }

    it 'shows all issues with the selected label' 

  end

  context 'sorting' do
    before do
      visit_issues(assignee_id: user.id)
    end

    it 'remembers last sorting value' 


    it 'keeps sorting issues after visiting Projects Issues page' 

  end

  def show_milestone_dropdown
    click_button 'Milestone'
    expect(page).to have_selector('.dropdown-content', visible: true)
  end

  def visit_issues(*args)
    visit issues_dashboard_path(*args)
  end
end

