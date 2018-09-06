require 'spec_helper'

require 'rubocop'
require 'rubocop/rspec/support'

require_relative '../../../../rubocop/cop/migration/remove_column'

describe RuboCop::Cop::Migration::RemoveColumn do
  include CopHelper

  subject(:cop) { described_class.new }

  def source(meth = 'change')
    "def #{meth}; remove_column :table, :column; end"
  end

  context 'in a regular migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
      allow(cop).to receive(:in_post_deployment_migration?).and_return(false)
    end

    it 'registers an offense when remove_column is used in the change method' 


    it 'registers an offense when remove_column is used in the up method' 


    it 'registers no offense when remove_column is used in the down method' 

  end

  context 'in a post-deployment migration' do
    before do
      allow(cop).to receive(:in_migration?).and_return(true)
      allow(cop).to receive(:in_post_deployment_migration?).and_return(true)
    end

    it 'registers no offense' 

  end

  context 'outside of a migration' do
    it 'registers no offense' 

  end
end

