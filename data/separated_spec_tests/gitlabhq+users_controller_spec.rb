require 'spec_helper'

describe Admin::UsersController do
  let(:user) { create(:user) }
  set(:admin) { create(:admin) }

  before do
    sign_in(admin)
  end

  describe 'DELETE #user with projects' do
    let(:project) { create(:project, namespace: user.namespace) }
    let!(:issue) { create(:issue, author: user) }

    before do
      project.add_developer(user)
    end

    it 'deletes user and ghosts their contributions' 


    it 'deletes the user and their contributions when hard delete is specified' 

  end

  describe 'PUT block/:id' do
    it 'blocks user' 

  end

  describe 'PUT unblock/:id' do
    context 'ldap blocked users' do
      let(:user) { create(:omniauth_user, provider: 'ldapmain') }

      before do
        user.ldap_block
      end

      it 'does not unblock user' 

    end

    context 'manually blocked users' do
      before do
        user.block
      end

      it 'unblocks user' 

    end
  end

  describe 'PUT unlock/:id' do
    before do
      request.env["HTTP_REFERER"] = "/"
      user.lock_access!
    end

    it 'unlocks user' 

  end

  describe 'PUT confirm/:id' do
    let(:user) { create(:user, confirmed_at: nil) }

    before do
      request.env["HTTP_REFERER"] = "/"
    end

    it 'confirms user' 

  end

  describe 'PATCH disable_two_factor' do
    it 'disables 2FA for the user' 


    it 'redirects back' 


    it 'displays an alert' 


    def go
      patch :disable_two_factor, id: user.to_param
    end
  end

  describe 'POST create' do
    it 'creates the user' 


    it 'shows only one error message for an invalid email' 

  end

  describe 'POST update' do
    context 'when the password has changed' do
      def update_password(user, password, password_confirmation = nil)
        params = {
          id: user.to_param,
          user: {
            password: password,
            password_confirmation: password_confirmation || password
          }
        }

        post :update, params
      end

      context 'when the admin changes his own password' do
        it 'updates the password' 


        it 'does not set the new password to expire immediately' 

      end

      context 'when the new password is valid' do
        it 'redirects to the user' 


        it 'updates the password' 


        it 'sets the new password to expire immediately' 

      end

      context 'when the new password is invalid' do
        it 'shows the edit page again' 


        it 'returns the error message' 


        it 'does not update the password' 

      end

      context 'when the new password does not match the password confirmation' do
        it 'shows the edit page again' 


        it 'returns the error message' 


        it 'does not update the password' 

      end
    end
  end

  describe "POST impersonate" do
    context "when the user is blocked" do
      before do
        user.block!
      end

      it "shows a notice" 


      it "doesn't sign us in as the user" 

    end

    context "when the user is not blocked" do
      it "stores the impersonator in the session" 


      it "signs us in as the user" 


      it "redirects to root" 


      it "shows a notice" 

    end
  end
end

