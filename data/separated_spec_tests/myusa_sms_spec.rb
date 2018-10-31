require 'spec_helper'
require 'two_factor/strategies/sms'

describe TwoFactor::Strategies::Sms do
  include Warden::Spec::Helpers

  let(:user) { FactoryGirl.create(:user, :with_2fa) }
  let(:params) { {} }
  let(:env) { env_with_params('/', params) }

  before :each do
    setup_rack(success_app).call(env)
  end

  subject do
    TwoFactor::Strategies::Sms.new(env)
  end

  describe '#valid?' do
    context 'user is not logged in' do
      it 'is not valid' 

    end

    context 'user is logged in' do
      before :each do
        env['warden'].set_user(user, scope: :user)
      end

      context 'invalid params' do
        it 'is not valid' 

      end

      context 'sms authentication code is in params' do
        let(:params) { { "sms[raw_token]" => 'bad token' }}

        it 'is valid' 

      end
    end
  end

  describe '#authenticate!' do
    let(:raw_token) { '123456' }
    let(:mobile_number) { user.mobile_number }

    before :each do
      env['warden'].set_user(user, scope: :user)
      allow(SmsCode).to receive(:new_token) { raw_token }
      user.create_sms_code!(mobile_number: mobile_number)
      subject.authenticate!
    end

    context 'raw token is bad' do
      let(:params) { { "sms[raw_token]" => 'bad token' }}
      it 'does not set user' 

      it 'fails' 

    end

    context 'raw token matches' do
      let(:params) { { "sms[raw_token]" => raw_token }}

      shared_examples '2fa' do
        it 'sets sms_code object' 

        it 'succeeds' 

      end

      context 'regular 2fa' do
        include_examples '2fa'
      end

      context 'mobile confirmation' do
        let(:mobile_number) { '8005553455' }
        let(:user) { FactoryGirl.create(:user, unconfirmed_mobile_number: mobile_number) }

        it 'updates user\'s mobile_number' 


        include_examples '2fa'
      end
    end
  end
end

