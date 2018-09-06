require 'spec_helper'
require Rails.root.join('db', 'post_migrate', '20171207150343_remove_soft_removed_objects.rb')

describe RemoveSoftRemovedObjects, :migration do
  describe '#up' do
    it 'removes various soft removed objects' 


    it 'removes the temporary indexes once soft removed data has been removed' 


    it 'removes routes of soft removed personal namespaces' 


    it 'schedules the removal of soft removed groups' 


    it 'does not remove soft removed groups when no admin user could be found' 

  end

  def run_migration
    disable_migrations_output do
      migrate!
    end
  end

  def create_with_deleted_at(*args)
    row = create(*args) # rubocop:disable RSpec/FactoriesInMigrationSpecs

    # We set "deleted_at" this way so we don't run into any column cache issues.
    row.class.where(id: row.id).update_all(deleted_at: 1.year.ago)

    row
  end
end

