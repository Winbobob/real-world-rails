# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Security::Open do
  subject(:cop) { described_class.new }

  it 'registers an offense for open' 


  it 'registers an offense for open with mode argument' 


  it 'registers an offense for open with dynamic string that is not prefixed' 


  it 'registers an offense for open with string that starts with a pipe' 


  it 'accepts open as variable' 


  it 'accepts File.open as method' 


  it 'accepts open on a literal string' 


  it 'accepts open with no arguments' 


  it 'accepts open with string that has a prefixed interpolation' 


  it 'accepts open with prefix string literal plus something' 


  it 'accepts open with a string that interpolates a literal' 

end

