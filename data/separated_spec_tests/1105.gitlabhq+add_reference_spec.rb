require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/add_reference'

describe RuboCop::Cop::Migration::AddReference do
  include CopHelper

  let(:cop) { described_class.new }

  context 'outside of a migration' do
    it 'does not register any offenses' 

  end

  context 'in a migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
    end

    it 'registers an offense when using add_reference without index' 


    it 'registers an offense when using add_reference index disabled' 


    it 'does not register an offense when using add_reference with index enabled' 

  end
end

