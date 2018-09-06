require 'rails_helper'

describe 'Issue Boards', :js do
  include DragTo

  let(:project) { create(:project, :public) }
  let(:board) { create(:board, project: project) }
  let(:user) { create(:user) }
  let(:label) { create(:label, project: project) }
  let!(:list1) { create(:list, board: board, label: label, position: 0) }
  let!(:issue1) { create(:labeled_issue, project: project, title: 'testing 1', labels: [label], relative_position: 3) }
  let!(:issue2) { create(:labeled_issue, project: project, title: 'testing 2', labels: [label], relative_position: 2) }
  let!(:issue3) { create(:labeled_issue, project: project, title: 'testing 3', labels: [label], relative_position: 1) }

  before do
    project.add_master(user)

    sign_in(user)
  end

  context 'un-ordered issues' do
    let!(:issue4) { create(:labeled_issue, project: project, labels: [label]) }

    before do
      visit project_board_path(project, board)
      wait_for_requests

      expect(page).to have_selector('.board', count: 3)
    end

    it 'has un-ordered issue as last issue' 


    it 'moves un-ordered issue to top of list' 

  end

  context 'ordering in list' do
    before do
      visit project_board_path(project, board)
      wait_for_requests

      expect(page).to have_selector('.board', count: 3)
    end

    it 'moves from middle to top' 


    it 'moves from middle to bottom' 


    it 'moves from top to bottom' 


    it 'moves from bottom to top' 


    it 'moves from top to middle' 


    it 'moves from bottom to middle' 

  end

  context 'ordering when changing list' do
    let(:label2) { create(:label, project: project) }
    let!(:list2) { create(:list, board: board, label: label2, position: 1) }
    let!(:issue4) { create(:labeled_issue, project: project, title: 'testing 1', labels: [label2], relative_position: 3.0) }
    let!(:issue5) { create(:labeled_issue, project: project, title: 'testing 2', labels: [label2], relative_position: 2.0) }
    let!(:issue6) { create(:labeled_issue, project: project, title: 'testing 3', labels: [label2], relative_position: 1.0) }

    before do
      visit project_board_path(project, board)
      wait_for_requests

      expect(page).to have_selector('.board', count: 4)
    end

    it 'moves to top of another list' 


    it 'moves to bottom of another list' 


    it 'moves to index of another list' 

  end

  def drag(selector: '.board-list', list_from_index: 1, from_index: 0, to_index: 0, list_to_index: 1)
    drag_to(selector: selector,
            scrollable: '#board-app',
            list_from_index: list_from_index,
            from_index: from_index,
            to_index: to_index,
            list_to_index: list_to_index)
  end
end

