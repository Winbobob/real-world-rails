require 'spec_helper'

describe TeamsController do
  render_views

  let!(:admin) { FactoryGirl.create(:admin) }
  let(:valid_team_attributes) { { name: 'Pro Gamers' } }
  let!(:team) { FactoryGirl.create :team }

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


        it 'does create a team' 

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


      it 'does not delete the team' 

    end
  end

  context 'for signed-in admins' do
    before do
      test_sign_in admin
    end

    describe 'GET "edit"' do
      it 'assigns the to-be edited team to @team' 


      it 'renders the :edit template' 

    end

    describe 'GET "new"' do
      it 'assigns the to-be edited team to @team' 


      it 'renders the :new template' 

    end

    describe 'PUT "update"' do
      context 'with valid attributes' do
        it 'changes team\'s attributes' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not change team\'s attributes' 


        it 're-renders the :edit template' 

      end
    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        it 'creates a team' 


        it 'redirects to the overview' 

      end

      context 'with invalid attributes' do
        it 'does not create a team' 


        it 're-renders the :edit template' 

      end
    end

    describe 'DELETE "destroy"' do
      it 'does delete a team' 


      it 'does delete the team' 

    end

  end
end

