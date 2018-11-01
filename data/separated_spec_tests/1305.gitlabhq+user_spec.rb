require 'spec_helper'

describe Gitlab::Auth::OAuth::User do
  include LdapHelpers

  let(:oauth_user) { described_class.new(auth_hash) }
  let(:gl_user) { oauth_user.gl_user }
  let(:uid) { 'my-uid' }
  let(:dn) { 'uid=user1,ou=people,dc=example' }
  let(:provider) { 'my-provider' }
  let(:auth_hash) { OmniAuth::AuthHash.new(uid: uid, provider: provider, info: info_hash) }
  let(:info_hash) do
    {
      nickname: '-john+gitlab-ETC%.git@gmail.com',
      name: 'John',
      email: 'john@mail.com',
      address: {
        locality: 'locality',
        country: 'country'
      }
    }
  end
  let(:ldap_user) { Gitlab::Auth::LDAP::Person.new(Net::LDAP::Entry.new, 'ldapmain') }

  describe '#persisted?' do
    let!(:existing_user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'my-provider') }

    it "finds an existing user based on uid and provider (facebook)" 


    it 'returns false if user is not found in database' 

  end

  def stub_omniauth_config(messages)
    allow(Gitlab.config.omniauth).to receive_messages(messages)
  end

  describe '#save' do
    let(:provider) { 'twitter' }

    describe 'when account exists on server' do
      it 'does not mark the user as external' 

    end

    describe 'signup' do
      context 'when signup is disabled' do
        before do
          stub_application_setting signup_enabled: false
        end

        it 'creates the user' 

      end

      context 'when user confirmation email is enabled' do
        before do
          stub_application_setting send_user_confirmation_email: true
        end

        it 'creates and confirms the user anyway' 

      end

      it 'marks user as having password_automatically_set' 


      shared_examples 'to verify compliance with allow_single_sign_on' do
        context 'provider is marked as external' do
          it 'marks user as external' 

        end

        context 'provider was external, now has been removed' do
          it 'does not mark external user as internal' 

        end

        context 'provider is not external' do
          context 'when adding a new OAuth identity' do
            it 'does not promote an external user to internal' 

          end
        end

        context 'with new allow_single_sign_on enabled syntax' do
          before do
            stub_omniauth_config(allow_single_sign_on: [provider])
          end

          it "creates a user from Omniauth" 

        end

        context "with old allow_single_sign_on enabled syntax" do
          before do
            stub_omniauth_config(allow_single_sign_on: true)
          end

          it "creates a user from Omniauth" 

        end

        context 'with new allow_single_sign_on disabled syntax' do
          before do
            stub_omniauth_config(allow_single_sign_on: [])
          end

          it 'throws an error' 

        end

        context 'with old allow_single_sign_on disabled (Default)' do
          before do
            stub_omniauth_config(allow_single_sign_on: false)
          end

          it 'throws an error' 

        end
      end

      context "with auto_link_ldap_user disabled (default)" do
        before do
          stub_omniauth_config(auto_link_ldap_user: false)
        end

        include_examples "to verify compliance with allow_single_sign_on"
      end

      context "with auto_link_ldap_user enabled" do
        before do
          stub_omniauth_config(auto_link_ldap_user: true)
        end

        context "and no LDAP provider defined" do
          before do
            stub_ldap_config(providers: [])
          end

          include_examples "to verify compliance with allow_single_sign_on"
        end

        context "and at least one LDAP provider is defined" do
          before do
            stub_ldap_config(providers: %w(ldapmain))
          end

          context "and a corresponding LDAP person" do
            before do
              allow(ldap_user).to receive(:uid) { uid }
              allow(ldap_user).to receive(:username) { uid }
              allow(ldap_user).to receive(:email) { ['johndoe@example.com', 'john2@example.com'] }
              allow(ldap_user).to receive(:dn) { dn }
            end

            context "and no account for the LDAP user" do
              before do
                allow(Gitlab::Auth::LDAP::Person).to receive(:find_by_uid).and_return(ldap_user)

                oauth_user.save
              end

              it "creates a user with dual LDAP and omniauth identities" 


              it "has email set as synced" 


              it "has email set as read-only" 


              it "has synced attributes provider set to ldapmain" 

            end

            context "and LDAP user has an account already" do
              let!(:existing_user) { create(:omniauth_user, email: 'john@example.com', extern_uid: dn, provider: 'ldapmain', username: 'john') }
              it "adds the omniauth identity to the LDAP account" 

            end

            context 'when an LDAP person is not found by uid' do
              it 'tries to find an LDAP person by email and adds the omniauth identity to the user' 


              context 'when also not found by email' do
                it 'tries to find an LDAP person by DN and adds the omniauth identity to the user' 

              end
            end

            def result_identities(dn, uid)
              [
                { provider: 'ldapmain', extern_uid: dn },
                { provider: 'twitter', extern_uid: uid }
              ]
            end

            context 'when there is an LDAP connection error' do
              before do
                raise_ldap_connection_error
              end

              it 'does not save the identity' 

            end
          end

          context 'and a corresponding LDAP person with a non-default username' do
            before do
              allow(ldap_user).to receive(:uid) { uid }
              allow(ldap_user).to receive(:username) { 'johndoe@example.com' }
              allow(ldap_user).to receive(:email) { %w(johndoe@example.com john2@example.com) }
              allow(ldap_user).to receive(:dn) { dn }
            end

            context 'and no account for the LDAP user' do
              it 'creates a user favoring the LDAP username and strips email domain' 

            end
          end

          context "and no corresponding LDAP person" do
            before do
              allow(Gitlab::Auth::LDAP::Person).to receive(:find_by_uid).and_return(nil)
            end

            include_examples "to verify compliance with allow_single_sign_on"
          end
        end
      end
    end

    describe 'blocking' do
      let(:provider) { 'twitter' }

      before do
        stub_omniauth_config(allow_single_sign_on: ['twitter'])
      end

      context 'signup with omniauth only' do
        context 'dont block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: false)
          end

          it do
            oauth_user.save
            expect(gl_user).to be_valid
            expect(gl_user).not_to be_blocked
          end
        end

        context 'block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: true)
          end

          it do
            oauth_user.save
            expect(gl_user).to be_valid
            expect(gl_user).to be_blocked
          end
        end
      end

      context 'signup with linked omniauth and LDAP account' do
        before do
          stub_omniauth_config(auto_link_ldap_user: true)
          allow(ldap_user).to receive(:uid) { uid }
          allow(ldap_user).to receive(:username) { uid }
          allow(ldap_user).to receive(:email) { ['johndoe@example.com', 'john2@example.com'] }
          allow(ldap_user).to receive(:dn) { dn }
          allow(Gitlab::Auth::LDAP::Person).to receive(:find_by_uid).and_return(ldap_user)
        end

        context "and no account for the LDAP user" do
          context 'dont block on create (LDAP)' do
            before do
              allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive_messages(block_auto_created_users: false)
            end

            it do
              oauth_user.save
              expect(gl_user).to be_valid
              expect(gl_user).not_to be_blocked
            end
          end

          context 'block on create (LDAP)' do
            before do
              allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive_messages(block_auto_created_users: true)
            end

            it do
              oauth_user.save
              expect(gl_user).to be_valid
              expect(gl_user).to be_blocked
            end
          end
        end

        context 'and LDAP user has an account already' do
          let!(:existing_user) { create(:omniauth_user, email: 'john@example.com', extern_uid: dn, provider: 'ldapmain', username: 'john') }

          context 'dont block on create (LDAP)' do
            before do
              allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive_messages(block_auto_created_users: false)
            end

            it do
              oauth_user.save
              expect(gl_user).to be_valid
              expect(gl_user).not_to be_blocked
            end
          end

          context 'block on create (LDAP)' do
            before do
              allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive_messages(block_auto_created_users: true)
            end

            it do
              oauth_user.save
              expect(gl_user).to be_valid
              expect(gl_user).not_to be_blocked
            end
          end
        end
      end

      context 'sign-in' do
        before do
          oauth_user.save
          oauth_user.gl_user.activate
        end

        context 'dont block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: false)
          end

          it do
            oauth_user.save
            expect(gl_user).to be_valid
            expect(gl_user).not_to be_blocked
          end
        end

        context 'block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: true)
          end

          it do
            oauth_user.save
            expect(gl_user).to be_valid
            expect(gl_user).not_to be_blocked
          end
        end

        context 'dont block on create (LDAP)' do
          before do
            allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive_messages(block_auto_created_users: false)
          end

          it do
            oauth_user.save
            expect(gl_user).to be_valid
            expect(gl_user).not_to be_blocked
          end
        end

        context 'block on create (LDAP)' do
          before do
            allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive_messages(block_auto_created_users: true)
          end

          it do
            oauth_user.save
            expect(gl_user).to be_valid
            expect(gl_user).not_to be_blocked
          end
        end
      end
    end
  end

  describe 'ensure backwards compatibility with with sync email from provider option' do
    let!(:existing_user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'my-provider') }

    before do
      stub_omniauth_config(sync_email_from_provider: 'my-provider')
      stub_omniauth_config(sync_profile_from_provider: ['my-provider'])
    end

    context "when provider sets an email" do
      it "updates the user email" 


      it "has email set as synced" 


      it "has email set as read-only" 


      it "has synced attributes provider set to my-provider" 

    end

    context "when provider doesn't set an email" do
      before do
        info_hash.delete(:email)
      end

      it "does not update the user email" 


      it "has email set as not synced" 


      it "does not have email set as read-only" 

    end
  end

  describe 'generating username' do
    context 'when no collision with existing user' do
      it 'generates the username with no counter' 

    end

    context 'when collision with existing user' do
      it 'generates the username with a counter' 

    end

    context 'when username is a reserved word' do
      let(:info_hash) do
        {
          nickname: 'admin@othermail.com',
          email: 'admin@othermail.com'
        }
      end

      it 'generates the username with a counter' 

    end
  end

  describe 'updating email with sync profile' do
    let!(:existing_user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'my-provider') }

    before do
      stub_omniauth_config(sync_profile_from_provider: ['my-provider'])
      stub_omniauth_config(sync_profile_attributes: true)
    end

    context "when provider sets an email" do
      it "updates the user email" 


      it "has email set as synced" 


      it "has email set as read-only" 


      it "has synced attributes provider set to my-provider" 

    end

    context "when provider doesn't set an email" do
      before do
        info_hash.delete(:email)
      end

      it "does not update the user email" 


      it "has email set as not synced" 


      it "does not have email set as read-only" 

    end
  end

  describe 'updating name' do
    let!(:existing_user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'my-provider') }

    before do
      stub_omniauth_setting(sync_profile_from_provider: ['my-provider'])
      stub_omniauth_setting(sync_profile_attributes: true)
    end

    context "when provider sets a name" do
      it "updates the user name" 

    end

    context "when provider doesn't set a name" do
      before do
        info_hash.delete(:name)
      end

      it "does not update the user name" 

    end
  end

  describe 'updating location' do
    let!(:existing_user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'my-provider') }

    before do
      stub_omniauth_setting(sync_profile_from_provider: ['my-provider'])
      stub_omniauth_setting(sync_profile_attributes: true)
    end

    context "when provider sets a location" do
      it "updates the user location" 

    end

    context "when provider doesn't set a location" do
      before do
        info_hash[:address].delete(:country)
        info_hash[:address].delete(:locality)
      end

      it "does not update the user location" 

    end
  end

  describe 'updating user info' do
    let!(:existing_user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'my-provider') }

    context "update all info" do
      before do
        stub_omniauth_setting(sync_profile_from_provider: ['my-provider'])
        stub_omniauth_setting(sync_profile_attributes: true)
      end

      it "updates the user email" 


      it "updates the user name" 


      it "updates the user location" 


      it "sets my-provider as the attributes provider" 

    end

    context "update only requested info" do
      before do
        stub_omniauth_setting(sync_profile_from_provider: ['my-provider'])
        stub_omniauth_setting(sync_profile_attributes: %w(name location))
      end

      it "updates the user name" 


      it "updates the user location" 


      it "does not update the user email" 

    end

    context "update default_scope" do
      before do
        stub_omniauth_setting(sync_profile_from_provider: ['my-provider'])
      end

      it "updates the user email" 

    end

    context "update no info when profile sync is nil" do
      it "does not have sync_attribute" 


      it "does not update the user email" 


      it "does not update the user name" 


      it "does not update the user location" 


      it 'does not create associated user synced attributes metadata' 

    end
  end

  describe '.find_by_uid_and_provider' do
    let!(:existing_user) { create(:omniauth_user, extern_uid: 'my-uid', provider: 'my-provider') }

    it 'normalizes extern_uid' 

  end

  describe '#find_ldap_person' do
    context 'when LDAP connection fails' do
      before do
        raise_ldap_connection_error
      end

      it 'returns nil' 

    end
  end

  describe '#bypass_two_factor?' do
    subject { oauth_user.bypass_two_factor? }

    it 'returns always false' 

  end
end

