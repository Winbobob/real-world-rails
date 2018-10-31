require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/update_large_table'

describe RuboCop::Cop::Migration::UpdateLargeTable do
  include CopHelper

  subject(:cop) { described_class.new }

  context 'in migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    shared_examples 'large tables' do |update_method|
      described_class::LARGE_TABLES.each do |table|
        it "registers an offense for the #{table} table" 

      end
    end

    context 'for the add_column_with_default method' do
      include_examples 'large tables', 'add_column_with_default'
    end

    context 'for the update_column_in_batches method' do
      include_examples 'large tables', 'update_column_in_batches'
    end

    it 'registers no offense for non-blacklisted tables' 


    it 'registers no offense for non-blacklisted methods' 

  end

  context 'outside of migration' do
    let(:table) { described_class::LARGE_TABLES.sample }

    it 'registers no offense for add_column_with_default' 


    it 'registers no offense for update_column_in_batches' 

  end
end

