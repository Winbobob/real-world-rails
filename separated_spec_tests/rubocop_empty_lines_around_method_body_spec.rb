# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLinesAroundMethodBody do
  subject(:cop) { described_class.new }

  it 'registers an offense for method body starting with a blank' 


  # The cop only registers an offense if the extra line is completely empty. If
  # there is trailing whitespace, then that must be dealt with first. Having
  # two cops registering offense for the line with only spaces would cause
  # havoc in auto-correction.
  it 'accepts method body starting with a line with spaces' 


  it 'autocorrects method body starting with a blank' 


  it 'registers an offense for class method body starting with a blank' 


  it 'autocorrects class method body starting with a blank' 


  it 'registers an offense for method body ending with a blank' 


  it 'registers an offense for class method body ending with a blank' 


  it 'is not fooled by single line methods' 

end

