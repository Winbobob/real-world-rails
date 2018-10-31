# encoding: UTF-8

require 'spec_helper'

describe TimeEntriesController do
  render_views

  context 'for non-signed in users' do
    it 'redirects to login' 

  end

  context 'for signed-in users' do
    let(:user) { FactoryGirl.create(:user) }
    let(:time_entry) { FactoryGirl.create(:time_entry, user: user) }

    before do
      test_sign_in user
    end

    describe 'GET "index"' do
      let(:date) { '2013-01-01'.to_date }
      let!(:time_entry_late) { FactoryGirl.create(:time_entry, start_date: date, end_date: date, user: user, start_time: '15:00', end_time: '16:00') }
      let!(:time_entry_early) { FactoryGirl.create(:time_entry, start_date: date, end_date: date, user: user, start_time: '10:00', end_time: '12:00') }

      before do
        get :index, user_id: user.id, date: date
      end

      subject { response }

      it 'assigns sorted @time_spans_of_time_entries' 


      it { should render_template(:index) }
      it { assigns(:weekdays).should be_instance_of(Array)}
    end

    describe 'GET "new"' do
      it 'sets the start date if provided' 

    end

    describe 'PUT "update"' do
      before do
        time_entry = FactoryGirl.create(:time_entry, user: user, start_date: '2013-02-01', end_date: '2013-02-01', start_time: '06:00', end_time: '09:00:00')
      end

      context 'with valid attributes' do
        it 'changes time_entry\'s attributes' 


        it 'redirects to the sheet overview' 


        it 'updates start and end date of the corresponding time entry' 


        it 'does not set the end date to tomorrow if the time is the same' 


        it 'will restart a timer when the end time is empty' 

      end

      context 'with invalid attributes' do
        it 're-renders the :edit template' 

      end
    end

    describe 'POST "create"' do
      context 'with valid attributes' do
        let(:time_type) { TEST_TIME_TYPES[:work] }

        it 'creates a new single entry' 


        it 'returns empty json (no errors)' 


        it 'creates a timer on the selected date' 


        it 'understands a time range which spans over midnight' 


        it 'creates the entry for the selected user' 

      end

      context 'with invalid attributes' do
        it 'does not save the new single entry' 


        it 'returns json errors' 

      end
    end

    describe 'DELETE "destroy"' do

      it 'deletes the entry' 

    end

    describe 'GET "summary_for_date"' do
      it 'assigns the correct instance variables' 


      it 'limits the timer duration to the range of the requested day' 


      it 'adds the timer duration to the total' 

    end

    describe 'PUT "stop_timer"' do
      let!(:timer) { FactoryGirl.create(:timer, user: user) }

      it 'stops the running timer of this day' 

    end
  end
end

