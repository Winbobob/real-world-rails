# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MultilineIfThen do
  subject(:cop) { described_class.new }

  # if

  it 'does not get confused by empty elsif branch' 


  it 'registers an offense for then in multiline if' 


  it 'registers an offense for then in multiline elsif' 


  it 'accepts multiline if without then' 


  it 'accepts table style if/then/elsif/ends' 


  it 'does not get confused by a then in a when' 


  it 'does not get confused by a commented-out then' 


  it 'does not raise an error for an implicit match if' 


  # unless

  it 'registers an offense for then in multiline unless' 


  it 'accepts multiline unless without then' 


  it 'does not get confused by a postfix unless' 


  it 'does not get confused by a nested postfix unless' 


  it 'does not raise an error for an implicit match unless' 


  it 'auto-corrects the usage of "then" in multiline if' 

end

