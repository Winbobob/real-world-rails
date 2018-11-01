require 'spec_helper'

describe RepairLdapBlockedUserService do
  let(:user) { create(:omniauth_user, provider: 'ldapmain', state: 'ldap_blocked') }
  let(:identity) { user.ldap_identity }
  subject(:service) { described_class.new(user) }

  describe '#execute' do
    it 'changes to normal block after destroying last ldap identity' 


    it 'changes to normal block after changing last ldap identity to another provider' 

  end
end

