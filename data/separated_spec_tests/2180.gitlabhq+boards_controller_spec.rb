require 'spec_helper'

describe Groups::BoardsController do
  let(:group) { create(:group) }
  let(:user)  { create(:user) }

  before do
    group.add_maintainer(user)
    sign_in(user)
  end

  describe 'GET index' do
    it 'creates a new board when group does not have one' 


    context 'when format is HTML' do
      it 'renders template' 


      it 'redirects to latest visited board' 


      it 'renders template if visited board is not found' 


      context 'with unauthorized user' do
        before do
          allow(Ability).to receive(:allowed?).with(user, :read_cross_project, :global).and_return(true)
          allow(Ability).to receive(:allowed?).with(user, :read_group, group).and_return(false)
        end

        it 'returns a not found 404 response' 

      end

      context 'when user is signed out' do
        let(:group) { create(:group, :public) }

        it 'renders template' 

      end
    end

    context 'when format is JSON' do
      it 'return an array with one group board' 


      context 'with unauthorized user' do
        before do
          allow(Ability).to receive(:allowed?).with(user, :read_cross_project, :global).and_return(true)
          allow(Ability).to receive(:allowed?).with(user, :read_group, group).and_return(false)
        end

        it 'returns a not found 404 response' 

      end
    end

    def list_boards(format: :html)
      get :index, group_id: group, format: format
    end
  end

  describe 'GET show' do
    let!(:board) { create(:board, group: group) }

    context 'when format is HTML' do
      it 'renders template' 


      context 'with unauthorized user' do
        before do
          allow(Ability).to receive(:allowed?).with(user, :read_cross_project, :global).and_return(true)
          allow(Ability).to receive(:allowed?).with(user, :read_group, group).and_return(false)
        end

        it 'returns a not found 404 response' 

      end

      context 'when user is signed out' do
        let(:group) { create(:group, :public) }

        it 'does not save visit' 

      end
    end

    context 'when format is JSON' do
      it 'returns project board' 


      context 'with unauthorized user' do
        before do
          allow(Ability).to receive(:allowed?).with(user, :read_cross_project, :global).and_return(true)
          allow(Ability).to receive(:allowed?).with(user, :read_group, group).and_return(false)
        end

        it 'returns a not found 404 response' 

      end
    end

    context 'when board does not belong to group' do
      it 'returns a not found 404 response' 

    end

    def read_board(board:, format: :html)
      get :show, group_id: group,
                 id: board.to_param,
                 format: format
    end
  end
end

