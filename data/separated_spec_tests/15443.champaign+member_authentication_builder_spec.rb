# frozen_string_literal: true

require 'rails_helper'

describe MemberAuthenticationBuilder do
  let!(:member) { create(:member, email: 'test@example.com') }
  let(:token) { SecureRandom.base64(24) }
  subject { MemberAuthenticationBuilder }

  describe '.build' do
    context 'with valid params' do
      subject do
        described_class.build(
          password: 'password',
          password_confirmation: 'password',
          email: 'test@example.com',
          language_code: 'EN'
        )
      end

      before do
        allow(SecureRandom).to receive(:base64).and_return(token)
        allow(ConfirmationMailer).to receive(:confirmation_email) { double(deliver_now: true) }
      end

      it 'creates member authentication' 


      it 'sends confirmation email' 

    end

    context 'with invalid params' do
      subject do
        described_class.build(
          password: 'password',
          password_confirmation: 'wrong',
          email: 'test@example.com',
          language_code: 'EN'
        )
      end

      it 'creates member authentication' 

    end
  end
end

