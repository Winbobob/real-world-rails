require 'spec_helper'

describe 'Profile > Password' do
  let(:user) { create(:user) }

  def fill_passwords(password, confirmation)
    fill_in 'New password',          with: password
    fill_in 'Password confirmation', with: confirmation

    click_button 'Save password'
  end

  context 'Password authentication enabled' do
    let(:user) { create(:user, password_automatically_set: true) }

    before do
      sign_in(user)
      visit edit_profile_password_path
    end

    context 'User with password automatically set' do
      describe 'User puts different passwords in the field and in the confirmation' do
        it 'shows an error message' 


        it 'does not contain the current password field after an error' 

      end

      describe 'User puts the same passwords in the field and in the confirmation' do
        it 'shows a success message' 

      end
    end
  end

  context 'Password authentication unavailable' do
    before do
      gitlab_sign_in(user)
    end

    context 'Regular user' do
      let(:user) { create(:user) }

      it 'renders 404 when password authentication is disabled for the web interface and Git' 

    end

    context 'LDAP user' do
      let(:user) { create(:omniauth_user, provider: 'ldapmain') }

      it 'renders 404' 

    end
  end

  context 'Change passowrd' do
    before do
      sign_in(user)
      visit(edit_profile_password_path)
    end

    it 'does not change user passowrd without old one' 


    it 'does not change password with invalid old password' 


    it 'changes user password' 

  end

  context 'when password is expired' do
    before do
      sign_in(user)

      user.update_attributes(password_expires_at: 1.hour.ago)
      user.identities.delete
      expect(user.ldap_user?).to eq false
    end

    it 'needs change user password' 


    context 'when global require_two_factor_authentication is enabled' do
      it 'needs change user password' 

    end
  end
end

