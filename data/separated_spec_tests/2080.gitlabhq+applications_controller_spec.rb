require 'spec_helper'

describe Oauth::ApplicationsController do
  let(:user) { create(:user) }

  context 'project members' do
    before do
      sign_in(user)
    end

    describe 'GET #index' do
      it 'shows list of applications' 


      it 'shows list of applications' 

    end

    describe 'POST #create' do
      it 'creates an application' 


      it 'redirects back to profile page if OAuth applications are disabled' 

    end
  end

  def disable_user_oauth
    allow(Gitlab::CurrentSettings.current_application_settings).to receive(:user_oauth_applications?).and_return(false)
  end

  def oauth_params
    {
      doorkeeper_application: {
        name: 'foo',
        redirect_uri: 'http://example.org'
      }
    }
  end
end

