# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MethodCalledOnDoEndBlock do
  subject(:cop) { described_class.new }

  context 'with a multi-line do..end block' do
    it 'registers an offense for a chained call' 


    it 'accepts it if there is no chained call' 


    it 'accepts a chained block' 

  end

  context 'with a single-line do..end block' do
    it 'registers an offense for a chained call' 


    it 'accepts a single-line do..end block with a chained block' 

  end

  context 'with a {} block' do
    it 'accepts a multi-line block with a chained call' 


    it 'accepts a single-line block with a chained call' 

  end
end

