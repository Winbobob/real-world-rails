# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::CharacterLiteral do
  subject(:cop) { described_class.new }

  it 'registers an offense for character literals' 


  it 'registers an offense for literals like \n' 


  it 'accepts literals like ?\C-\M-d' 


  it 'accepts ? in a %w literal' 


  it "auto-corrects ?x to 'x'" 


  it 'auto-corrects ?\n to "\\n"' 


  it 'auto-corrects ?\' to "\'"' 

end

