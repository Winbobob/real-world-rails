require_relative '../spec_helper'

feature LoginController do
  let(:user) { create :user }

  describe 'forgot password' do
    before { visit forgot_password_path }
    it 'is accessible' 


    it 'sends a reset email' 

  end

  describe 'and reset it' do
    let(:token) { user.reset_password_token }
    let(:newpass) { user.new_random_password }
    before { user.request_password_reset! }
    before { visit new_password_path(id: user.id, token: token) }

    it 'is accessible' 


    describe 'with wrong token' do
      let(:token) { 'foobar' }
      it 'is not accessible' 

    end

    it 'changes the password' 

  end
end

