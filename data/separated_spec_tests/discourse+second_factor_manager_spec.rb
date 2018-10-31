require 'rails_helper'

RSpec.describe SecondFactorManager do
  let(:user_second_factor_totp) { Fabricate(:user_second_factor_totp) }
  let(:user) { user_second_factor_totp.user }
  let(:another_user) { Fabricate(:user) }

  let(:user_second_factor_backup) { Fabricate(:user_second_factor_backup) }
  let(:user_backup) {  user_second_factor_backup.user }

  describe '#totp' do
    it 'should return the right data' 

  end

  describe '#create_totp' do
    it 'should create the right record' 


    describe 'when user has a second factor' do
      it 'should return nil' 

    end
  end

  describe '#totp_provisioning_uri' do
    it 'should return the right uri' 

  end

  describe '#authenticate_totp' do
    it 'should be able to authenticate a token' 


    describe 'when token is blank' do
      it 'should be false' 

    end

    describe 'when token is invalid' do
      it 'should be false' 

    end
  end

  describe '#totp_enabled?' do
    describe 'when user does not have a second factor record' do
      it 'should return false' 

    end

    describe "when user's second factor record is disabled" do
      it 'should return false' 

    end

    describe "when user's second factor record is enabled" do
      it 'should return true' 

    end

    describe 'when SSO is enabled' do
      it 'should return false' 

    end

    describe 'when local login is disabled' do
      it 'should return false' 

    end
  end

  context 'backup codes' do
    describe '#generate_backup_codes' do
      it 'should generate and store 10 backup codes' 

    end

    describe '#create_backup_codes' do
      it 'should create 10 backup code records' 

    end

    describe '#authenticate_backup_code' do
      it 'should be able to authenticate a backup code' 


      describe 'when code is blank' do
        it 'should be false' 

      end

      describe 'when code is invalid' do
        it 'should be false' 

      end
    end

    describe '#backup_codes_enabled?' do
      describe 'when user does not have a second factor backup enabled' do
        it 'should return false' 

      end

      describe "when user's second factor backup codes have been used" do
        it 'should return false' 

      end

      describe "when user's second factor code is available" do
        it 'should return true' 

      end

      describe 'when SSO is enabled' do
        it 'should return false' 

      end

      describe 'when local login is disabled' do
        it 'should return false' 

      end
    end
  end
end

