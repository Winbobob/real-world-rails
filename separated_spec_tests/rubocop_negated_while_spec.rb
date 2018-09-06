# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NegatedWhile do
  subject(:cop) { described_class.new }

  it 'registers an offense for while with exclamation point condition' 


  it 'registers an offense for until with exclamation point condition' 


  it 'registers an offense for while with "not" condition' 


  it 'accepts a while where only part of the condition is negated' 


  it 'accepts a while where the condition is doubly negated' 


  it 'autocorrects by replacing while not with until' 


  it 'autocorrects by replacing until not with while' 


  it 'does not blow up for empty while condition' 


  it 'does not blow up for empty until condition' 

end

