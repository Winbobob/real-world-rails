# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ClassMethods do
  subject(:cop) { described_class.new }

  it 'registers an offense for methods using a class name' 


  it 'registers an offense for methods using a module name' 


  it 'does not register an offense for methods using self' 


  it 'does not register an offense for other top-level singleton methods' 


  it 'does not register an offense outside class/module bodies' 


  it 'autocorrects class name to self' 

end

