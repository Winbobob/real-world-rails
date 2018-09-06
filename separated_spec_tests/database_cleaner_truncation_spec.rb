require 'database_cleaner/sequel/truncation'
require 'database_cleaner/shared_strategy'
require 'sequel'
require 'support/sequel/sequel_setup'
# XXX: use ActiveRecord's db_config (`db/config.yml`) for CI/dev convenience
require 'support/active_record/database_setup'

module DatabaseCleaner
  module Sequel
    RSpec.describe Truncation do
      it_should_behave_like "a generic strategy"
      it_should_behave_like "a generic truncation strategy"
    end

    RSpec.shared_examples 'a Sequel truncation strategy' do

      # XXX: it'd be really nice if Truncation accepted db: constructor parameter
      let(:truncation) do
        t = Truncation.new
        t.db = db
        t
      end

      context 'when several tables have data' do
        before do
          db.create_table!(:precious_stones) { primary_key :id }
          db.create_table!(:replaceable_trifles)  { primary_key :id }
          db.create_table!(:worthless_junk)  { primary_key :id }

          db[:precious_stones].insert
          db[:replaceable_trifles].insert
          db[:worthless_junk].insert
        end
        context 'by default' do
          it 'truncates all the tables' 

        end
        context 'when the Truncation is restricted to "only: [...]" some tables' do
          it 'truncates only the mentioned tables (and leaves the rest alone)' 

        end
        context 'when the Truncation is restricted to "except: [...]" some tables' do
          it 'leaves the mentioned tables alone (and truncates the rest)' 

        end
      end
    end

    RSpec.shared_examples_for 'a truncation strategy without autoincrement resets' do
      it "leaves AUTO_INCREMENT index alone by default (BUG: it should be reset instead)" 

      # XXX: it'd be really nice if Truncation accepted db: constructor parameter
      let(:truncation) do
        t = Truncation.new
        t.db = db
        t
      end
    end

    RSpec.shared_examples_for 'a truncation strategy that resets autoincrement keys by default' do
      it "resets AUTO_INCREMENT primary keys" 


      # XXX: it'd be really nice if Truncation accepted db: constructor parameter
      let(:truncation) do
        t = Truncation.new
        t.db = db
        t
      end
    end

    half_supported_configurations = [
      {url: 'sqlite:///',   connection_options: db_config['sqlite3']},
      {url: 'postgres:///', connection_options: db_config['postgres']},
    ]
    supported_configurations = [
      {url: 'mysql:///',    connection_options: db_config['mysql']},
      {url: 'mysql2:///',   connection_options: db_config['mysql2']}
    ]

    supported_configurations.each do |config|
      RSpec.describe "Sequel truncation (using a #{config[:url]} connection)" do
        around do |example|
          helper = SequelHelper.new(config)
          helper.setup

          example.run

          helper.teardown
        end

        let(:db) { ::Sequel.connect(config[:url], config[:connection_options]) }

        it_behaves_like 'a Sequel truncation strategy'
        it_behaves_like 'a truncation strategy that resets autoincrement keys by default'


        describe '#pre_count?' do
          subject { Truncation.new.tap { |t| t.db = db } }

          it 'should return false initially' 


          it 'should return true if @reset_id is set and non false or nil' 


          it 'should return false if @reset_id is set to false' 

        end

        describe "relying on #pre_count_truncate_tables if asked to" do
          subject { Truncation.new.tap { |t| t.db = db } }

          it "should rely on #pre_count_truncate_tables if #pre_count? returns true" 


          it "should not rely on #pre_count_truncate_tables if #pre_count? return false" 

        end
      end
    end

    half_supported_configurations.each do |config|
      RSpec.describe "Sequel truncation (using a #{config[:url]} connection)" do
        around do |example|
          helper = SequelHelper.new(config)
          helper.setup

          example.run

          helper.teardown
        end

        let(:db) { ::Sequel.connect(config[:url], config[:connection_options]) }

        it_behaves_like 'a Sequel truncation strategy'
        it_behaves_like 'a truncation strategy without autoincrement resets'
      end
    end
  end
end

