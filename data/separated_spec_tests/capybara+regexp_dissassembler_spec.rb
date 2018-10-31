# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Capybara::Selector::RegexpDisassembler do
  it 'handles strings' 


  it 'handles escaped characters' 


  it 'handles wildcards' 


  it 'handles optional characters' 


  it 'handles character classes' 


  it 'handles posix bracket expressions' 


  it 'handles repitition' 


  it 'handles non-greedy repetition' 


  it 'handles alternation' 


  it 'handles grouping' 


  it 'handles meta characters' 


  it 'handles character properties' 


  it 'handles backreferences' 


  it 'handles subexpressions' 


  it 'handles anchors' 


  def verify_strings(hsh)
    hsh.each do |regexp, expected|
      expect(Capybara::Selector::RegexpDisassembler.new(regexp).substrings).to eq expected
    end
  end
end

