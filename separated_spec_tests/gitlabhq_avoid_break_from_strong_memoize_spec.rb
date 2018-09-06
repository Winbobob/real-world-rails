require 'spec_helper'
require 'rubocop'
require 'rubocop/rspec/support'
require_relative '../../../rubocop/cop/avoid_break_from_strong_memoize'

describe RuboCop::Cop::AvoidBreakFromStrongMemoize do
  include CopHelper

  subject(:cop) { described_class.new }

  it 'flags violation for break inside strong_memoize' 


  it 'flags violation for break inside strong_memoize nested blocks' 


  it "doesn't flag violation for next inside strong_memoize" 


  it "doesn't flag violation for break inside blocks" 


  it "doesn't call add_offense twice for nested blocks" 


  it "doesn't check when block is empty" 

end

