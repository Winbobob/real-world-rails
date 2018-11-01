require 'rails_helper'
require_dependency 'migration/safe_migrate'

describe Migration::SafeMigrate do
  before do
    Migration::SafeMigrate::SafeMigration.disable_safe!
  end

  after do
    Migration::SafeMigrate.disable!
    Migration::SafeMigrate::SafeMigration.enable_safe!
  end

  def capture_stdout
    old_stdout = $stdout
    io = StringIO.new
    $stdout = io
    yield
    io.string
  ensure
    $stdout = old_stdout
  end

  def migrate_up(path)
    migrations = ActiveRecord::MigrationContext.new(path).migrations
    ActiveRecord::Migrator.new(:up, migrations, migrations.first.version).run
  end

  it "bans all table removal" 


  it "bans all table renames" 


  it "bans all column removal" 


  it "bans all column renames" 


  it "supports being disabled" 


  describe 'for a post deployment migration' do
    it 'should not ban unsafe migrations' 

  end
end

