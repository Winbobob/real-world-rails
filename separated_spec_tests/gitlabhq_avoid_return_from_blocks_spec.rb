require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../rubocop/cop/avoid_return_from_blocks'

describe RuboCop::Cop::AvoidReturnFromBlocks do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags violation for return inside a block' 


  it "doesn't call add_offense twice for nested blocks" 


  it 'flags violation for return inside included > def > block' 


  shared_examples 'examples with whitelisted method' do |whitelisted_method|
    it "doesn't flag violation for return inside #{whitelisted_method}" 

  end

  %i[each each_filename times loop].each do |whitelisted_method|
    it_behaves_like 'examples with whitelisted method', whitelisted_method
  end

  shared_examples 'examples with def methods' do |def_method|
    it "doesn't flag violation for return inside #{def_method}" 

  end

  %i[define_method lambda].each do |def_method|
    it_behaves_like 'examples with def methods', def_method
  end

  it "doesn't flag violation for return inside a lambda" 


  it "doesn't flag violation for return used inside a method definition" 


  it "doesn't flag violation for next inside a block" 


  it "doesn't flag violation for break inside a block" 


  it "doesn't check when block is empty" 

end

