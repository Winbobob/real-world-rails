# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Metrics::BlockNesting, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'Max' => 2 } }

  it 'accepts `Max` levels of nesting' 


  context '`Max + 1` levels of `if` nesting' do
    it 'registers an offense' 

  end

  context '`Max + 2` levels of `if` nesting' do
    it 'registers an offense' 

  end

  context 'Multiple nested `ifs` at same level' do
    it 'registers 2 offenses' 

  end

  context 'nested `case`' do
    it 'registers an offense' 

  end

  context 'nested `while`' do
    it 'registers an offense' 

  end

  context 'nested modifier `while`' do
    it 'registers an offense' 

  end

  context 'nested `until`' do
    it 'registers an offense' 

  end

  context 'nested modifier `until`' do
    it 'registers an offense' 

  end

  context 'nested `for`' do
    it 'registers an offense' 

  end

  context 'nested `rescue`' do
    it 'registers an offense' 

  end

  it 'accepts if/elsif' 


  context 'when CountBlocks is false' do
    let(:cop_config) { { 'Max' => 2, 'CountBlocks' => false } }

    it 'accepts nested multiline blocks' 


    it 'accepts nested inline blocks' 

  end

  context 'when CountBlocks is true' do
    let(:cop_config) { { 'Max' => 2, 'CountBlocks' => true } }

    context 'nested multiline block' do
      it 'registers an offense' 

    end

    context 'nested inline block' do
      it 'registers an offense' 

    end
  end
end

