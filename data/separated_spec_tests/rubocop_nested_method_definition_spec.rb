# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::NestedMethodDefinition do
  subject(:cop) { described_class.new }

  it 'registers an offense for a nested method definition' 


  it 'registers an offense for a nested singleton method definition' 


  it 'registers an offense for a nested method definition inside lambda' 


  it 'registers an offense for a nested class method definition' 


  it 'does not register an offense for a lambda definition inside method' 


  it 'does not register offense for nested definition inside instance_eval' 


  it 'does not register offense for nested definition inside instance_exec' 


  it 'does not register offense for definition of method on local var' 


  it 'does not register offense for nested definition inside class_eval' 


  it 'does not register offense for nested definition inside class_exec' 


  it 'does not register offense for nested definition inside module_eval' 


  it 'does not register offense for nested definition inside module_exec' 


  it 'does not register offense for nested definition inside class shovel' 


  it 'does not register offense for nested definition inside Class.new' 


  it 'does not register offense for nested definition inside Module.new' 


  it 'does not register offense for nested definition inside Struct.new' 

end

