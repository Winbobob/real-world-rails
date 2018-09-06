require_relative '../spec_helper'
require_relative './http_authentication_helper'
require 'helpers/unique_names_helper'

describe SignupController do
  include UniqueNamesHelper

  before(:each) do
    ::User.any_instance.stubs(:load_common_data).returns(true)
  end

  describe 'signup page' do
    include_context 'organization with users helper'

    after(:each) do
      @fake_organization.delete if @fake_organization
    end

    it 'returns 200 when subdomainless and route is signup_subdomainless' 


    it 'returns 404 when subdomainless and route is signup' 


    it 'returns 404 outside organization subdomains' 


    it 'returns 200 for organizations with signup_page_enabled' 


    it 'returns 404 for organizations without signup_page_enabled' 


    it 'returns 404 for organizations with whitelisted domains but without any authentication enabled' 


    it 'returns 200 for organizations without signup_page_enabled but with a valid invitation' 


    it 'returns user error with admin mail if organization has not enough seats' 


    it 'does not return an error if organization has no unassigned_quota left but the invited user is a viewer' 


    it 'returns an error if organization has no unassigned_quota and invited user is not a viewer' 


    it 'signs user up as viewer even if all non-viewer seats are taken' 

  end

  describe 'user creation' do
    include_context 'organization with users helper'

    DEFAULT_QUOTA_IN_BYTES = 1000

    before(:all) do
      @organization.whitelisted_email_domains = ['carto.com']
      @organization.default_quota_in_bytes = DEFAULT_QUOTA_IN_BYTES
      @organization.save

      @org_2_user_owner = TestUserFactory.new.create_owner(@organization_2)
    end

    before(:each) do
      @organization.auth_username_password_enabled = true
      @organization.auth_google_enabled = true
      @organization.strong_passwords_enabled = true
      @organization.save
    end

    it 'triggers validation error and not a NewUser job if email is not valid' 


    it 'triggers validation error and not a NewUser job if username is too long' 


    it 'triggers validation error is password is too short' 


    it 'returns 400 error if you attempt username + password signup and it is not valid' 


    it 'triggers a NewUser job with form parameters and default quota and requiring validation email' 


    it 'trigger creation if mail is whitelisted with wildcard' 


    it 'Returns 422 for not whitelisted domains' 


    it "doesn't trigger creation if mail domain is not whitelisted and invitation token is wrong" 


    it 'returns 400 if invitation token is for a different organization' 


    it 'triggers creation without validation email spending an invitation even if mail domain is not whitelisted' 


    it 'triggers a viewer creation that creates a viewer user' 


    describe 'ldap signup' do

      before(:all) do
        @ldap_configuration = FactoryGirl.create(:ldap_configuration, { organization_id: @organization.id })
      end

      after(:all) do
        @ldap_configuration.destroy
      end

      it 'returns 404 if ldap is enabled' 


    end

    describe 'http authentication signup' do
      include HttpAuthenticationHelper

      describe 'header authentication disabled' do
        it 'returns 404 if http authentication is not set' 


        it 'returns 404 if http authentication autocreation is disabled' 

      end

      describe 'header authentication enabled' do
        it 'returns 404 if http authentication autocreation is disabled' 


        it 'returns 500 if http authentication is not set to email' 


        describe 'autocreation enabled' do
          before(:each) do
            stub_http_header_authentication_configuration(autocreation: true)
          end

          it 'returns 403 if http authentication header is not present' 


          it 'triggers user creation without organization' 


          it 'triggers user creation with organization' 

        end
      end
    end
  end
end

