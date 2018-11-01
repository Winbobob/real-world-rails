require 'spec_helper'

describe API::User::Resources::Timer do
  include Warden::Test::Helpers

  let(:api_user) { FactoryGirl.create(:user) }
  let(:json) { JSON.parse(response.body) }

  before do
    login_as api_user
  end

  describe 'POST /api/timer' do
    context 'with only required attributes' do
      before do
        Timecop.freeze('2013-07-20T13:00:00+0200')
        post '/api/timer', { time_type_id: TEST_TIME_TYPES[:work].id }
      end

      subject { json }

      its(['start']) { should eq('13:00') }
      its(['date']) { should eq('2013-07-20') }
      its(['end']) { should be_nil }
      its(['duration']) { should eq('00:00') }
    end

    context 'with start time and date supplied' do
      before do
        Timecop.freeze('2013-07-20T01:00:00+0200')
        post '/api/timer', { time_type_id: TEST_TIME_TYPES[:work].id, date: '2013-07-19', start: '23:00' }
      end

      subject { json }

      its(['start']) { should eq('23:00') }
      its(['date']) { should eq('2013-07-19') }
      its(['end']) { should be_nil }
      its(['duration']) { should eq('02:00') }
    end

    describe 'validations' do
      it 'validates the presence of time type' 


      it 'makes sure that the supplied time type is not an absence time type' 


      it 'validates the date' 


      it 'validates the time' 

    end
  end

  describe 'PUT /api/timer' do
    context 'with an active timer' do
      let!(:timer) { FactoryGirl.create(:timer, user: api_user, start_date: '2013-07-20', start_time: '08:00') }

      before do
        Timecop.freeze('2013-07-20T13:00:00+0200')
      end

      describe 'updating of the attributes' do
        before do
          put '/api/timer', { date: '2013-07-30', start: '15:00', end: '18:00' }
        end

        subject { json }

        its(['start']) { should eq('15:00') }
        its(['end']) { should eq('18:00') }
        its(['date']) { should eq('2013-07-30') }
        its(['duration']) { should eq('03:00') }
      end

      describe 'stopping timer with end = now' do
        before do
          put '/api/timer', { end: 'now' }
        end

        subject { json }

        its(['end']) { should eq('13:00') }
        its(['duration']) { should eq('05:00') }
      end

      context 'when the end time is before start time' do
        it 'recognizes the end time is for the next day' 

      end
    end

    context 'with no active timer' do
      it 'fails miserably' 

    end
  end

  describe 'GET /api/timer' do
    context 'with an active timer' do
      let!(:timer) { FactoryGirl.create(:timer, user: api_user, start_date: '2013-07-20', start_time: '08:00') }

      describe 'retrieval' do
        before do
          get '/api/timer'
        end

        subject { json }

        its(['start']) { should eq('08:00') }
        its(['date']) { should eq('2013-07-20') }
        its(['end']) { should be_nil }
      end
    end

    context 'with no active timer' do
      it 'fails miserably' 

    end
  end
end

