require 'spec_helper'

describe Gitlab::Auth::LDAP::User do
  include LdapHelpers

  let(:ldap_user) { described_class.new(auth_hash) }
  let(:gl_user) { ldap_user.gl_user }
  let(:info) do
    {
      name: 'John',
      email: 'john@example.com',
      nickname: 'john'
    }
  end
  let(:auth_hash) do
    OmniAuth::AuthHash.new(uid: 'uid=John Smith,ou=People,dc=example,dc=com', provider: 'ldapmain', info: info)
  end
  let(:ldap_user_upper_case) { described_class.new(auth_hash_upper_case) }
  let(:info_upper_case) do
    {
      name: 'John',
      email: 'John@Example.com', # Email address has upper case chars
      nickname: 'john'
    }
  end
  let(:auth_hash_upper_case) do
    OmniAuth::AuthHash.new(uid: 'uid=John Smith,ou=People,dc=example,dc=com', provider: 'ldapmain', info: info_upper_case)
  end

  describe '#should_save?' do
    it "marks existing ldap user as changed" 


    it "marks existing non-ldap user if the email matches as changed" 


    it "does not mark existing ldap user as changed" 

  end

  describe '.find_by_uid_and_provider' do
    let(:dn) { 'CN=John Åström, CN=Users, DC=Example, DC=com' }

    it 'retrieves the correct user' 

  end

  describe 'find or create' do
    it "finds the user if already existing" 


    it "connects to existing non-ldap user if the email matches" 


    it 'connects to existing ldap user if the extern_uid changes' 


    it 'connects to existing ldap user if the extern_uid changes and email address has upper case characters' 


    it 'maintains an identity per provider' 


    it "creates a new user if not found" 


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
  end

  describe 'updating email' do
    context "when LDAP sets an email" do
      it "has a real email" 


      it "has email set as synced" 


      it "has email set as read-only" 


      it "has synced attributes provider set to ldapmain" 

    end

    context "when LDAP doesn't set an email" do
      before do
        info.delete(:email)
      end

      it "has a temp email" 


      it "has email set as not synced" 


      it "does not have email set as read-only" 

    end
  end

  describe 'blocking' do
    def configure_block(value)
      stub_ldap_config(block_auto_created_users: value)
    end

    context 'signup' do
      context 'dont block on create' do
        before do
          configure_block(false)
        end

        it do
          ldap_user.save
          expect(gl_user).to be_valid
          expect(gl_user).not_to be_blocked
        end
      end

      context 'block on create' do
        before do
          configure_block(true)
        end

        it do
          ldap_user.save
          expect(gl_user).to be_valid
          expect(gl_user).to be_blocked
        end
      end
    end

    context 'sign-in' do
      before do
        ldap_user.save
        ldap_user.gl_user.activate
      end

      context 'dont block on create' do
        before do
          configure_block(false)
        end

        it do
          ldap_user.save
          expect(gl_user).to be_valid
          expect(gl_user).not_to be_blocked
        end
      end

      context 'block on create' do
        before do
          configure_block(true)
        end

        it do
          ldap_user.save
          expect(gl_user).to be_valid
          expect(gl_user).not_to be_blocked
        end
      end
    end
  end
end

