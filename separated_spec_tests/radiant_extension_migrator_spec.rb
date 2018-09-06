require 'spec_helper'
require 'radiant/extension_migrator'

describe Radiant::ExtensionMigrator do

  class Person < ActiveRecord::Base; end
  class Place < ActiveRecord::Base; end

  before :each do
    ActiveRecord::Base.connection.delete("DELETE FROM schema_migrations WHERE version LIKE 'Basic-%' OR version LIKE 'Upgrading-%' OR version LIKE 'Replacing-%'")
    ActiveRecord::Base.connection.delete("DELETE FROM extension_meta WHERE name = 'Upgrading'")
  end

  it 'should migrate new style migrations successfully' 


  it 'should migrate extensions with unusual names' 


  it "should record existing extension migrations in the schema_migrations table" 


  it "should obey migrate_from instructions" 


  describe '#migrate_extensions' do
    it 'should migrate in the order of the specified extension load order' 

  end
end

