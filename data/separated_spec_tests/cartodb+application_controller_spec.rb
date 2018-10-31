# encoding: utf-8

require_relative '../spec_helper'
require_relative './http_authentication_helper'

describe ApplicationController do
  include HttpAuthenticationHelper

  before(:all) do
    @user = FactoryGirl.create(:valid_user)
  end

  after(:all) do
    @user.destroy
  end

  # This filter should always be invoked if http_header_authentication is set,
  # tests are based in dashboard requests because of genericity.
  describe '#http_header_authentication' do
    def stub_load_common_data
      Admin::VisualizationsController.any_instance.stubs(:load_common_data).returns(true)
    end

    describe 'triggering' do
      it 'enabled if http_header_authentication is configured and header is sent' 


      it 'disabled if http_header_authentication is configured and header is not set' 


      it 'disabled if http_header_authentication is not configured' 

    end

    describe 'email autentication' do
      before(:each) do
        stub_http_header_authentication_configuration(field: 'email')
      end

      it 'loads the dashboard for a known user email' 


      it 'does not load the dashboard for an unknown user email' 


      it 'does not load the dashboard for a known user username' 

    end

    describe 'username autentication configuration' do
      before(:each) do
        stub_http_header_authentication_configuration(field: 'username')
      end

      it 'loads the dashboard for a known user username' 


      it 'does not load the dashboard for an unknown user username' 


      it 'does not load the dashboard for a known user id' 

    end

    describe 'id autentication configuration' do
      before(:each) do
        stub_http_header_authentication_configuration(field: 'id')
      end

      it 'loads the dashboard for a known user id' 


      it 'does not load the dashboard for an unknown user id' 


      it 'does not load the dashboard for a known user email' 

    end

    describe 'auto autentication configuration' do
      before(:each) do
        stub_http_header_authentication_configuration(field: 'auto')
      end

      it 'loads the dashboard for a known user id' 


      it 'loads the dashboard for a known user username' 


      it 'loads the dashboard for a known user email' 


      it 'does not load the dashboard for an unknown user id' 


      it 'does not load the dashboard for an unknown user username' 


      it 'does not load the dashboard for an unknown user email' 

    end

    describe 'autocreation' do
      describe 'disabled' do
        before(:each) do
          stub_http_header_authentication_configuration(field: 'auto', autocreation: false)
        end

        it 'redirects to login for unknown emails' 

      end

      describe 'enabled' do
        before(:each) do
          stub_http_header_authentication_configuration(field: 'auto', autocreation: true)
        end

        it 'redirects to user creation for unknown emails' 


        # This behaviour allows recreation of deleted users. Related to next one.
        it 'redirects to user creation for unknown emails if there is another finished user creation for that user' 


        # This behaviour avoids filling `user_creations` table with failed repetitions because of polling
        # and makes frontend to redirect nicely to the dashboard on finish (failing stopped redirection from working)
        it 'redirects to creation in progress instead of creation if that user has a not finished user creation' 


        it 'redirects to user creation for unknown emails if there is other enqueued user creation (for other user)' 

      end
    end
  end
end

