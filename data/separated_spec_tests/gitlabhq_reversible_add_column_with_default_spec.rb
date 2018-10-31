require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/reversible_add_column_with_default'

describe RuboCop::Cop::Migration::ReversibleAddColumnWithDefault do
  include CopHelper

  subject(:cop) { described_class.new }

  context 'in migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    it 'registers an offense when add_column_with_default is used inside a change method' 


    it 'registers no offense when add_column_with_default is used inside an up method' 

  end

  context 'outside of migration' do
    it 'registers no offense' 

  end
end

