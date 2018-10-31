require 'spec_helper'

describe Gitlab::Auth::LDAP::Person do
  include LdapHelpers

  let(:entry) { ldap_user_entry('john.doe') }

  before do
    stub_ldap_config(
      options: {
        'uid'        => 'uid',
        'attributes' => {
          'name'     => 'cn',
          'email'    => %w(mail email userPrincipalName),
          'username' => username_attribute
        }
      }
    )
  end
  let(:username_attribute) { %w(uid sAMAccountName userid) }

  describe '.normalize_dn' do
    subject { described_class.normalize_dn(given) }

    it_behaves_like 'normalizes a DN'

    context 'with an exception during normalization' do
      let(:given) { 'John "Smith,' } # just something that will cause an exception

      it 'returns the given DN unmodified' 

    end
  end

  describe '.normalize_uid' do
    subject { described_class.normalize_uid(given) }

    it_behaves_like 'normalizes a DN attribute value'

    context 'with an exception during normalization' do
      let(:given) { 'John "Smith,' } # just something that will cause an exception

      it 'returns the given UID unmodified' 

    end
  end

  describe '.ldap_attributes' do
    it 'returns a compact and unique array' 

  end

  describe '#name' do
    it 'uses the configured name attribute and handles values as an array' 

  end

  describe '#email' do
    it 'returns the value of mail, if present' 


    it 'returns the value of userPrincipalName, if mail and email are not present' 

  end

  describe '#username' do
    context 'with default uid username attribute' do
      let(:username_attribute) { 'uid' }

      it 'returns the proper username value' 

    end

    context 'with a different username attribute' do
      let(:username_attribute) { 'sAMAccountName' }

      it 'returns the proper username value' 

    end

    context 'with a non-standard username attribute' do
      let(:username_attribute) { 'mail' }

      it 'returns the proper username value' 

    end

    context 'if lowercase_usernames setting is' do
      let(:username_attribute) { 'uid' }

      before do
        entry[username_attribute] = 'JOHN'
        @person = described_class.new(entry, 'ldapmain')
      end

      it 'enabled the username attribute is lower cased' 


      it 'disabled the username attribute is not lower cased' 

    end
  end

  def assert_generic_test(test_description, got, expected)
    test_failure_message = "Failed test description: '#{test_description}'\n\n    expected: #{expected}\n         got: #{got}"
    expect(got).to eq(expected), test_failure_message
  end
end

