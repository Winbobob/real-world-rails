# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::VariableName, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'always accepted' do
    it 'accepts screaming snake case globals' 


    it 'accepts screaming snake case constants' 


    it 'accepts assigning to camel case constant' 


    it 'accepts assignment with indexing of self' 

  end

  context 'when configured for snake_case' do
    let(:cop_config) { { 'EnforcedStyle' => 'snake_case' } }

    it 'registers an offense for camel case in local variable name' 


    it 'registers an offense for correct + opposite' 


    it 'registers an offense for camel case in instance variable name' 


    it 'registers an offense for camel case in class variable name' 


    it 'registers an offense for camel case local variables marked as unused' 


    it 'registers an offense for method arguments' 


    it 'registers an offense for default method arguments' 


    it 'registers an offense for rest arguments' 


    it 'registers an offense for keyword arguments' 


    it 'registers an offense for keyword rest arguments' 


    it 'registers an offense for block arguments' 


    include_examples 'always accepted'
  end

  context 'when configured for camelCase' do
    let(:cop_config) { { 'EnforcedStyle' => 'camelCase' } }

    it 'registers an offense for snake case in local variable name' 


    it 'registers an offense for opposite + correct' 


    it 'accepts camel case in local variable name' 


    it 'accepts camel case in instance variable name' 


    it 'accepts camel case in class variable name' 


    it 'registers an offense for snake case in method parameter' 


    it 'accepts camel case local variables marked as unused' 


    it 'registers an offense for default method arguments' 


    it 'registers an offense for rest arguments' 


    it 'registers an offense for keyword arguments' 


    it 'registers an offense for keyword rest arguments' 


    it 'registers an offense for block arguments' 


    include_examples 'always accepted'
  end
end

