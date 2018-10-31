# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::OrAssignment do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  context 'when using var = var ? var : something' do
    it 'registers an offense with normal variables' 


    it 'registers an offense with instance variables' 


    it 'registers an offense with class variables' 


    it 'registers an offense with global variables' 


    it 'autocorrects normal variables to `var ||= something`' 


    it 'autocorrects instance variables to `var ||= something`' 


    it 'autocorrects class variables to `var ||= something`' 


    it 'autocorrects global variables to `var ||= something`' 


    it 'does not register an offense if any of the variables are different' 

  end

  context 'when using var = if var; var; else; something; end' do
    it 'registers an offense with normal variables' 


    it 'registers an offense with instance variables' 


    it 'registers an offense with class variables' 


    it 'registers an offense with global variables' 


    it 'autocorrects normal variables to `var ||= something`' 


    it 'autocorrects instance variables to `var ||= something`' 


    it 'autocorrects class variables to `var ||= something`' 


    it 'autocorrects global variables to `var ||= something`' 


    it 'does not register an offense if any of the variables are different' 

  end

  context 'when using var = something unless var' do
    it 'registers an offense for normal variables' 


    it 'registers an offense for instance variables' 


    it 'registers an offense for class variables' 


    it 'registers an offense for global variables' 


    it 'autocorrects normal variables to `var ||= something`' 


    it 'autocorrects instance variables to `var ||= something`' 


    it 'autocorrects class variables to `var ||= something`' 


    it 'autocorrects global variables to `var ||= something`' 


    it 'does not register an offense if any of the variables are different' 

  end

  context 'when using unless var; var = something; end' do
    it 'registers an offense for normal variables' 


    it 'registers an offense for instance variables' 


    it 'registers an offense for class variables' 


    it 'registers an offense for global variables' 


    it 'autocorrects normal variables to `var ||= something`' 


    it 'autocorrects instance variables to `var ||= something`' 


    it 'autocorrects class variables to `var ||= something`' 


    it 'autocorrects global variables to `var ||= something`' 


    it 'does not register an offense if any of the variables are different' 

  end
end

