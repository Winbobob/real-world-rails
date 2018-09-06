require 'spec_helper'


describe ComparisonController do

  let(:team) { FactoryGirl.create(:team) }

  let(:user) { FactoryGirl.create(:user, teams: [team]) }
  let(:team_leader) { FactoryGirl.create(:team_leader, teams: [team]) }
  let(:admin) { FactoryGirl.create(:admin) }

  def get_show(user_id = user.id)
    get :show, user_id: user_id, date: Date.current
  end

  describe 'access' do
    context 'for non-signed in users' do
      it 'redirects to login' 

    end

    context 'for signed-in users' do
      before do
        test_sign_in user
      end

      describe 'GET "show"' do
        context 'with own user' do
          it 'grants access' 

        end

        context 'with other user' do
          it 'denies access' 

        end
      end
    end

    context 'for signed-in teamleaders' do
      before do
        test_sign_in team_leader
      end

      describe 'GET "show"' do
        it 'grants access' 

      end
    end

    context 'for signed-in admins' do
      before do
        test_sign_in admin
      end

      describe 'GET "show"' do
        it 'grants access' 

      end
    end
  end

  describe 'GET "show"' do
    before do
      test_sign_in user
      get_show
    end

    it 'assigns the correct instance variables' 


    it 'renders the :table template' 

  end
end

