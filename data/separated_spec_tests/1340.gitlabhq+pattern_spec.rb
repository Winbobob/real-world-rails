require 'fast_spec_helper'

describe Gitlab::Ci::Pipeline::Expression::Lexeme::Pattern do
  describe '.build' do
    it 'creates a new instance of the token' 


    it 'raises an error if pattern is invalid' 

  end

  describe '.type' do
    it 'is a value lexeme' 

  end

  describe '.scan' do
    it 'correctly identifies a pattern token' 


    it 'is a greedy scanner for regexp boundaries' 


    it 'does not allow to use an empty pattern' 


    it 'support single flag' 


    it 'support multiple flags' 


    it 'does not support arbitrary flags' 

  end

  describe '#evaluate' do
    it 'returns a regular expression' 


    it 'raises error if evaluated regexp is not valid' 

  end
end

