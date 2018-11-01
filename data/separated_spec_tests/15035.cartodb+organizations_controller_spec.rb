require_relative '../../spec_helper_min'
require_relative '../../factories/organizations_contexts'

describe Admin::OrganizationsController do
  include Warden::Test::Helpers
  include_context 'organization with users helper'

  let(:out_of_quota_message) { "Your organization has run out of quota" }
  let(:out_of_seats_message) { "Your organization has run out of seats" }

  before(:all) do
    @org_user_2.org_admin = true
    @org_user_2.save
  end

  describe '#settings' do
    let(:payload) do
      {
        organization: { color: '#ff0000' }
      }
    end

    let(:payload_password) do
      {
        organization: { color: '#ff0000' },
        password_confirmation: @org_user_owner.password
      }
    end

    let(:payload_wrong_password) do
      {
        organization: { color: '#ff0000' },
        password_confirmation: 'prapra'
      }
    end

    before(:each) do
      host! "#{@organization.name}.localhost.lan"
      Organization.any_instance.stubs(:update_in_central).returns(true)
    end

    it 'cannot be accessed by non owner users' 


    it 'cannot be updated by non owner users' 


    it 'can be accessed by owner user' 


    it 'can be updated by owner user' 


    it 'fails to update if no password_confirmation' 


    it 'fails to update if wrong password_confirmation' 

  end

  describe '#regenerate_api_keys' do
    it 'regenerate api keys for all org users' 

  end

  describe '#delete' do
    before(:all) do
      @delete_org = test_organization
      @delete_org.save

      helper = TestUserFactory.new
      @delete_org_owner = helper.create_owner(@delete_org)

      @delete_org_user1 = @helper.create_test_user(unique_name('user'), @delete_org)
    end

    after(:all) do
      @delete_org.destroy_cascade if Carto::Organization.exists?(@delete_org.id)
    end

    before(:each) do
      host! "#{@delete_org.name}.localhost.lan"
      Organization.any_instance.stubs(:update_in_central).returns(true)
    end

    it 'cannot be accessed by non owner users' 


    describe 'as owner' do
      before(:each) do
        login_as(@delete_org_owner, scope: @delete_org_owner.username)
      end

      it 'returns 400 if no password confirmation is provided' 


      it 'returns 400 if password confirmation is wrong' 


      it 'deletes organization and redirects if passwords match' 

    end
  end

  describe '#auth' do
    let(:payload) do
      {
        organization: {
          whitelisted_email_domains: '',
          auth_username_password_enabled: true,
          auth_google_enabled: true,
          auth_github_enabled: true,
          strong_passwords_enabled: false,
          password_expiration_in_d: 1
        }
      }
    end

    let(:payload_password) do
      {
        organization: {
          whitelisted_email_domains: '',
          auth_username_password_enabled: true,
          auth_google_enabled: true,
          auth_github_enabled: true,
          strong_passwords_enabled: false,
          password_expiration_in_d: 1
        },
        password_confirmation: @org_user_owner.password
      }
    end

    let(:payload_wrong_password) do
      {
        organization: {
          whitelisted_email_domains: '',
          auth_username_password_enabled: true,
          auth_google_enabled: true,
          auth_github_enabled: true,
          strong_passwords_enabled: false
        },
        password_confirmation: 'prapra'
      }
    end

    before(:each) do
      host! "#{@organization.name}.localhost.lan"
      login_as(@org_user_owner, scope: @org_user_owner.username)
      Organization.any_instance.stubs(:update_in_central).returns(true)
    end

    it 'cannot be accessed by non owner users' 


    it 'cannot be updated by non owner users' 


    it 'can be accessed by owner user' 


    it 'can be updated by owner user' 


    it 'cannot be updated by owner user if missing password_confirmation' 


    it 'cannot be updated by owner user if wrong password_confirmation' 


    it 'updates password_expiration_in_d' 


    describe 'signup enabled' do
      before(:all) do
        @organization.whitelisted_email_domains = ['carto.com']
        @organization.save
      end

      before(:each) do
        @organization.signup_page_enabled.should eq true
      end

      it 'does not display out warning messages if organization signup would work' 


      it 'displays out of quota message if there is no remaining quota' 


      it 'displays out of seats message if there are no seats left' 

    end

    describe 'signup disabled' do
      before(:all) do
        @organization.whitelisted_email_domains = []
        @organization.save
      end

      before(:each) do
        @organization.signup_page_enabled.should eq false
      end

      it 'does not display out warning messages even without quota and seats' 

    end
  end

  shared_examples_for 'notifications' do
    before(:each) do
      host! "#{@organization.name}.localhost.lan"
      login_as(@admin_user, scope: @admin_user.username)
    end

    describe '#notifications' do
      it 'displays last notification' 

    end

    describe '#new_notification' do
      it 'creates a new notification' 


      it 'does not create a new notification if wrong password_confirmation' 


      it 'does not create a new notification if missing password_confirmation' 

    end

    describe '#destroy_notification' do
      it 'destroys a notification' 

    end
  end

  describe 'with organization owner' do
    it_behaves_like 'notifications' do
      before(:all) do
        @admin_user = @org_user_owner
      end
    end
  end

  describe 'with organization admin' do
    it_behaves_like 'notifications' do
      before(:all) do
        @admin_user = @org_user_2
      end
    end
  end
end

