require 'rails_helper'

describe 'Issue Boards add issue modal filtering', :js do
  let(:project) { create(:project, :public) }
  let(:board) { create(:board, project: project) }
  let(:planning) { create(:label, project: project, name: 'Planning') }
  let!(:list1) { create(:list, board: board, label: planning, position: 0) }
  let(:user) { create(:user) }
  let(:user2) { create(:user) }
  let!(:issue1) { create(:issue, project: project) }

  before do
    project.add_master(user)

    sign_in(user)
  end

  it 'shows empty state when no results found' 


  it 'restores filters when closing' 


  it 'resotres filters after clicking clear button' 


  context 'author' do
    let!(:issue) { create(:issue, project: project, author: user2) }

    before do
      project.add_developer(user2)

      visit_board
    end

    it 'filters by selected user' 

  end

  context 'assignee' do
    let!(:issue) { create(:issue, project: project, assignees: [user2]) }

    before do
      project.add_developer(user2)

      visit_board
    end

    it 'filters by unassigned' 


    it 'filters by selected user' 

  end

  context 'milestone' do
    let(:milestone) { create(:milestone, project: project) }
    let!(:issue) { create(:issue, project: project, milestone: milestone) }

    before do
      visit_board
    end

    it 'filters by upcoming milestone' 


    it 'filters by selected milestone' 

  end

  context 'label' do
    let(:label) { create(:label, project: project) }
    let!(:issue) { create(:labeled_issue, project: project, labels: [label]) }

    before do
      visit_board
    end

    it 'filters by no label' 


    it 'filters by label' 

  end

  def visit_board
    visit project_board_path(project, board)
    wait_for_requests

    click_button('Add issues')
  end

  def set_filter(type, text = '')
    find('.add-issues-modal .filtered-search').native.send_keys("#{type}:#{text}")
  end

  def submit_filter
    find('.add-issues-modal .filtered-search').native.send_keys(:enter)
  end

  def click_filter_link(link_text)
    page.within('.add-issues-modal .filtered-search-box') do
      expect(page).to have_button(link_text)

      click_button(link_text)
    end
  end
end

