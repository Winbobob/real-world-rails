require 'rails_helper'

describe 'Issue Boards', :js do
  include DragTo
  include MobileHelpers

  let(:group) { create(:group, :nested) }
  let(:project) { create(:project, :public, namespace: group) }
  let(:board)   { create(:board, project: project) }
  let(:user)    { create(:user) }
  let!(:user2)  { create(:user) }

  before do
    project.add_master(user)
    project.add_master(user2)

    set_cookie('sidebar_collapsed', 'true')

    sign_in(user)
  end

  context 'no lists' do
    before do
      visit project_board_path(project, board)
      wait_for_requests
      expect(page).to have_selector('.board', count: 3)
    end

    it 'shows blank state' 


    it 'shows tooltip on add issues button' 


    it 'hides the blank state when clicking nevermind button' 


    it 'creates default lists' 

  end

  context 'with lists' do
    let(:milestone) { create(:milestone, project: project) }

    let(:planning)    { create(:label, project: project, name: 'Planning', description: 'Test') }
    let(:development) { create(:label, project: project, name: 'Development') }
    let(:testing)     { create(:label, project: project, name: 'Testing') }
    let(:bug)         { create(:label, project: project, name: 'Bug') }
    let!(:backlog)    { create(:label, project: project, name: 'Backlog') }
    let!(:closed)       { create(:label, project: project, name: 'Closed') }
    let!(:accepting)  { create(:label, project: project, name: 'Accepting Merge Requests') }
    let!(:a_plus) { create(:label, project: project, name: 'A+') }

    let!(:list1) { create(:list, board: board, label: planning, position: 0) }
    let!(:list2) { create(:list, board: board, label: development, position: 1) }

    let!(:confidential_issue) { create(:labeled_issue, :confidential, project: project, author: user, labels: [planning], relative_position: 9) }
    let!(:issue1) { create(:labeled_issue, project: project, title: 'aaa', description: '111', assignees: [user], labels: [planning], relative_position: 8) }
    let!(:issue2) { create(:labeled_issue, project: project, title: 'bbb', description: '222', author: user2, labels: [planning], relative_position: 7) }
    let!(:issue3) { create(:labeled_issue, project: project, title: 'ccc', description: '333', labels: [planning], relative_position: 6) }
    let!(:issue4) { create(:labeled_issue, project: project, title: 'ddd', description: '444', labels: [planning], relative_position: 5) }
    let!(:issue5) { create(:labeled_issue, project: project, title: 'eee', description: '555', labels: [planning], milestone: milestone, relative_position: 4) }
    let!(:issue6) { create(:labeled_issue, project: project, title: 'fff', description: '666', labels: [planning, development], relative_position: 3) }
    let!(:issue7) { create(:labeled_issue, project: project, title: 'ggg', description: '777', labels: [development], relative_position: 2) }
    let!(:issue8) { create(:closed_issue, project: project, title: 'hhh', description: '888') }
    let!(:issue9) { create(:labeled_issue, project: project, title: 'iii', description: '999', labels: [planning, testing, bug, accepting], relative_position: 1) }
    let!(:issue10) { create(:labeled_issue, project: project, title: 'issue +', description: 'A+ great issue', labels: [a_plus]) }

    before do
      visit project_board_path(project, board)

      wait_for_requests

      expect(page).to have_selector('.board', count: 4)
      expect(find('.board:nth-child(2)')).to have_selector('.card')
      expect(find('.board:nth-child(3)')).to have_selector('.card')
      expect(find('.board:nth-child(4)')).to have_selector('.card')
    end

    it 'shows description tooltip on list title' 


    it 'shows issues in lists' 


    it 'shows confidential issues with icon' 


    it 'search closed list' 


    it 'search list' 


    it 'allows user to delete board' 


    it 'removes checkmark in new list dropdown after deleting' 


    it 'infinite scrolls list' 


    context 'closed' do
      it 'shows list of closed issues' 


      it 'moves issue to closed' 


      it 'removes all of the same issue to closed' 

    end

    context 'lists' do
      it 'changes position of list' 


      it 'issue moves between lists' 


      it 'issue moves between lists' 


      it 'issue moves from closed' 


      context 'issue card' do
        it 'shows assignee' 

      end

      context 'new list' do
        it 'shows all labels in new list dropdown' 


        it 'creates new list for label' 


        it 'creates new list for Backlog label' 


        it 'creates new list for Closed label' 


        it 'keeps dropdown open after adding new list' 


        it 'creates new list from a new label' 

      end
    end

    context 'filtering' do
      it 'filters by author' 


      it 'filters by assignee' 


      it 'filters by milestone' 


      it 'filters by label' 


      it 'filters by label with encoded character' 


      it 'filters by label with space after reload' 


      it 'removes filtered labels' 


      it 'infinite scrolls list with label filter' 


      it 'filters by multiple labels' 


      it 'filters by clicking label button on issue' 


      it 'removes label filter by clicking label button on issue' 

    end
  end

  context 'keyboard shortcuts' do
    before do
      visit project_board_path(project, board)
      wait_for_requests
    end

    it 'allows user to use keyboard shortcuts' 

  end

  context 'signed out user' do
    before do
      sign_out(:user)
      visit project_board_path(project, board)
      wait_for_requests
    end

    it 'displays lists' 


    it 'does not show create new list' 


    it 'does not allow dragging' 

  end

  context 'as guest user' do
    let(:user_guest) { create(:user) }

    before do
      project.add_guest(user_guest)
      sign_out(:user)
      sign_in(user_guest)
      visit project_board_path(project, board)
      wait_for_requests
    end

    it 'does not show create new list' 

  end

  def drag(selector: '.board-list', list_from_index: 0, from_index: 0, to_index: 0, list_to_index: 0)
    # ensure there is enough horizontal space for four boards
    resize_window(2000, 800)

    drag_to(selector: selector,
            scrollable: '#board-app',
            list_from_index: list_from_index,
            from_index: from_index,
            to_index: to_index,
            list_to_index: list_to_index)
  end

  def wait_for_board_cards(board_number, expected_cards)
    page.within(find(".board:nth-child(#{board_number})")) do
      expect(page.find('.board-header')).to have_content(expected_cards.to_s)
      expect(page).to have_selector('.card', count: expected_cards)
    end
  end

  def wait_for_empty_boards(board_numbers)
    board_numbers.each do |board|
      wait_for_board_cards(board, 0)
    end
  end

  def set_filter(type, text)
    find('.filtered-search').native.send_keys("#{type}:#{text}")
  end

  def submit_filter
    find('.filtered-search').native.send_keys(:enter)
  end

  def click_filter_link(link_text)
    page.within('.filtered-search-box') do
      expect(page).to have_button(link_text)

      click_button(link_text)
    end
  end
end

