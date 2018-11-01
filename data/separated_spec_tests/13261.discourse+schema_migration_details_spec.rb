require 'rails_helper'
require_dependency "freedom_patches/schema_migration_details"

describe FreedomPatches::SchemaMigrationDetails do

  # we usually don't really need this model so lets not clutter up with it
  class SchemaMigrationDetail < ActiveRecord::Base
  end

  class TestMigration < ActiveRecord::Migration[4.2]
    def up
      sleep 0.001
    end
  end

  it "logs information on migration" 

end

