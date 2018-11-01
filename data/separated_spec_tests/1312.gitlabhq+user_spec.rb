require 'spec_helper'

describe Gitlab::Auth::Saml::User do
  include LdapHelpers
  include LoginHelpers

  let(:saml_user) { described_class.new(auth_hash) }
  let(:gl_user) { saml_user.gl_user }
  let(:uid) { 'my-uid' }
  let(:dn) { 'uid=user1,ou=people,dc=example' }
  let(:provider) { 'saml' }
  let(:raw_info_attr) { { 'groups' => %w(Developers Freelancers Designers) } }
  let(:auth_hash) { OmniAuth::AuthHash.new(uid: uid, provider: provider, info: info_hash, extra: { raw_info: OneLogin::RubySaml::Attributes.new(raw_info_attr) }) }
  let(:info_hash) do
    {
      name: 'John',
      email: 'john@mail.com'
    }
  end
  let(:ldap_user) { Gitlab::Auth::LDAP::Person.new(Net::LDAP::Entry.new, 'ldapmain') }

  describe '#save' do
    before do
      stub_basic_saml_config
    end

    describe 'account exists on server' do
      before do
        stub_omniauth_config({ allow_single_sign_on: ['saml'], auto_link_saml_user: true })
      end

      let!(:existing_user) { create(:user, email: 'john@mail.com', username: 'john') }

      context 'and should bind with SAML' do
        it 'adds the SAML identity to the existing user' 

      end

      context 'external groups' do
        context 'are defined' do
          it 'marks the user as external' 

        end

        before do
          stub_saml_group_config(%w(Interns))
        end

        context 'are defined but the user does not belong there' do
          it 'does not mark the user as external' 

        end

        context 'user was external, now should not be' do
          it 'makes user internal' 

        end
      end
    end

    describe 'no account exists on server' do
      shared_examples 'to verify compliance with allow_single_sign_on' do
        context 'with allow_single_sign_on enabled' do
          before do
            stub_omniauth_config(allow_single_sign_on: ['saml'])
          end

          it 'creates a user from SAML' 

        end

        context 'with allow_single_sign_on default (["saml"])' do
          before do
            stub_omniauth_config(allow_single_sign_on: ['saml'])
          end

          it 'does not throw an error' 

        end

        context 'with allow_single_sign_on disabled' do
          before do
            stub_omniauth_config(allow_single_sign_on: false)
          end

          it 'throws an error' 

        end
      end

      context 'external groups' do
        context 'are defined' do
          it 'marks the user as external' 

        end

        context 'are defined but the user does not belong there' do
          it 'does not mark the user as external' 

        end
      end

      context 'with auto_link_ldap_user disabled (default)' do
        before do
          stub_omniauth_config({ auto_link_ldap_user: false, auto_link_saml_user: false, allow_single_sign_on: ['saml'] })
        end

        include_examples 'to verify compliance with allow_single_sign_on'
      end

      context 'with auto_link_ldap_user enabled' do
        before do
          stub_omniauth_config({ auto_link_ldap_user: true, auto_link_saml_user: false })
        end

        context 'and at least one LDAP provider is defined' do
          before do
            stub_ldap_config(providers: %w(ldapmain))
          end

          context 'and a corresponding LDAP person' do
            let(:adapter) { ldap_adapter('ldapmain') }

            before do
              allow(ldap_user).to receive(:uid) { uid }
              allow(ldap_user).to receive(:username) { uid }
              allow(ldap_user).to receive(:email) { %w(john@mail.com john2@example.com) }
              allow(ldap_user).to receive(:dn) { dn }
              allow(Gitlab::Auth::LDAP::Adapter).to receive(:new).and_return(adapter)
              allow(Gitlab::Auth::LDAP::Person).to receive(:find_by_uid).with(uid, adapter).and_return(ldap_user)
              allow(Gitlab::Auth::LDAP::Person).to receive(:find_by_dn).with(dn, adapter).and_return(ldap_user)
              allow(Gitlab::Auth::LDAP::Person).to receive(:find_by_email).with('john@mail.com', adapter).and_return(ldap_user)
            end

            context 'and no account for the LDAP user' do
              it 'creates a user with dual LDAP and SAML identities' 

            end

            context 'and LDAP user has an account already' do
              let(:auth_hash_base_attributes) do
                {
                  uid: uid,
                  provider: provider,
                  info: info_hash,
                  extra: {
                    raw_info: OneLogin::RubySaml::Attributes.new(
                      { 'groups' => %w(Developers Freelancers Designers) }
                    )
                  }
                }
              end
              let(:auth_hash) { OmniAuth::AuthHash.new(auth_hash_base_attributes) }
              let(:uid_types) { %w(uid dn email) }

              before do
                create(:omniauth_user,
                       email: 'john@mail.com',
                       extern_uid: dn,
                       provider: 'ldapmain',
                       username: 'john')
              end

              shared_examples 'find LDAP person' do |uid_type, uid|
                let(:auth_hash) { OmniAuth::AuthHash.new(auth_hash_base_attributes.merge(uid: extern_uid)) }

                before do
                  nil_types = uid_types - [uid_type]

                  nil_types.each do |type|
                    allow(Gitlab::Auth::LDAP::Person).to receive(:"find_by_#{type}").and_return(nil)
                  end

                  allow(Gitlab::Auth::LDAP::Person).to receive(:"find_by_#{uid_type}").and_return(ldap_user)
                end

                it 'adds the omniauth identity to the LDAP account' 

              end

              context 'when uid is an uid' do
                it_behaves_like 'find LDAP person', 'uid' do
                  let(:extern_uid) { uid }
                end
              end

              context 'when uid is a dn' do
                it_behaves_like 'find LDAP person', 'dn' do
                  let(:extern_uid) { dn }
                end
              end

              context 'when uid is an email' do
                it_behaves_like 'find LDAP person', 'email' do
                  let(:extern_uid) { 'john@mail.com' }
                end
              end

              it 'adds the omniauth identity to the LDAP account' 


              it 'saves successfully on subsequent tries, when both identities are present' 

            end

            context 'user has SAML user, and wants to add their LDAP identity' do
              it 'adds the LDAP identity to the existing SAML user' 

            end
          end
        end
      end

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

    describe 'blocking' do
      before do
        stub_omniauth_config({ allow_single_sign_on: ['saml'], auto_link_saml_user: true })
      end

      context 'signup with SAML only' do
        context 'dont block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: false)
          end

          it 'does not block the user' 

        end

        context 'block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: true)
          end

          it 'blocks user' 

        end
      end

      context 'sign-in' do
        before do
          saml_user.save
          saml_user.gl_user.activate
        end

        context 'dont block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: false)
          end

          it do
            saml_user.save
            expect(gl_user).to be_valid
            expect(gl_user).not_to be_blocked
          end
        end

        context 'block on create' do
          before do
            stub_omniauth_config(block_auto_created_users: true)
          end

          it do
            saml_user.save
            expect(gl_user).to be_valid
            expect(gl_user).not_to be_blocked
          end
        end
      end
    end
  end

  describe '#find_user' do
    context 'raw info hash attributes empty' do
      let(:raw_info_attr) { {} }

      it 'does not mark user as external' 

    end
  end

  describe '#bypass_two_factor?' do
    let(:saml_config) { mock_saml_config_with_upstream_two_factor_authn_contexts }

    subject { saml_user.bypass_two_factor? }

    context 'with authn_contexts_worth_two_factors configured' do
      before do
        stub_omniauth_saml_config(enabled: true, auto_link_saml_user: true, allow_single_sign_on: ['saml'], providers: [saml_config])
      end

      it 'returns true when authn_context is worth two factors' 


      it 'returns false when authn_context is not worth two factors' 


      it 'returns false when authn_context is blank' 

    end

    context 'without auth_contexts_worth_two_factors_configured' do
      before do
        stub_omniauth_saml_config(enabled: true, auto_link_saml_user: true, allow_single_sign_on: ['saml'], providers: [mock_saml_config])
      end

      it 'returns false when authn_context is present' 


      it 'returns false when authn_context is blank' 

    end
  end
end

