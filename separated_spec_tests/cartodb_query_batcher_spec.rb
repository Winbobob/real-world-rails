# encoding: utf-8

require 'rspec/core'
require 'rspec/expectations'
require 'rspec/mocks'
require 'mocha'
require_relative '../../lib/importer/query_batcher'
require_relative '../factories/pg_connection'

module CartoDB
  module Importer2

    describe QueryBatcher do

      before do
        conn = Factories::PGConnection.new
        @db = conn.connection
        @pg_options = conn.pg_options
        @table_name = 'cdbid_query_batcher_table_test'
        @n_values = 3
        @batch_size = 1
      end

      def fetch(query, column = :value)
        @db.fetch(query).all.map { |r| r[column] }
      end

      before(:each) do
        @db.run(%Q[create table #{@table_name} (cartodb_id integer, value integer)])
        @db.run(%Q[insert into #{@table_name}(cartodb_id) select generate_series(1, #{@n_values})])
        @db.run(%Q[update #{@table_name} set value = cartodb_id])
      end

      after(:each) do
        @db.drop_table @table_name
      end

      describe '#execute_update' do
        before(:each) do
          @qb = QueryBatcher.new(@db, nil, false, @batch_size)
          @qb_big_batch = QueryBatcher.new(@db, nil, false, @n_values + 1)
        end

        it 'processes every row' 


        it 'processes every row for batch size bigger than table' 


        it 'processes every matching row for queries matching all rows' 


        it 'processes every matching row for queries not matching all rows' 


        it 'does not fail with empty tables' 


      end

    end

  end
end


