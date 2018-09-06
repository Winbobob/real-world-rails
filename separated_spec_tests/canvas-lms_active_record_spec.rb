#
# Copyright (C) 2012 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.

require File.expand_path('../spec_helper', File.dirname( __FILE__ ))

module ActiveRecord
  describe Base do

    describe '.wildcard' do
      it 'produces a useful wildcard sql string' 

    end

    describe '.wildcard_pattern' do
      it 'downcases the query string' 


      it 'escapes special characters in the query' 


      it 'bases modulos on either end of the query per the configured type' 

    end

    describe ".coalesced_wildcard" do
      it 'produces a useful wildcard string for a coalesced index' 

    end

    describe ".coalesce_chain" do
      it "chains together many columns for combined matching" 

    end

    describe "find_in_batches" do
      describe "with cursor" do
        before do
          skip "needs PostgreSQL" unless Account.connection.adapter_name == 'PostgreSQL'
        end

        it "should iterate through all selected rows" 


        it "cleans up the cursor" 


        it "cleans up the temp table for non-DB error" 


        it "doesnt obfuscate the error when it dies in a transaction" 

      end

      describe "with temp table" do
        around do |example|
          begin
            ActiveRecord::Base.in_migration = true
            example.run
          ensure
            ActiveRecord::Base.in_migration = false
          end
        end

        it "should use a temp table when you select without an id" 


        it "should not use a temp table for a plain query" 


        it "should not use a temp table for a select with id" 


        it 'should not bomb when you try to force past the cursor option on selects with the primary key' 


        it "cleans up the temp table" 


        it "cleans up the temp table for non-DB error" 


        it "doesnt obfuscate the error when it dies in a transaction" 


      end
    end

    describe "deconstruct_joins" do
      describe "delete_all" do
        it "should allow delete all on inner join with alias" 

      end
    end

    describe "update_all with limit" do
      it "does the right thing with a join and a limit" 

    end

    describe "parse_asset_string" do
      it "parses simple asset strings" 


      it "parses asset strings with multi-word class names" 


      it "parses namespaced asset strings" 


      it "classifies the class name but leaves plurals in the namespaces alone" 


      it "behaves predictably on an invalid asset string" 

    end
  end

  describe ".asset_string" do
    it "generates a string with the reflection_type_name and id" 

  end

  describe Relation do
    describe "lock_with_exclusive_smarts" do
      let(:scope){ User.active }

      it "uses FOR UPDATE on a normal exclusive lock" 


      it "substitutes 'FOR NO KEY UPDATE' if specified" 

    end

    describe "union" do
      shared_examples_for "query creation" do
        it "should include conditions after the union inside of the subquery" 


        it "should include conditions prior to the union outside of the subquery" 

      end

      context "directly on the table" do
        include_examples "query creation"
        let(:base) { User.active }
      end

      context "through a relation" do
        include_examples "query creation"
        let(:base) { Account.create.users }
      end
    end
  end

  describe 'ConnectionAdapters' do
    describe 'SchemaStatements' do

      it 'should find the name of a foreign key on the default column' 


      it 'should find the name of a foreign key on a specific column' 


      it 'should not find a foreign key if there is not one' 


      it 'should not find a foreign key on a column that is not one' 


      it 'should not crash on a non-existant column' 


      it 'should not crash on a non-existant table' 


      it 'actually renames foreign keys' 

    end
  end
end

