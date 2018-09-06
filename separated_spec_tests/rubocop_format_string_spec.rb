# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::FormatString, :config do
  subject(:cop) { described_class.new(config) }

  context 'when enforced style is sprintf' do
    let(:cop_config) { { 'EnforcedStyle' => 'sprintf' } }

    it 'registers an offense for a string followed by something' 


    it 'registers an offense for something followed by an array' 


    it 'does not register an offense for numbers' 


    it 'does not register an offense for ambiguous cases' 


    it 'works if the first operand contains embedded expressions' 


    it 'registers an offense for format' 


    it 'registers an offense for format with 2 arguments' 


    it 'auto-corrects format' 


    it 'auto-corrects String#%' 


    it 'auto-corrects String#% with an array argument' 


    it 'auto-corrects String#% with a hash argument' 

  end

  context 'when enforced style is format' do
    let(:cop_config) { { 'EnforcedStyle' => 'format' } }

    it 'registers an offense for a string followed by something' 


    it 'registers an offense for something followed by an array' 


    it 'registers an offense for something followed by a hash' 


    it 'does not register an offense for numbers' 


    it 'does not register an offense for ambiguous cases' 


    it 'works if the first operand contains embedded expressions' 


    it 'registers an offense for sprintf' 


    it 'registers an offense for sprintf with 2 arguments' 


    it 'auto-corrects sprintf' 


    it 'auto-corrects String#%' 


    it 'auto-corrects String#% with an array argument' 


    it 'auto-corrects String#% with a hash argument' 

  end

  context 'when enforced style is percent' do
    let(:cop_config) { { 'EnforcedStyle' => 'percent' } }

    it 'registers an offense for format' 


    it 'registers an offense for sprintf' 


    it 'registers an offense for sprintf with 3 arguments' 


    it 'accepts format with 1 argument' 


    it 'accepts sprintf with 1 argument' 


    it 'accepts format without arguments' 


    it 'accepts sprintf without arguments' 


    it 'accepts String#%' 


    it 'auto-corrects format with 2 arguments' 


    it 'auto-corrects format with 3 arguments' 


    it 'auto-corrects format with a hash argument' 


    it 'auto-corrects sprintf with 2 arguments' 


    it 'auto-corrects sprintf with 3 arguments' 


    it 'auto-corrects sprintf with a hash argument' 

  end
end

