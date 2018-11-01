require 'rake_helper'

describe 'gitlab:ldap:check rake task' do
  include LdapHelpers

  before do
    Rake.application.rake_require 'tasks/gitlab/check'

    stub_warn_user_is_not_gitlab
  end

  context 'when LDAP is not enabled' do
    it 'does not attempt to bind or search for users' 

  end

  context 'when LDAP is enabled' do
    let(:ldap) { double(:ldap) }
    let(:adapter) { ldap_adapter('ldapmain', ldap) }

    before do
      allow(Gitlab::Auth::LDAP::Config)
        .to receive_messages(
          enabled?: true,
          providers: ['ldapmain']
        )
      allow(Gitlab::Auth::LDAP::Adapter).to receive(:open).and_yield(adapter)
      allow(adapter).to receive(:users).and_return([])
    end

    it 'attempts to bind using credentials' 


    it 'searches for 100 LDAP users' 

  end
end

