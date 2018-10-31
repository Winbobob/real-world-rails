require 'rails_helper'
require 'gssapi'

RSpec.describe Webui::SessionController do
  let(:user) { create(:confirmed_user, login: 'tom') }

  shared_examples 'login' do
    before do
      request.env['HTTP_REFERER'] = search_url # Needed for the redirect_to(root_url)
    end

    it 'logs in users with correct credentials' 


    it 'tells users about wrong credentials' 


    it 'tells users about wrong state' 


    it 'assigns the current user' 

  end

  describe 'POST #create' do
    context 'without referrer' do
      before do
        post :create, params: { username: user.login, password: 'buildservice' }
      end

      it 'redirects to root path' 

    end

    context 'with deprecated password' do
      let(:user) { create(:user_deprecated_password, state: :confirmed) }

      it_behaves_like 'login'
    end

    context 'with bcrypt password' do
      it_behaves_like 'login'
    end
  end

  context 'in kerberos mode' do
    before do
      stub_const('CONFIG', CONFIG.merge('kerberos_service_principal' => 'HTTP/obs.test.com@test_realm.com',
                                        'kerberos_realm'             => 'test_realm.com',
                                        'kerberos_mode'              => true))
    end

    context 'for a request that requires authentication' do
      render_views
      before do
        get :new
      end

      context "and 'Negotiate' header is not set" do
        it 'informs the client tool (browser) that kerberos authentication is required' 


        it 'informs users about failed kerberos authentication and possible cause' 

      end
    end

    context 'for a request with valid kerberos ticket' do
      include_context 'a kerberos mock for' do
        let(:login) { user.login }
        let(:ticket) { 'krb5_ticket' }
      end

      render_views
      it 'authenticates the user' 

    end

    context 'for a request where GSSAPI raises an exception' do
      let(:gssapi_mock) { double(:gssapi) }

      before do
        allow(gssapi_mock).to receive(:acquire_credentials).
          and_raise(GSSAPI::GssApiError, "couldn't validate ticket")

        allow(GSSAPI::Simple).to receive(:new).with(
          'obs.test.com', 'HTTP', '/etc/krb5.keytab'
        ).and_return(gssapi_mock)
      end

      it 'does not authenticate the user' 

    end
  end

  context 'In proxy mode' do
    let!(:user) { create(:confirmed_user, login: 'proxy_user') }
    let(:username) { 'new_user' }

    before do
      # Fake proxy mode
      stub_const('CONFIG', CONFIG.merge('proxy_auth_mode' => :on))
    end

    it 'logs in a user when the header is set' 


    it 'does not log in any user when no header is set' 


    it 'creates a new user account if user does not exist in OBS' 

  end
end

