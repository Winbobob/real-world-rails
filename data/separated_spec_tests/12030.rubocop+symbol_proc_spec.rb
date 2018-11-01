# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::SymbolProc, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'IgnoredMethods' => %w[respond_to] } }

  it 'registers an offense for a block with parameterless method call on ' \
     'param' do
    expect_offense(<<-RUBY.strip_indent)
      coll.map { |e| e.upcase }
               ^^^^^^^^^^^^^^^^ Pass `&:upcase` as an argument to `map` instead of a block.
    RUBY
  end

  it 'registers an offense for a block when method in body is unary -/=' 


  it 'accepts block with more than 1 arguments' 


  it 'accepts lambda with 1 argument' 


  it 'accepts proc with 1 argument' 


  it 'accepts Proc.new with 1 argument' 


  it 'accepts ignored method' 


  it 'accepts block with no arguments' 


  it 'accepts empty block body' 


  it 'accepts block with more than 1 expression in body' 


  it 'accepts block when method in body is not called on block arg' 


  it 'accepts block with a block argument ' 


  it 'accepts block with splat params' 


  it 'accepts block with adding a comma after the sole argument' 


  context 'when the method has arguments' do
    let(:source) { 'method(one, 2) { |x| x.test }' }

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  it 'autocorrects alias with symbols as proc' 


  it 'autocorrects multiple aliases with symbols as proc' 


  it 'auto-corrects correctly when there are no arguments in parentheses' 


  it 'does not crash with a bare method call' 


  context 'when `super` has arguments' do
    let(:source) { 'super(one, two) { |x| x.test }' }

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  context 'when `super` has no arguments' do
    let(:source) { 'super { |x| x.test }' }

    it 'registers an offense' 


    it 'auto-corrects' 

  end

  it 'auto-corrects correctly when args have a trailing comma' 

end

