require 'rails_helper'

describe EventSessionsController do
  render_views

  describe '#index' do
    before do
      @user = create(:user)
      sign_in @user
      @event = create(:event)
    end

    describe 'an unauthorized user' do
      it 'cannot see a list of attendees' 

    end

    describe 'an organizer' do
      before do
        @event.organizers << @user
      end

      it 'can see a list of attendees' 

    end
  end

  describe '#show' do
    before do
      @user = create(:user, time_zone: 'Alaska')
      sign_in @user
      @event = create(:event, title: 'DogeBridge')
      @event_session = @event.event_sessions.first
    end

    context 'format is ics' do
      it 'responds with success' 


      it 'delegates to IcsGenerator' 

    end

    context 'format is not ics' do
      it 'responds with not_found' 

    end
  end
end

