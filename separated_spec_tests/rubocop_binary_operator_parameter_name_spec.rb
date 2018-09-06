# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::BinaryOperatorParameterName do
  subject(:cop) { described_class.new }

  %i[+ eql? equal?].each do |op|
    it "registers an offense for #{op} with arg not named other" 

  end

  it 'works properly even if the argument not surrounded with braces' 


  it 'does not register an offense for arg named other' 


  it 'does not register an offense for arg named _other' 


  it 'does not register an offense for []' 


  it 'does not register an offense for []=' 


  it 'does not register an offense for <<' 


  it 'does not register an offense for non binary operators' 

end

