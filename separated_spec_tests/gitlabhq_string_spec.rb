require 'spec_helper'

describe Gitlab::Ci::Pipeline::Expression::Lexeme::String do
  describe '.build' do
    it 'creates a new instance of the token' 

  end

  describe '.type' do
    it 'is a value lexeme' 

  end

  describe '.scan' do
    context 'when using double quotes' do
      it 'correctly identifies string token' 

    end

    context 'when using single quotes' do
      it 'correctly identifies string token' 

    end

    context 'when there are mixed quotes in the string' do
      it 'is a greedy scanner for double quotes' 


      it 'is a greedy scanner for single quotes' 


      it 'allows to use single quotes inside double quotes' 


      it 'allow to use double quotes inside single quotes' 


      it 'allows to use an empty string inside single quotes' 


      it 'allow to use an empty string inside double quotes' 

    end
  end

  describe '#evaluate' do
    it 'returns string value it is is present' 


    it 'returns an empty string if it is empty' 

  end
end

