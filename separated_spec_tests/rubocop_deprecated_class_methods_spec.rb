# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::DeprecatedClassMethods do
  subject(:cop) { described_class.new }

  it 'registers an offense for File.exists?' 


  it 'registers an offense for ::File.exists?' 


  it 'does not register an offense for File.exist?' 


  it 'registers an offense for Dir.exists?' 


  it 'auto-corrects File.exists? with File.exist?' 


  it 'auto-corrects Dir.exists? with Dir.exist?' 

end

