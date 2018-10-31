require 'spec_helper'

# Check consistency of db/schema.rb version, migrations' timestamps, and the latest migration timestamp
# stored in the database's schema_migrations table.

describe ActiveRecord::Schema do
  let(:latest_migration_timestamp) do
    migrations = Dir[Rails.root.join('db', 'migrate', '*'), Rails.root.join('db', 'post_migrate', '*')]
    migrations.map { |migration| File.basename(migration).split('_').first.to_i }.max
  end

  it '> schema version equals last migration timestamp' 


  it '> schema version should equal the latest migration timestamp stored in schema_migrations table' 

end

