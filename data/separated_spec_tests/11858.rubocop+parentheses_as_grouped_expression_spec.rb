# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::ParenthesesAsGroupedExpression do
  subject(:cop) { described_class.new }

  it 'registers an offense for method call with space before the ' \
     'parenthesis' do
    expect_offense(<<-RUBY.strip_indent)
      a.func (x)
            ^ `(...)` interpreted as grouped expression.
    RUBY
  end

  it 'registers an offense for predicate method call with space ' \
     'before the parenthesis' do
    expect_offense(<<-RUBY.strip_indent)
      is? (x)
         ^ `(...)` interpreted as grouped expression.
    RUBY
  end

  it 'registers an offense for math expression' 


  it 'accepts a method call without arguments' 


  it 'accepts a method call with arguments but no parentheses' 


  it 'accepts a chain of method calls' 


  it 'accepts method with parens as arg to method without' 


  it 'accepts an operator call with argument in parentheses' 


  it 'accepts a space inside opening paren followed by left paren' 


  it 'does not register an offense for a call with multiple arguments' 

end

