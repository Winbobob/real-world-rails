# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::WhileUntilDo do
  subject(:cop) { described_class.new }

  it 'registers an offense for do in multiline while' 


  it 'registers an offense for do in multiline until' 


  it 'accepts do in single-line while' 


  it 'accepts do in single-line until' 


  it 'accepts multi-line while without do' 


  it 'accepts multi-line until without do' 


  it 'auto-corrects the usage of "do" in multiline while' 


  it 'auto-corrects the usage of "do" in multiline until' 

end

