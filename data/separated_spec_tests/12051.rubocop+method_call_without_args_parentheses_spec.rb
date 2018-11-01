# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MethodCallWithoutArgsParentheses, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'IgnoredMethods' => %w[s] }
  end

  it 'registers an offense for parens in method call without args' 


  it 'accepts parentheses for methods starting with an upcase letter' 


  it 'accepts no parens in method call without args' 


  it 'accepts parens in method call with args' 


  it 'accepts special lambda call syntax' 


  it 'accepts parens after not' 


  it 'ignores method listed in IgnoredMethods' 


  context 'assignment to a variable with the same name' do
    it 'accepts parens in local variable assignment ' 


    it 'accepts parens in shorthand assignment' 


    it 'accepts parens in parallel assignment' 


    it 'accepts parens in complex assignment' 

  end

  it 'registers an offense for `obj.method ||= func()`' 


  it 'registers an offense for `obj.method &&= func()`' 


  it 'registers an offense for `obj.method += func()`' 


  it 'auto-corrects by removing unneeded braces' 


  # These will be offenses for the EmptyLiteral cop. The autocorrect loop will
  # handle that.
  it 'auto-corrects calls that could be empty literals' 


  context 'method call as argument' do
    it 'accepts without parens' 


    it 'registers an offense with empty parens' 


    it 'registers an empty parens offense for multiple assignment' 

  end
end

