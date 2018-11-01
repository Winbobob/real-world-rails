require 'spec_helper'

describe AbsencesController do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }

  context 'for signed-in admins' do

    before do
      test_sign_in admin
    end

    describe 'GET "index"' do
      let(:attributes) { {user_id: user.id, year: 2013} }
      it 'assigns @time_types' 


      describe '@absences' do
        let!(:absence_of_another_user) { FactoryGirl.create(:absence, start_date: '2013-04-01', end_date: '2013-04-01') }
        let!(:absence) { FactoryGirl.create(:absence, start_date: '2013-01-01', end_date: '2013-01-02', user: user) }

        it 'assigns the absences of the current user' 

      end

      it 'handles a year parameter' 


      it 'assigns @public_holidays' 

    end

    describe 'GET "new"' do

      it 'assigns @time_types' 


      it 'ensures the absence has an empty recurring schedule' 


      context 'html' do
        it 'renders the new template' 

      end

      context 'xhr' do
        it 'renders the new template' 

      end

    end

    describe 'POST "create"' do
      let(:start_date) { Date.today + 1.year }

      context 'with valid data' do
        it 'creates a new absence' 


        it 'redirects to the absence view of the year of the new created absence' 

      end

      context 'with missing weekly_repeat_interval' do
        let(:schedule_attributes) { { active: 1, ends_date: Date.today + 2.years, weekly_repeat_interval: nil } }
        let(:absence_attributes) { FactoryGirl.attributes_for(:absence, time_type_id: TEST_TIME_TYPES[:vacation].id, start_date: start_date).merge(schedule_attributes: schedule_attributes)}
        it 'responds with the right status code' 

      end
    end

    describe 'GET "edit"' do
      let(:absence) { FactoryGirl.create(:absence, user: user) }

      it 'assigns @time_types' 


      it 'ensures the absence has a recurring schedule' 


      context 'html' do
        it 'renders the new template' 

      end

      context 'xhr' do
        it 'renders the new template' 

      end

    end

    describe 'PUT "update"' do
      let(:absence) { FactoryGirl.create(:absence, user: user) }
      it 'updates the absence' 


      it 'redirects to the absence view of the year of the updated absence' 

    end

    describe 'DELETE "destroy"' do
      let(:absence) { FactoryGirl.create(:absence, user: user) }

      it 'removes absence' 


      it 'redirects to the absence view of the year of the removed absence' 

    end

  end
end

