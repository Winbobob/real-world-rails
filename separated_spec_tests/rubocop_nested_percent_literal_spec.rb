# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::NestedPercentLiteral do
  subject(:cop) { described_class.new }

  it 'registers no offense for empty array' 


  it 'registers no offense for array' 


  it 'registers no offense for percent modifier character in isolation' 


  it 'registers no offense for nestings under percent' 


  it 'registers no offense for percents in the middle of literals' 


  it 'registers offense for nested percent literals' 


  it 'registers offense for repeated nested percent literals' 


  it 'registers offense for multiply nested percent literals' 


  context 'when handling invalid UTF8 byte sequence' do
    it 'registers no offense for array' 


    it 'registers offense for nested percent literal' 

  end
end

