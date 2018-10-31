require 'spec_helper'

describe Reports::AbsenceController do
  render_views

  let(:user) { FactoryGirl.create(:user) }
  let(:year) { 2013 }
  let(:month) { 3 }

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do

    before do
      test_sign_in user
    end

    describe 'GET "year"' do
      it 'assigns the correct instance variables' 


      it 'renders the :year template' 

    end

    describe 'GET "month"' do
      it 'assigns the correct instance variables' 


      it 'renders the :month template' 

    end

    describe 'GET "calendar"' do
      it 'assigns the correct instance variables' 


      it 'renders the :calendar template' 


      context 'without a month set' do
        it 'assigns the selected range' 


        context 'without a year set' do
          it 'assigns the current year as range' 

        end
      end

      describe 'special rights' do
        let!(:another_team) { FactoryGirl.create(:team) }
        let!(:another_user) { FactoryGirl.create(:user, teams: [another_team]) }
        let!(:deactivated_user) { FactoryGirl.create(:user, active: false, teams: [another_team]) }

        it 'shows all users for all users' 


        it 'shows all teams for all users' 


        it 'loads the requested teams' 


        it 'does not show deactivated users' 

      end
    end
  end

end

