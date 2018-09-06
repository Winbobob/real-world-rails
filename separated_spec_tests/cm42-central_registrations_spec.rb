require 'feature_helper'

describe 'Registrations' do
  describe 'disable 2FA' do
    let(:user) { create :user, :with_team, authy_enabled: true, authy_id: '12345' }
    let(:token) { '1234567' }
    let(:valid_response) { double(ok?: true) }
    let(:invalid_response) { double(ok?: false) }

    before :each do
      allow_any_instance_of(Devise::RegistrationsController)
        .to receive(:current_user)
        .and_return(user)

      login_as user, scope: :user
      visit user_verify_two_factor_path
    end

    describe 'when token is valid' do
      before do
        allow(Authy::API)
          .to receive(:verify)
          .with(id: user.authy_id, token: token, force: true)
          .and_return(valid_response)
      end

      context 'and authy was disabled' do
        before do
          allow(Authy::API)
            .to receive(:delete_user)
            .with(id: user.authy_id)
            .and_return(valid_response)
        end

        it 'redirects to edit page with "disabled 2FA" flash message' 


        it 'removes Authy info from user' 

      end

      context 'and authy could not be disabled' do
        before do
          allow(Authy::API)
            .to receive(:delete_user)
            .with(id: user.authy_id)
            .and_return(invalid_response)
        end

        it 'keeps Authy info on user' 


        it 'redirects to post url and shows "could not disable 2FA" flash message' 

      end
    end

    describe 'when token is invalid' do
      before do
        allow(Authy::API)
          .to receive(:verify)
          .with(id: user.authy_id, token: token, force: true)
          .and_return(invalid_response)
      end

      it 'redirects to post url with "invalid token" flash message' 

    end
  end
end

