require_relative '../spec_helper'
require_relative '../helpers/subdomainless_helper'

require 'fake_net_ldap'
require_relative '../lib/fake_net_ldap_bind_as'

describe SessionsController do
  shared_examples_for 'LDAP' do
    it "doesn't allows to login until admin does first" 


    it "Allows to login and triggers creation if using the org admin account" 


    it "Allows to login and triggers creation of normal users if admin already present" 


    it "Just logs in if finds a cartodb username that matches with LDAP credentials " 


    it "Falls back to credentials if user is not present at LDAP" 

  end

  describe 'LDAP authentication' do
    DEFAULT_QUOTA_IN_BYTES = 1000

    before(:all) do
      bypass_named_maps
      @organization = ::Organization.new
      @organization.seats = 5
      @organization.quota_in_bytes = 100.megabytes
      @organization.name = "ldap-org"
      @organization.default_quota_in_bytes = DEFAULT_QUOTA_IN_BYTES
      @organization.save

      @domain_bases = ["dc=cartodb"]

      @ldap_admin_username = 'user'
      @ldap_admin_cn = "cn=#{@ldap_admin_username},#{@domain_bases[0]}"
      @ldap_admin_password = '666'

      @user_id_field = 'cn'
      @user_email_field = 'mail'

      @ldap_config = Carto::Ldap::Configuration.create(organization_id: @organization.id,
                                                       host: "0.0.0.0",
                                                       port: 389,
                                                       domain_bases_list: @domain_bases,
                                                       connection_user: @ldap_admin_cn,
                                                       connection_password: @ldap_admin_password,
                                                       email_field: @user_email_field,
                                                       user_object_class: '.',
                                                       group_object_class: '.',
                                                       user_id_field: @user_id_field,
                                                       username_field: @user_id_field)
    end

    before(:each) do
      bypass_named_maps
      FakeNetLdap.register_user(username: @ldap_admin_cn, password: @ldap_admin_password)
    end

    after(:each) do
      FakeNetLdap.clear_user_registrations
      FakeNetLdap.clear_query_registrations
    end

    after(:all) do
      bypass_named_maps
      @ldap_config.delete
      @organization.destroy_cascade
    end

    describe 'domainful' do
      it_behaves_like 'LDAP'

      let(:user_domain) { nil }

      before(:each) do
        stub_domainful(@organization.name)
      end
    end

    describe 'subdomainless' do
      it_behaves_like 'LDAP'

      let(:user_domain) { @organization.name }

      before(:each) do
        stub_subdomainless
      end
    end
  end

  shared_examples_for 'SAML' do
    def stub_saml_service(user)
      Carto::SamlService.any_instance.stubs(:enabled?).returns(true)
      Carto::SamlService.any_instance.stubs(:get_user_email).returns(user.email)
    end

    it 'redirects to SAML authentication request if enabled' 


    it 'authenticates with SAML if SAMLResponse is present and SAML is enabled' 


    it "Allows to login and triggers creation of normal users if user is not present" 


    it "Allows to login and triggers creation of normal users if user is not present" 


    it "Fails to authenticate if SAML request fails" 


    it "authenticates users with casing differences in email" 


    describe 'SAML logout' do
      it 'calls SamlService#sp_logout_request from user-initiated logout' 


      it 'does not call SamlService#sp_logout_request if logout URL is not configured' 


      it 'calls SamlService#idp_logout_request if SAMLRequest is present' 


      it 'calls SamlService#process_logout_response if SAMLResponse is present' 

    end
  end

  describe 'SAML authentication' do
    def create
      @organization = FactoryGirl.create(:saml_organization, quota_in_bytes: 1.gigabytes)
      @admin_user = create_admin_user(@organization)
      @user = FactoryGirl.create(:carto_user)
      @user.organization_id = @organization.id
      @user.save
    end

    def cleanup
      @user.destroy
      @organization.destroy
      @admin_user.destroy
    end

    def create_admin_user(organization)
      admin_user_username = "#{organization.name}-admin"
      admin_user_email = "#{organization.name}-admin@test.com"

      admin_user = create_user(
        username: admin_user_username,
        email: admin_user_email,
        password: '2{Patrañas}',
        private_tables_enabled: true,
        quota_in_bytes: 12345,
        organization: nil
      )
      admin_user.save.reload
      @organization.owner = admin_user
      @organization.save

      admin_user
    end

    describe 'domainful' do
      it_behaves_like 'SAML'

      let(:user_domain) { nil }

      before(:each) do
        stub_domainful(@organization.name)
      end

      before(:all) do
        create
      end

      after(:all) do
        cleanup
      end
    end

    describe 'subdomainless' do
      it_behaves_like 'SAML'

      let(:user_domain) { @organization.name }

      before(:each) do
        stub_subdomainless
      end

      before(:all) do
        create
      end

      after(:all) do
        cleanup
      end
    end
  end

  describe '#login' do
    before(:all) do
      Cartodb::Central.stubs(:sync_data_with_cartodb_central?).returns(true)
      @organization = FactoryGirl.create(:organization)
      @user = FactoryGirl.create(:carto_user)
    end

    after(:all) do
      @user.destroy
      @organization.destroy
    end

    describe 'with Central' do
      before(:each) do
        Cartodb::Central.stubs(:sync_data_with_cartodb_central?).returns(true)
      end

      it 'redirects to Central for user logins' 


      it 'redirects to Central for orgs without any auth method enabled' 


      it 'uses the box login for orgs with any auth enabled' 


      it 'disallows login from an organization login page to a non-member' 

    end

    describe 'without Central' do
      before(:each) do
        Cartodb::Central.stubs(:sync_data_with_cartodb_central?).returns(false)
      end

      it 'does not redirect' 


      it 'allows login from an organization login page to a non-member' 


      it 'redirects to dashboard if `return_to` url is not present' 


      it 'redirects to the `return_to` url if present' 


      it 'redirects to current viewer dashboard if the `return_to` dashboard url belongs to other user' 


      it 'redirects to the `return_to` only once url if present' 


      it 'creates _cartodb_base_url cookie' 

    end

    describe 'events' do
      # include HttpAuthenticationHelper
      require 'rack/test'
      include Rack::Test::Methods
      include Warden::Test::Helpers

      it 'triggers CartoGearsApi::Events::UserLoginEvent' 


      it 'sets dashboard_viewed_at just with login' 


      include Warden::Test::Helpers

      it 'triggers CartoGearsApi::Events::UserLoginEvent signaling not first login' 


      it 'triggers CartoGearsApi::Events::UserLoginEvent signaling first login' 


      it 'returns a CartoGearsApi::Users::User matching the logged user' 

    end
  end

  describe '#logout' do
    before(:all) do
      @user = FactoryGirl.create(:carto_user)
    end

    after(:all) do
      @user.destroy
    end

    shared_examples_for 'logout endpoint' do
      it 'redirects to user dashboard' 

    end

    describe 'domainful' do
      it_behaves_like 'logout endpoint'

      before(:each) do
        stub_domainful(@user.username)
      end
    end

    describe 'subdomainless' do
      it_behaves_like 'logout endpoint'

      before(:each) do
        stub_subdomainless
      end
    end
  end

  describe '#destroy' do
    it 'deletes the _cartodb_base_url cookie' 

  end

  private

  def bypass_named_maps
    Carto::NamedMaps::Api.any_instance.stubs(show: nil, create: true, update: true, destroy: true)
  end
end

