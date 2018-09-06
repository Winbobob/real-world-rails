require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/add_concurrent_index'

describe RuboCop::Cop::Migration::AddConcurrentIndex do
  include CopHelper

  subject(:cop) { described_class.new }

  context 'in migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    it 'registers an offense when add_concurrent_index is used inside a change method' 


    it 'registers no offense when add_concurrent_index is used inside an up method' 

  end

  context 'outside of migration' do
    it 'registers no offense' 

  end
end

