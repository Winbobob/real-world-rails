# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Rails::Exit, :config do
  subject(:cop) { described_class.new }

  it 'registers an offense for an exit call with no receiver' 


  it 'registers an offense for an exit! call with no receiver' 


  context 'exit calls on objects' do
    it 'does not register an offense for an explicit exit call on an object' 


    it 'does not register an offense for an explicit exit call '\
      'with an argument on an object' do
      expect_no_offenses('Object.new.exit(0)')
    end

    it 'does not register an offense for an explicit exit! call on an object' 

  end

  context 'with arguments' do
    it 'registers an offense for an exit(0) call with no receiver' 


    it 'ignores exit calls with unexpected number of parameters' 

  end

  context 'explicit calls' do
    it 'does register an offense for explicit Kernel.exit calls' 


    it 'does register an offense for explicit Process.exit calls' 

  end
end

