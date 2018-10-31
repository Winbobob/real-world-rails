require 'spec_helper'

describe Gitlab::BackgroundMigration::NormalizeLdapExternUidsRange, :migration, schema: 20170921101004 do
  let!(:identities) { table(:identities) }

  before do
    # LDAP identities
    (1..4).each do |i|
      identities.create!(id: i, provider: 'ldapmain', extern_uid: " uid = foo #{i}, ou = People, dc = example, dc = com ", user_id: i)
    end

    # Non-LDAP identity
    identities.create!(id: 5, provider: 'foo', extern_uid: " uid = foo 5, ou = People, dc = example, dc = com ", user_id: 5)

    # Another LDAP identity
    identities.create!(id: 6, provider: 'ldapmain', extern_uid: " uid = foo 6, ou = People, dc = example, dc = com ", user_id: 6)
  end

  it 'normalizes the LDAP identities in the range' 

end

