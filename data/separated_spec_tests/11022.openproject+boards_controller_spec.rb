#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

require 'spec_helper'

describe BoardsController, type: :controller do
  let(:user) { FactoryBot.build(:user) }
  let(:project) { FactoryBot.create(:project) }
  let!(:board) {
    FactoryBot.build(:board,
                      project: project)
  }

  before do
    disable_flash_sweep
  end

  describe '#create' do
    let(:params) { { project_id: project.id, board: board_params } }
    let(:board_params) { { name: 'my board', description: 'awesome board' } }

    before do
      expect(@controller).to receive(:authorize)
      expect(@controller).to receive(:find_project_by_project_id) do
        @controller.instance_variable_set(:@project, project)
      end

      # parameter expectation needs to have strings as keys
      expect(Board)
        .to receive(:new)
        .with(ActionController::Parameters.new(board_params).permit!)
        .and_return(board)
    end

    describe 'w/ the params beeing valid' do
      before do
        expect(board).to receive(:save).and_return(true)

        as_logged_in_user user do
          post :create, params: params
        end
      end

      it 'should redirect to the settings page if successful' 


      it 'have a successful creation flash' 

    end

    describe 'w/ the params beeing invalid' do
      before do
        expect(board).to receive(:save).and_return(false)

        as_logged_in_user user do
          post :create, params: params
        end
      end

      it 'should render the new template' 

    end
  end

  describe '#move' do
    let(:project) { FactoryBot.create(:project) }
    let!(:board_1) {
      FactoryBot.create(:board,
                         project: project,
                         position: 1)
    }
    let!(:board_2) {
      FactoryBot.create(:board,
                         project: project,
                         position: 2)
    }

    before do allow(@controller).to receive(:authorize).and_return(true) end

    describe '#higher' do
      let(:move_to) { 'higher' }
      let(:redirect_url) { "http://test.host/projects/#{project.id}/settings/boards" }

      before do
        post 'move', params: { id: board_2.id,
                               project_id: board_2.project_id,
                               board: { move_to: move_to } }
      end

      it do expect(board_2.reload.position).to eq(1) end

      it do expect(response).to be_redirect end

      it do expect(response).to redirect_to(redirect_url) end
    end
  end

  describe '#update' do
    let!(:board) {
      FactoryBot.create(:board, name: 'Board name',
                                 description: 'Board description')
    }

    before do
      expect(@controller).to receive(:authorize)
    end

    describe 'w/ the params beeing valid' do
      before do
        as_logged_in_user user do
          put :update, params: { id: board.id,
                                 project_id: board.project_id,
                                 board: { name: 'New name', description: 'New description' } }
        end
      end

      it 'should redirect to the settings page if successful' 


      it 'have a successful update flash' 


      it 'should change the database entry' 

    end

    describe 'w/ the params beeing invalid' do
      before do
        as_logged_in_user user do
          post :update, params: { id: board.id,
                                  project_id: board.project_id,
                                  board: { name: '', description: 'New description' } }
        end
      end

      it 'should render the edit template' 


      it 'should not change the database entry' 

    end
  end

  describe '#sticky' do
    let!(:message1) { FactoryBot.create(:message, board: board) }
    let!(:message2) { FactoryBot.create(:message, board: board) }
    let!(:sticked_message1) {
      FactoryBot.create(:message, board_id: board.id,
                                   subject: 'How to',
                                   content: 'How to install this cool app',
                                   sticky: '1',
                                   sticked_on: Time.now - 2.minute)
    }

    let!(:sticked_message2) {
      FactoryBot.create(:message, board_id: board.id,
                                   subject: 'FAQ',
                                   content: 'Frequestly asked question',
                                   sticky: '1',
                                   sticked_on:
                                   Time.now - 1.minute)
    }

    describe 'all sticky messages' do
      before do
        expect(@controller).to receive(:authorize)
        get :show, params: { project_id: project.id, id: board.id }
      end

      it 'renders show' 

      it 'should be displayed on top' 

    end

    describe 'edit a sticky message' do
      before(:each) do
        sticked_message1.sticky = 0
        sticked_message1.save!
      end

      describe 'when sticky is unset from message' do
        before do
          expect(@controller).to receive(:authorize)
          get :show, params: { project_id: project.id, id: board.id }
        end

        it 'it should not be displayed as sticky message' 

      end

      describe 'when sticky is set back to message' do
        before do
          sticked_message1.sticky = 1
          sticked_message1.save!

          expect(@controller).to receive(:authorize)
          get :show, params: { project_id: project.id, id: board.id }
        end

        it 'it should not be displayed on first position' 

      end
    end
  end
end

