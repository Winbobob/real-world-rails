require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20170921101004_normalize_ldap_extern_uids')

describe NormalizeLdapExternUids, :migration, :sidekiq do
  let!(:identities) { table(:identities) }

  around do |example|
    Timecop.freeze { example.run }
  end

  before do
    stub_const("Gitlab::Database::MigrationHelpers::BACKGROUND_MIGRATION_BATCH_SIZE", 2)
    stub_const("Gitlab::Database::MigrationHelpers::BACKGROUND_MIGRATION_JOB_BUFFER_SIZE", 2)

    # LDAP identities
    (1..4).each do |i|
      identities.create!(id: i, provider: 'ldapmain', extern_uid: " uid = foo #{i}, ou = People, dc = example, dc = com ", user_id: i)
    end

    # Non-LDAP identity
    identities.create!(id: 5, provider: 'foo', extern_uid: " uid = foo 5, ou = People, dc = example, dc = com ", user_id: 5)
  end

  it 'correctly schedules background migrations' 


  it 'migrates the LDAP identities' 


  it 'does not modify non-LDAP identities' 

end

