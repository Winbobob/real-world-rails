require 'active_record'
require 'support/active_record/postgresql_setup'
require 'database_cleaner/active_record/truncation'
require 'database_cleaner/active_record/truncation/shared_fast_truncation'

RSpec.describe DatabaseCleaner::ActiveRecord::Truncation do
  let(:helper) { PostgreSQLHelper.new }

  let(:connection) do
    helper.active_record_pg_connection
  end

  around do |example|
    helper.active_record_pg_setup

    example.run

    helper.active_record_pg_teardown
  end

  describe "AR connection adapter monkeypatches" do
    describe "#truncate_table" do
      it "truncates the table" 


      it "truncates the table without id sequence" 


      it "resets AUTO_INCREMENT index of table" 

    end
  end

  describe ":except option cleanup" do
    it "should not truncate the tables specified in the :except option" 

  end

  describe '#database_cleaner_table_cache' do
    it 'should default to the list of tables with their schema' 

  end

  it_behaves_like "an adapter with pre-count truncation"

  describe "schema_migrations table" do
    it "is not truncated" 

  end
end


