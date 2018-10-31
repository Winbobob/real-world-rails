require 'spec_helper'

describe UsersController do
  render_views

  let!(:user) { FactoryGirl.create(:admin) }
  let(:team) { FactoryGirl.create(:team) }
  let(:password) { 'yolo123' }
  let(:valid_user_attributes) { { given_name: 'Dolan', name: 'Duck', email: 'doland@example.com', team_ids: [team.id], password: password, password_confirmation: password } }

  context 'for non-signed in users' do
    describe 'GET "edit"' do
      it 'redirects to login' 

    end

    describe 'GET "new"' do
      it 'redirects to login' 

    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'redirects to login' 


        it 'does not change any attributes' 

      end
    end

    describe 'PUT "update"' do
      context 'with valid attributes' do
        it 'redirects to login' 


        it 'does not change any attributes' 

      end
    end

    describe 'DELETE "destroy"' do
      it 'redirects to login' 


      it 'does not delete the user' 

    end

    describe 'PUT "activate"' do
      it 'redirects to login' 

    end

    describe 'PUT "deactivate"' do
      it 'redirects to login' 

    end
  end

  context 'for signed-in users' do
    before do
      test_sign_in user
    end

    describe 'GET "edit"' do
      it 'assigns the to-be edited user to @user' 


      it 'renders the :edit template' 

    end

    describe 'GET "new"' do
      it 'assigns the to-be edited user to @user' 


      it 'renders the :new template' 

    end

    describe 'PUT "update"' do
      context 'with valid attributes' do
        it 'changes user\'s attributes' 


        it "changes user's team association" 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not change user\'s attributes' 


        it 're-renders the :edit template' 

      end
    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'creates a user' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not create a user' 


        it 're-renders the :edit template' 

      end
    end

    describe 'DELETE "destroy"' do
      it 'does delete a user' 


      it 'does delete the user' 

    end

    describe 'PUT "activate"' do
      let(:inactive_user) { FactoryGirl.create(:user, active: false) }

      it 'activates the user' 


      it 'redirects to the overview' 

    end

    describe 'PUT "deactivate"' do
      let(:active_user) { FactoryGirl.create(:user, active: true) }

      it 'deactivates the user' 


      it 'redirects to the overview' 

    end
  end
end

