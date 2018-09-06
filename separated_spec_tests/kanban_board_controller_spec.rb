require 'rails_helper'

module Api
  RSpec.describe BoardsController, type: :controller do
    before(:each) do
      request.env['HTTP_ACCEPT'] = 'application/json'
    end

    context 'as a guest user' do
      describe 'GET #index' do
        it 'requires login' 

      end

      describe 'GET #show' do
        it 'requires login' 

      end

      describe 'POST #create' do
        it 'requires login' 

      end

      describe 'PATCH #update' do
        it 'requires login' 

      end
    end

    context 'as a logged in user' do
      let(:user) { create(:user) }
      let(:user2) { create(:user) }
      let!(:boards) { create_list(:board, 3, member: user) }
      let!(:boards2) { create_list(:board, 2, member: user2) }

      before(:each) { set_user_session(user) }

      describe 'GET #index' do
        it 'returns boards JSON for given user' 


        it 'does not returns boards JSON for other users' 

      end

      describe 'GET #show' do
        context 'when logged in user is a member of board' do
          it 'shows board JSON' 

        end

        context 'when logged in user is not a member of board' do
          it 'raises 404' 

        end
      end

      describe 'POST #create' do
        it 'creates a new board'
      end

      describe 'PATCH #update' do
        it 'updates board'
      end
    end
  end
end

