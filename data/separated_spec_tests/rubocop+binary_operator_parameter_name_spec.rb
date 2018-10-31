# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::BinaryOperatorParameterName do
  subject(:cop) { described_class.new }

  it 'registers an offense for `#+` when argument is not named other' 


  it 'registers an offense for `#eql?` when argument is not named other' 


  it 'registers an offense for `#equal?` when argument is not named other' 


  it 'works properly even if the argument not surrounded with braces' 


  it 'does not register an offense for arg named other' 


  it 'does not register an offense for arg named _other' 


  it 'does not register an offense for []' 


  it 'does not register an offense for []=' 


  it 'does not register an offense for <<' 


  it 'does not register an offense for ===' 


  it 'does not register an offense for non binary operators' 

end

