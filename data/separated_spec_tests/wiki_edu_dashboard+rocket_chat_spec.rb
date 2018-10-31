# frozen_string_literal: true

require 'rails_helper'
require "#{Rails.root}/lib/chat/rocket_chat"

describe RocketChat do
  let(:user) { nil }
  let(:course) { nil }
  let(:subject) { described_class.new(user: user, course: course) }

  describe '#login_credentials' do
    let(:user) { create(:user, chat_password: chat_password, chat_id: chat_id) }

    context 'when the user already has a Rocket.Chat account' do
      let(:chat_id) { 'chatIdForUser' }
      let(:chat_password) { 'random_password' }

      before { stub_chat_login_success }

      it 'returns an authToken and userId' 


      it 'does not change the chat id or password' 

    end

    context 'when the user does not have a chat account' do
      let(:chat_password) { nil }
      let(:chat_id) { nil }

      before do
        stub_chat_login_success
        stub_chat_user_create_success
      end

      it 'creates an account, then returns an authToken and userId' 


      it 'saves the user\'s chat id and password' 

    end
  end

  describe '#create_channel_for_course' do
    before do
      stub_chat_login_success
      stub_chat_channel_create_success
    end

    context 'when the enable_chat flag is set for the course' do
      let(:course) { create(:course, flags: { enable_chat: true }) }

      it 'saves the course\'s room ID' 

    end

    context 'when the enable_chat flag is not set for the course' do
      let(:course) { create(:course, flags: {}) }

      it 'does nothing' 

    end

    context 'when the Rocket.Chat API returns an error' do
      let(:course) { create(:course, flags: { enable_chat: true }) }

      before { stub_chat_error }

      it 'raises RocketChatAPIError' 

    end
  end
end

