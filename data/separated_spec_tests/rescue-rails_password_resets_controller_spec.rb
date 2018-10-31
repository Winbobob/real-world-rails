require 'rails_helper'

describe PasswordResetsController, type: :controller do
  describe 'GET #edit' do
    let!(:user) { create(:user, password_reset_token: 'aaa') }

    it 'should be successful' 

  end

  describe 'GET #new' do
    it 'should be successful' 

  end

  describe 'POST #create' do
    context 'user found' do
      let(:user) { instance_double(User) }
      let(:email) { Faker::Internet.email }

      before do
        allow(User).to receive(:find_by).with(email: email) { user }
      end

      it 'is successful' 

    end

    context 'user not found' do
      before do
        allow(User).to receive(:find_by_email) { nil }
      end

      it 'sets flash error' 

    end
  end

  describe 'PUT #update' do
    context 'password reset sent less than 2 hours ago' do
      let!(:user) { create(:user, password_reset_token: 'aaa', password_reset_sent_at: 1.day.ago) }
      it 'sets alerts' 

    end

    context 'password reset sent more than 2 hours' do
      let!(:user) { create(:user, password_reset_token: 'aaa', password_reset_sent_at: 1.hour.ago) }
      it 'is successful' 

    end
  end
end

