require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/remove_index'

describe RuboCop::Cop::Migration::RemoveIndex do
  include CopHelper

  subject(:cop) { described_class.new }

  context 'in migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    it 'registers an offense when remove_index is used' 

  end

  context 'outside of migration' do
    it 'registers no offense' 

  end
end

