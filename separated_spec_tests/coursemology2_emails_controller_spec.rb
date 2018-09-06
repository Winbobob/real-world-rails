# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User::EmailsController, type: :controller do
  let!(:instance) { Instance.default }

  with_tenant(:instance) do
    let!(:user) { create(:administrator) }
    before { sign_in(user) }

    describe '#destroy' do
      subject { delete :destroy, params: { id: user.send(:default_email_record) } }

      context 'when the user only has one email address' do
        it 'cannot be deleted' 

        it { is_expected.to redirect_to(user_emails_path) }
      end

      context 'when destroying a primary email' do
        let!(:non_primary_email) { create(:user_email, user: user, primary: false) }
        it 'deletes the primary email' 


        it 'sets another email as primary' 

      end
    end

    describe '#set_primary' do
      let(:email) { create(:user_email, :unconfirmed, user: user, primary: false) }
      subject { post :set_primary, params: { id: email } }

      context 'when email is not confirmed' do
        it 'does not change the primary email' 


        it { is_expected.to redirect_to(user_emails_path) }
      end
    end

    describe '#send_confirmation' do
      let!(:email) { create(:user_email, email_traits, user: user, primary: false) }
      subject { post :send_confirmation, params: { id: email } }

      context 'when the email is already confirmed' do
        let(:email_traits) { :confirmed }

        it 'does not send any confirmations' 


        it 'sets an error message' 

      end

      context 'when the email is not confirmed' do
        let(:email_traits) { :unconfirmed }

        with_active_job_queue_adapter(:test) do
          it 'sends out a confirmation email' 

        end

        it { is_expected.to redirect_to(user_emails_path) }
      end
    end
  end
end

