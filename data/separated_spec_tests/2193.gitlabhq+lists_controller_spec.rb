require 'spec_helper'

describe Boards::ListsController do
  let(:project) { create(:project) }
  let(:board)   { create(:board, project: project) }
  let(:user)    { create(:user) }
  let(:guest)   { create(:user) }

  before do
    project.add_maintainer(user)
    project.add_guest(guest)
  end

  describe 'GET index' do
    it 'returns a successful 200 response' 


    it 'returns a list of board lists' 


    context 'with unauthorized user' do
      before do
        allow(Ability).to receive(:allowed?).with(user, :read_project, project).and_return(true)
        allow(Ability).to receive(:allowed?).with(user, :read_list, project).and_return(false)
      end

      it 'returns a forbidden 403 response' 

    end

    def read_board_list(user:, board:)
      sign_in(user)

      get :index, namespace_id: project.namespace.to_param,
                  project_id: project,
                  board_id: board.to_param,
                  format: :json
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      let(:label) { create(:label, project: project, name: 'Development') }

      it 'returns a successful 200 response' 


      it 'returns the created list' 

    end

    context 'with invalid params' do
      context 'when label is nil' do
        it 'returns a not found 404 response' 

      end

      context 'when label that does not belongs to project' do
        it 'returns a not found 404 response' 

      end
    end

    context 'with unauthorized user' do
      it 'returns a forbidden 403 response' 

    end

    def create_board_list(user:, board:, label_id:)
      sign_in(user)

      post :create, namespace_id: project.namespace.to_param,
                    project_id: project,
                    board_id: board.to_param,
                    list: { label_id: label_id },
                    format: :json
    end
  end

  describe 'PATCH update' do
    let!(:planning)    { create(:list, board: board, position: 0) }
    let!(:development) { create(:list, board: board, position: 1) }

    context 'with valid position' do
      it 'returns a successful 200 response' 


      it 'moves the list to the desired position' 

    end

    context 'with invalid position' do
      it 'returns an unprocessable entity 422 response' 

    end

    context 'with invalid list id' do
      it 'returns a not found 404 response' 

    end

    context 'with unauthorized user' do
      it 'returns a forbidden 403 response' 

    end

    def move(user:, board:, list:, position:)
      sign_in(user)

      params = { namespace_id: project.namespace.to_param,
                 project_id: project,
                 board_id: board.to_param,
                 id: list.to_param,
                 list: { position: position },
                 format: :json }

      if Gitlab.rails5?
        patch :update, params: params, as: :json
      else
        patch :update, params
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:planning) { create(:list, board: board, position: 0) }

    context 'with valid list id' do
      it 'returns a successful 200 response' 


      it 'removes list from board' 

    end

    context 'with invalid list id' do
      it 'returns a not found 404 response' 

    end

    context 'with unauthorized user' do
      it 'returns a forbidden 403 response' 

    end

    def remove_board_list(user:, board:, list:)
      sign_in(user)

      delete :destroy, namespace_id: project.namespace.to_param,
                       project_id: project,
                       board_id: board.to_param,
                       id: list.to_param,
                       format: :json
    end
  end

  describe 'POST generate' do
    context 'when board lists is empty' do
      it 'returns a successful 200 response' 


      it 'returns the defaults lists' 

    end

    context 'when board lists is not empty' do
      it 'returns an unprocessable entity 422 response' 

    end

    context 'with unauthorized user' do
      it 'returns a forbidden 403 response' 

    end

    def generate_default_lists(user:, board:)
      sign_in(user)

      post :generate, namespace_id: project.namespace.to_param,
                      project_id: project,
                      board_id: board.to_param,
                      format: :json
    end
  end
end

