require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20171005130944_schedule_create_gpg_key_subkeys_from_gpg_keys')

describe ScheduleCreateGpgKeySubkeysFromGpgKeys, :migration, :sidekiq do
  before do
    create(:gpg_key, id: 1, key: GpgHelpers::User1.public_key) # rubocop:disable RSpec/FactoriesInMigrationSpecs
    create(:gpg_key, id: 2, key: GpgHelpers::User3.public_key) # rubocop:disable RSpec/FactoriesInMigrationSpecs
    # Delete all subkeys so they can be recreated
    GpgKeySubkey.destroy_all # rubocop: disable DestroyAll
  end

  it 'correctly schedules background migrations' 


  it 'schedules background migrations' 

end

