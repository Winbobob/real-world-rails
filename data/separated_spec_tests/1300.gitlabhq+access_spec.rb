require 'spec_helper'

describe Gitlab::Auth::LDAP::Access do
  include LdapHelpers

  let(:user) { create(:omniauth_user) }

  subject(:access) { described_class.new(user) }

  describe '.allowed?' do
    before do
      allow(access).to receive(:update_user)
      allow(access).to receive(:allowed?).and_return(true)
      allow(described_class).to receive(:open).and_yield(access)
    end

    it "updates the user's `last_credential_check_at`" 


    it "does not update user's `last_credential_check_at` when in a read-only GitLab instance" 

  end

  describe '#allowed?' do
    context 'when the user cannot be found' do
      before do
        stub_ldap_person_find_by_dn(nil)
        stub_ldap_person_find_by_email(user.email, nil)
      end

      it 'returns false' 


      it 'blocks user in GitLab' 


      it 'logs the reason' 

    end

    context 'when the user is found' do
      before do
        stub_ldap_person_find_by_dn(Net::LDAP::Entry.new)
      end

      context 'and the user is disabled via active directory' do
        before do
          allow(Gitlab::Auth::LDAP::Person).to receive(:disabled_via_active_directory?).and_return(true)
        end

        it 'returns false' 


        it 'blocks user in GitLab' 


        it 'logs the reason' 

      end

      context 'and has no disabled flag in active directory' do
        before do
          allow(Gitlab::Auth::LDAP::Person).to receive(:disabled_via_active_directory?).and_return(false)
        end

        it { is_expected.to be_truthy }

        context 'when auto-created users are blocked' do
          before do
            user.block
          end

          it 'does not unblock user in GitLab' 

        end

        context 'when auto-created users are not blocked' do
          before do
            user.ldap_block
          end

          it 'unblocks user in GitLab' 


          it 'logs the reason' 

        end
      end

      context 'without ActiveDirectory enabled' do
        before do
          allow(Gitlab::Auth::LDAP::Config).to receive(:enabled?).and_return(true)
          allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive(:active_directory).and_return(false)
        end

        it 'returns true' 


        context 'when user cannot be found' do
          before do
            stub_ldap_person_find_by_dn(nil)
            stub_ldap_person_find_by_email(user.email, nil)
          end

          it 'returns false' 


          it 'blocks user in GitLab' 


          it 'logs the reason' 

        end

        context 'when user was previously ldap_blocked' do
          before do
            user.ldap_block
          end

          it 'unblocks the user if it exists' 


          it 'logs the reason' 

        end
      end
    end

    context 'when the connection fails' do
      before do
        raise_ldap_connection_error
      end

      it 'does not block the user' 


      it 'denies access' 

    end
  end
end

