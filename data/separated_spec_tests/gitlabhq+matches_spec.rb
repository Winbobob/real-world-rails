require 'fast_spec_helper'
require_dependency 're2'

describe Gitlab::Ci::Pipeline::Expression::Lexeme::Matches do
  let(:left) { double('left') }
  let(:right) { double('right') }

  describe '.build' do
    it 'creates a new instance of the token' 

  end

  describe '.type' do
    it 'is an operator' 

  end

  describe '#evaluate' do
    it 'returns false when left and right do not match' 


    it 'returns true when left and right match' 


    it 'supports matching against a nil value' 


    it 'supports multiline strings' 


    it 'supports regexp flags' 

  end
end

