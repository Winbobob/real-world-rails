# frozen_string_literal: true

require 'rails_helper'

describe MassEnrollmentController do
  let(:admin) { create(:admin) }
  let(:user) { create(:user, username: 'FirstUser') }
  let(:user2) { create(:user, username: 'SecondUser') }
  let(:course) { create(:course, start: 1.day.ago, end: 1.day.from_now) }
  let(:usernames) do
    "#{user.username}\r\n#{user2.username}\r\nNotARealUserOnWikipedia"
  end

  describe '#index' do
    render_views

    it 'loads for admins' 


    it 'returns a 401 if user lacks permission to edit' 

  end

  describe '#add_users' do
    context 'when user has permission to edit course' do
      before do
        allow(controller).to receive(:current_user).and_return(admin)
        course.campaigns << Campaign.first
        stub_add_user_to_channel_success
      end
      it 'adds only real users to a course' 

    end

    context 'when user cannot edit course' do
      before do
        course.campaigns << Campaign.first
      end
      it 'returns a 401' 

    end
  end
end

