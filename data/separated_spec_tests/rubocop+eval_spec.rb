# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Security::Eval do
  subject(:cop) { described_class.new }

  it 'registers an offense for eval as function' 


  it 'registers an offense for eval as command' 


  it 'registers an offense `Binding#eval`' 


  it 'registers an offense for eval with string that has an interpolation' 


  it 'accepts eval as variable' 


  it 'accepts eval as method' 


  it 'accepts eval on a literal string' 


  it 'accepts eval with no arguments' 


  it 'accepts eval with a multiline string' 


  it 'accepts eval with a string that interpolates a literal' 


  context 'with an explicit binding, filename, and line number' do
    it 'registers an offense for eval as function' 


    it 'registers an offense for eval as command' 


    it 'accepts eval on a literal string' 

  end
end

