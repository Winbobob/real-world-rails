# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ImplicitRuntimeError do
  subject(:cop) { described_class.new }

  it 'registers an offense for `raise` without error class' 


  it 'registers an offense for `fail` without error class' 


  it 'registers an offense for `raise` with a multiline string' 


  it 'registers an offense for `fail` with a multiline string' 


  it 'does not register an offense for `raise` with an error class' 


  it 'does not register an offense for `fail` with an error class' 


  it 'does not register an offense for `raise` without arguments' 


  it 'does not register an offense for `fail` without arguments' 

end

