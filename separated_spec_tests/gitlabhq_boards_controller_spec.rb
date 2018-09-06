require 'spec_helper'

describe Projects::BoardsController do
  let(:project) { create(:project) }
  let(:user)    { create(:user) }

  before do
    project.add_master(user)
    sign_in(user)
  end

  describe 'GET index' do
    it 'creates a new project board when project does not have one' 


    it 'sets boards_endpoint instance variable to a boards path' 


    context 'when format is HTML' do
      it 'renders template' 

    end

    context 'when format is JSON' do
      it 'returns a list of project boards' 

    end

    context 'with unauthorized user' do
      before do
        allow(Ability).to receive(:allowed?).with(user, :read_project, project).and_return(true)
        allow(Ability).to receive(:allowed?).with(user, :read_board, project).and_return(false)
      end

      it 'returns a not found 404 response' 

    end

    context 'issues are disabled' do
      let(:project) { create(:project, :issues_disabled) }

      it 'returns a not found 404 response' 

    end

    def list_boards(format: :html)
      get :index, namespace_id: project.namespace,
                  project_id: project,
                  format: format
    end
  end

  describe 'GET show' do
    let!(:board) { create(:board, project: project) }

    it 'sets boards_endpoint instance variable to a boards path' 


    context 'when format is HTML' do
      it 'renders template' 

    end

    context 'when format is JSON' do
      it 'returns project board' 

    end

    context 'with unauthorized user' do
      before do
        allow(Ability).to receive(:allowed?).with(user, :read_project, project).and_return(true)
        allow(Ability).to receive(:allowed?).with(user, :read_board, project).and_return(false)
      end

      it 'returns a not found 404 response' 

    end

    context 'when board does not belong to project' do
      it 'returns a not found 404 response' 

    end

    def read_board(board:, format: :html)
      get :show, namespace_id: project.namespace,
                 project_id: project,
                 id: board.to_param,
                 format: format
    end
  end
end

