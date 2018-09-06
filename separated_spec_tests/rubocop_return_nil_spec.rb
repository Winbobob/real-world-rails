# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ReturnNil do
  subject(:cop) { described_class.new(config) }

  context 'when enforced style is `return`' do
    let(:config) do
      RuboCop::Config.new(
        'Style/ReturnNil' => {
          'EnforcedStyle' => 'return',
          'SupportedStyles' => %w[return return_nil]
        }
      )
    end

    it 'registers an offense for return nil' 


    it 'auto-corrects `return nil` into `return`' 


    it 'does not register an offense for return' 


    it 'does not register an offense for returning others' 


    it 'does not register an offense for return nil from iterators' 

  end

  context 'when enforced style is `return_nil`' do
    let(:config) do
      RuboCop::Config.new(
        'Style/ReturnNil' => {
          'EnforcedStyle' => 'return_nil',
          'SupportedStyles' => %w[return return_nil]
        }
      )
    end

    it 'registers an offense for return' 


    it 'auto-corrects `return` into `return nil`' 


    it 'does not register an offense for return nil' 


    it 'does not register an offense for returning others' 

  end
end

