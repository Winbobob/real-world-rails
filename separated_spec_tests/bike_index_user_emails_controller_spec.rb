require 'spec_helper'

describe UserEmailsController do
  let(:user_email) { FactoryGirl.create(:user_email, confirmation_token: 'sometoken-or-something') }
  let(:user) { user_email.user }
  before do
    expect(user_email.confirmed).to be_falsey
  end

  describe 'resend_confirmation' do
    context 'user who has user_email' do
      it 'enqueues a job to send an additional email confirmation' 

    end

    context "not user's user_email" do
      it 'does not enqueue a job and sets the flash' 

    end

    context 'no user, no email_id' do
      it 'does not enqueue a job and sets the flash (and does not break)' 

    end
  end

  describe 'confirm' do
    context "user's user email" do
      before do
        set_current_user(user)
      end
      context 'unconfirmed' do
        it 'confirms and enqueues merge job' 

      end
      context 'confirmed' do
        it 'sets flash info and does not add job' 

      end
      context 'incorrect token' do
        it 'sets flash error and does not add job' 

      end
    end

    context "not user's user_email" do
      it 'does not enqueue a job and sets the flash' 

    end

    context 'no user, no email_id' do
      it 'does not enqueue a job and sets the flash (and does not break)' 

    end
  end

  describe 'destroy' do
    context "user's user email" do
      before do
        set_current_user(user)
      end
      context 'unconfirmed' do
        it 'deletes the email' 

      end
      context 'only has email' do
        it 'sets flash info and does not delete the email' 

      end
      context 'confirmed' do
        it 'sets flash info and does not delete the email' 

      end
    end

    context "not user's user_email" do
      it 'does not delete the email and sets an error flash' 

    end

    context 'no user, no email_id' do
      it 'does not delete the email and sets an error flash' 

    end
  end

  describe 'make_primary' do
    context "user's user email" do
      before do
        set_current_user(user)
      end
      context 'unconfirmed' do
        it 'does not make primary' 

      end
      context 'confirmed' do
        it 'sets flash success and makes primary' 

      end
      context 'confirmed and primary' do
        it 'user_email remains primary' 

      end
    end

    context "not user's user_email" do
      it 'does not enqueue a job and sets the flash' 

    end

    context 'no user, no email_id' do
      it 'does not enqueue a job and sets the flash (and does not break)' 

    end
  end
end

