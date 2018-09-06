require 'rails_helper'

describe 'Issue Boards new issue', :js do
  let(:project) { create(:project, :public) }
  let(:board)   { create(:board, project: project) }
  let!(:list)   { create(:list, board: board, position: 0) }
  let(:user)    { create(:user) }

  context 'authorized user' do
    before do
      project.add_master(user)

      sign_in(user)

      visit project_board_path(project, board)
      wait_for_requests

      expect(page).to have_selector('.board', count: 3)
    end

    it 'displays new issue button' 


    it 'does not display new issue button in closed list' 


    it 'shows form when clicking button' 


    it 'hides form when clicking cancel' 


    it 'creates new issue' 


    it 'shows sidebar when creating new issue' 

  end

  context 'unauthorized user' do
    before do
      visit project_board_path(project, board)
      wait_for_requests
    end

    it 'does not display new issue button' 

  end
end

