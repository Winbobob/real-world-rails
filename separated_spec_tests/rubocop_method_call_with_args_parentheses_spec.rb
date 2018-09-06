# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MethodCallWithArgsParentheses, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'IgnoredMethods' => %w[puts] }
  end

  it 'accepts no parens in method call without args' 


  it 'accepts parens in method call with args' 


  it 'register an offense for method call without parens' 


  it 'register an offense for non-receiver method call without parens' 


  it 'register an offense for methods starting with a capital without parens' 


  it 'register an offense for superclass call without parens' 


  it 'register no offense for superclass call without args' 


  it 'register no offense for yield without args' 


  it 'register no offense for superclass call with parens' 


  it 'register an offense for yield without parens' 


  it 'accepts no parens for operators' 


  it 'accepts no parens for setter methods' 


  it 'accepts no parens for unary operators' 


  it 'auto-corrects call by adding needed braces' 


  it 'auto-corrects superclass call by adding needed braces' 


  it 'auto-corrects yield by adding needed braces' 


  it 'auto-corrects fully parenthesized args by removing space' 


  it 'auto-corrects parenthesized args for a local method by removing space' 


  it 'auto-corrects call with multiple args by adding braces' 


  it 'auto-corrects partially parenthesized args by adding needed braces' 


  it 'auto-corrects calls with multiple args by adding needed braces' 


  it 'ignores method listed in IgnoredMethods' 


  context 'when inspecting macro methods' do
    let(:cop_config) do
      { 'IgnoreMacros' => 'true' }
    end

    context 'in a class body' do
      it 'does not register an offense' 

    end

    context 'in a module body' do
      it 'does not register an offense' 

    end
  end
end

