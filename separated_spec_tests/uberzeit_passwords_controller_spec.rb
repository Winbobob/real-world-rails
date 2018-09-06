require 'spec_helper'

describe PasswordsController do

  let(:user) { FactoryGirl.create :user }

  context 'for non-signed in users' do
    describe 'GET "edit"' do
      it 'redirects to login' 

    end

    describe 'PUT "update"' do
      it 'redirects to login' 

    end
  end

  context 'for signed in users' do
    before do
      test_sign_in user
    end

    describe 'GET "edit"' do
      before(:each) do
        get :edit, user_id: user.id
      end

      it 'is successful' 

    end

    describe 'PUT "update"' do
      let(:password) { '5HgPPUZ9IR' }

      it 'changes the password' 

    end
  end
end

