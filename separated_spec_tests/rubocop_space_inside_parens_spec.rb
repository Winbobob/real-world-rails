# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsideParens, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is no_space' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_space' } }

    it 'registers an offense for spaces inside parens' 


    it 'accepts parentheses in block parameter list' 


    it 'accepts parentheses with no spaces' 


    it 'accepts parentheses with line break' 


    it 'accepts parentheses with comment and line break' 


    it 'auto-corrects unwanted space' 

  end

  context 'when EnforcedStyle is space' do
    let(:cop_config) { { 'EnforcedStyle' => 'space' } }

    it 'registers an offense for no spaces inside parens' 


    it 'accepts parentheses in block parameter list with no spaces' 


    it 'accepts parentheses with spaces' 


    it 'accepts parentheses with line break' 


    it 'accepts parentheses with comment and line break' 


    it 'auto-corrects wanted space' 

  end
end

