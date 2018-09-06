require 'rails_helper'

describe 'Issue Boards add issue modal', :js do
  let(:project) { create(:project, :public) }
  let(:board) { create(:board, project: project) }
  let(:user) { create(:user) }
  let!(:planning) { create(:label, project: project, name: 'Planning') }
  let!(:label) { create(:label, project: project) }
  let!(:list1) { create(:list, board: board, label: planning, position: 0) }
  let!(:list2) { create(:list, board: board, label: label, position: 1) }
  let!(:issue) { create(:issue, project: project, title: 'abc', description: 'def') }
  let!(:issue2) { create(:issue, project: project, title: 'hij', description: 'klm') }

  before do
    project.add_master(user)

    sign_in(user)

    visit project_board_path(project, board)
    wait_for_requests
  end

  it 'resets filtered search state' 


  context 'modal interaction' do
    it 'opens modal' 


    it 'closes modal' 


    it 'closes modal if cancel button clicked' 


    it 'does not show tooltip on add issues button' 

  end

  context 'issues list' do
    before do
      click_button('Add issues')

      wait_for_requests
    end

    it 'loads issues' 


    it 'shows selected issues' 


    context 'list dropdown' do
      it 'resets after deleting list' 

    end

    context 'search' do
      it 'returns issues' 


      it 'returns no issues' 

    end

    context 'selecing issues' do
      it 'selects single issue' 


      it 'changes button text' 


      it 'changes button text with plural' 


      it 'shows only selected issues on selected tab' 


      it 'selects all issues' 


      it 'deselects all issues' 


      it 'selects all that arent already selected' 


      it 'unselects from selected tab' 

    end

    context 'adding issues' do
      it 'adds to board' 


      it 'adds to second list' 

    end
  end
end

