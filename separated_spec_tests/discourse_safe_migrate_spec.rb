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

  it "bans all table removal" 


  it "bans all table renames" 


  it "bans all column removal" 


  it "bans all column renames" 


  it "supports being disabled" 

end

