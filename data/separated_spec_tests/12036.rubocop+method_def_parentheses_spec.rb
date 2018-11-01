# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MethodDefParentheses, :config do
  subject(:cop) { described_class.new(config) }

  context 'require_parentheses' do
    let(:cop_config) { { 'EnforcedStyle' => 'require_parentheses' } }

    it 'reports an offense for def with parameters but no parens' 


    it 'reports an offense for correct + opposite' 


    it 'reports an offense for class def with parameters but no parens' 


    it 'accepts def with no args and no parens' 


    it 'auto-adds required parens for a def' 


    it 'auto-adds required parens for a defs' 


    it 'auto-adds required parens to argument lists on multiple lines' 

  end

  shared_examples 'no parentheses' do
    # common to require_no_parentheses and
    # require_no_parentheses_except_multiline
    it 'reports an offense for def with parameters with parens' 


    it 'accepts a def with parameters but no parens' 


    it 'reports an offense for opposite + correct' 


    it 'reports an offense for class def with parameters with parens' 


    it 'accepts a class def with parameters with parens' 


    it 'reports an offense for def with no args and parens' 


    it 'accepts def with no args and no parens' 


    it 'auto-removes the parens' 


    it 'auto-removes the parens for defs' 

  end

  context 'require_no_parentheses' do
    let(:cop_config) { { 'EnforcedStyle' => 'require_no_parentheses' } }

    it_behaves_like 'no parentheses'
  end

  context 'require_no_parentheses_except_multiline' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'require_no_parentheses_except_multiline' }
    end

    context 'when args are all on a single line' do
      it_behaves_like 'no parentheses'
    end

    context 'when args span multiple lines' do
      it 'reports an offense for correct + opposite' 


      it 'auto-adds required parens to argument lists on multiple lines' 

    end
  end
end

