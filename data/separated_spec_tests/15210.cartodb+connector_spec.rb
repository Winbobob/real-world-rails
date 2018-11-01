# encoding: utf-8
require 'carto/connector'
require_relative '../../../../spec/spec_helper'

require_relative '../doubles/importer_stats'
require_relative '../doubles/loader'
require_relative '../doubles/log'
require_relative '../doubles/indexer'
require_relative '../factories/pg_connection'
require_relative '../doubles/user'
require_relative '../doubles/input_file_size_limit'
require_relative '../doubles/table_row_count_limit'

require_relative 'sql_helper'

class TestConnectorContext < Carto::Connector::Context
  def initialize(executed_commands, options)
    @executed_commands = executed_commands
    super options
  end

  def execute_as_superuser(command)
    @executed_commands << [:superuser, command, @user.username]
    execute_results command
  end

  def execute(command)
    @executed_commands << [:user, command, @user.username]
    execute_results command
  end

  private

  def execute_results(command)
    if command =~ /\A\s*SELECT\s+\*\s+FROM\s+ODBCTablesList/mi
      [{ schema: 'abc', name: 'xyz' }]
    elsif command =~ /SELECT\s+n.nspname\s+AS\s+schema,\s*c.relname\s+AS\s+name/mi
      [{ schema: 'def', name: 'uvw' }]
    else
      []
    end
  end
end

class FailingTestConnectorContext < TestConnectorContext
  def execute(command)
    if match_sql(command).first[:command] == :create_table_as_select
      raise "SQL EXECUTION ERROR"
    end
    super
  end
end

class TestCountConnectorContext < TestConnectorContext
  def initialize(count, *args)
    @test_count = count
    super *args
  end

  def execute(command)
    if command =~ /\A\s*SELECT\s+count\(\*\)\s+AS\s+num_rows/mi
      [{ 'num_rows' => @test_count }]
    else
      super
    end
  end
end

def expect_executed_command(cmd, expected = {})
  if expected
    mode, sql, user = cmd
    mode.should eq expected[:mode] if expected.key?(:mode)
    user.should eq expected[:user] if expected.key?(:user)
    expect_sql sql, expected[:sql] if expected.key?(:sql)
  end
end

def expect_executed_commands(executed_commands, *expected_commands)
  executed_commands.zip(expected_commands).each do |executed_command, expected_command|
    expect_executed_command executed_command, expected_command
  end
end

# Multiple hashes are passed to `expect_executed_commands`
# and omiting the braces of the last one is would be inconvenient, so:
# rubocop:disable Style/BracesAroundHashParameters

describe Carto::Connector do
  before(:all) do
    @user = create_user
    @user.save
    @fake_log = CartoDB::Importer2::Doubles::Log.new(@user)
    Carto::Connector.providers.keys.each do |provider_name|
      Carto::ConnectorProvider.create! name: provider_name
    end
  end

  before(:each) do
    CartoDB::Stats::Aggregator.stubs(:read_config).returns({})
    @executed_commands = []
  end

  around(:each) do |example|
    Cartodb.with_config(connectors: {}, &example)
  end

  after(:all) do
    @user.destroy
    Carto::Connector.providers.keys.each do |provider_name|
      Carto::ConnectorProvider.find_by_name(provider_name).destroy
    end
  end

  it "Should list providers available for a user with default configuration" 


  it "Should list providers available for a user with specific configuration" 


  describe 'mysql' do
    it 'Executes expected odbc_fdw SQL commands to copy a table' 


    it 'Should quote ODBC paremeters that require it' 


    it 'Fails when parameters are not valid' 


    it 'Fails gracefully when copy errs' 


    it 'Limits the number of rows copied from a table' 


    it 'Limits the number of rows and warns if limit is reached' 


    it 'Executes expected odbc_fdw SQL commands to list tables' 


    it 'requires connection parameters in order to list tables' 


    it 'checks connection paramters in order to list tables' 


    it 'Should provide connector metadata' 

  end

  describe 'postgresql' do
    it 'Executes expected odbc_fdw SQL commands to copy a table' 


    it 'Should provide connector metadata' 

  end

  describe 'sqlserver' do
    it 'Executes expected odbc_fdw SQL commands to copy a table' 


    it 'Should provide connector metadata' 

  end

  describe 'hive' do
    it 'Executes expected odbc_fdw SQL commands to copy a table' 


    it 'Should provide connector metadata' 

  end

  describe 'invalid_provider' do
    it 'Fails' 


    it 'Should not provide metadata' 

  end

  describe 'generic odbc provider' do
    it 'Executes expected odbc_fdw SQL commands to copy a table' 


    it 'Should admit quoted parameters' 

  end

  describe 'Non odbc provider' do
    before(:each) do
      Carto::Connector::PROVIDERS['pg'] = {
        class: Carto::Connector::PgFdwProvider,
        name:  'PostgreSQL FDW',
        public: true
      }
    end

    after(:each) do
      Carto::Connector::PROVIDERS['pg'] = nil
    end

    it 'Executes expected odbc_fdw SQL commands to copy a table' 


    it 'Fails when parameters are not valid' 


    it 'Fails gracefully when copy errs' 


    it 'Should provide connector metadata' 

  end
end

# rubocop:enable Style/BracesAroundHashParameters

