require 'spec_helper'

describe Gitlab::Auth::LDAP::AuthHash do
  include LdapHelpers

  let(:auth_hash) do
    described_class.new(
      OmniAuth::AuthHash.new(
        uid: given_uid,
        provider: 'ldapmain',
        info: info,
        extra: {
          raw_info: raw_info
        }
      )
    )
  end

  let(:info) do
    {
      name:     'Smith, J.',
      email:    'johnsmith@example.com',
      nickname: '123456'
    }
  end

  let(:raw_info) do
    {
      uid:      ['123456'],
      email:    ['johnsmith@example.com'],
      cn:       ['Smith, J.'],
      fullName: ['John Smith']
    }
  end

  context "without overridden attributes" do
    let(:given_uid) { 'uid=John Smith,ou=People,dc=example,dc=com' }

    it "has the correct username" 


    it "has the correct name" 

  end

  context "with overridden attributes" do
    let(:given_uid) { 'uid=John Smith,ou=People,dc=example,dc=com' }

    let(:attributes) do
      {
        'username'  => %w(mail email),
        'name'      => 'fullName'
      }
    end

    before do
      allow_any_instance_of(Gitlab::Auth::LDAP::Config).to receive(:attributes).and_return(attributes)
    end

    it "has the correct username" 


    it "has the correct name" 

  end

  describe '#uid' do
    context 'when there is extraneous (but valid) whitespace' do
      let(:given_uid) { 'uid     =john smith ,  ou = people, dc=  example,dc =com' }

      it 'removes the extraneous whitespace' 

    end

    context 'when there are upper case characters' do
      let(:given_uid) { 'UID=John Smith,ou=People,dc=example,dc=com' }

      it 'downcases' 

    end
  end

  describe '#username' do
    context 'if lowercase_usernames setting is' do
      let(:given_uid) { 'uid=John Smith,ou=People,dc=example,dc=com' }

      before do
        raw_info[:uid] = ['JOHN']
      end

      it 'enabled the username attribute is lower cased' 


      it 'disabled the username attribute is not lower cased' 

    end
  end
end

