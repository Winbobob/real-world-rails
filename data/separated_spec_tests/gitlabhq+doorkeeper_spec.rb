require 'spec_helper'
require_relative '../../config/initializers/doorkeeper'

describe Doorkeeper.configuration do
  describe '#default_scopes' do
    it 'matches Gitlab::Auth::DEFAULT_SCOPES' 

  end

  describe '#optional_scopes' do
    it 'matches Gitlab::Auth.optional_scopes' 

  end

  describe '#resource_owner_authenticator' do
    subject { controller.instance_exec(&Doorkeeper.configuration.authenticate_resource_owner) }

    let(:controller) { double }

    before do
      allow(controller).to receive(:current_user).and_return(current_user)
      allow(controller).to receive(:session).and_return({})
      allow(controller).to receive(:request).and_return(OpenStruct.new(fullpath: '/return-path'))
      allow(controller).to receive(:redirect_to)
      allow(controller).to receive(:new_user_session_url).and_return('/login')
    end

    context 'with a user present' do
      let(:current_user) { create(:user) }

      it 'returns the user' 


      it 'does not redirect' 


      it 'does not store the return path' 

    end

    context 'without a user present' do
      let(:current_user) { nil }

      # NOTE: this is required for doorkeeper-openid_connect
      it 'returns nil' 


      it 'redirects to the login form' 


      it 'stores the return path' 

    end
  end
end

