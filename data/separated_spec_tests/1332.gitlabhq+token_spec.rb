require 'fast_spec_helper'

describe Gitlab::Ci::Pipeline::Expression::Token do
  let(:value) { '$VARIABLE' }
  let(:lexeme) { Gitlab::Ci::Pipeline::Expression::Lexeme::Variable }

  subject { described_class.new(value, lexeme) }

  describe '#value' do
    it 'returns raw token value' 

  end

  describe '#lexeme' do
    it 'returns raw token lexeme' 

  end

  describe '#build' do
    it 'delegates to lexeme after adding a value' 


    it 'allows passing only required arguments' 

  end

  describe '#type' do
    it 'delegates type query to the lexeme' 

  end

  describe '#to_lexeme' do
    it 'returns raw lexeme syntax component name' 

  end
end

