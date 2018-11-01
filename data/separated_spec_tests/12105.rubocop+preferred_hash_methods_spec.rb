# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::PreferredHashMethods, :config do
  subject(:cop) { described_class.new(config) }

  context 'with enforced `short` style' do
    let(:cop_config) { { 'EnforcedStyle' => 'short' } }

    it 'registers an offense for has_key? with one arg' 


    it 'accepts has_key? with no args' 


    it 'registers an offense for has_value? with one arg' 


    it 'accepts has_value? with no args' 


    it 'auto-corrects has_key? with key?' 


    it 'auto-corrects has_value? with value?' 

  end

  context 'with enforced `verbose` style' do
    let(:cop_config) { { 'EnforcedStyle' => 'verbose' } }

    it 'registers an offense for key? with one arg' 


    it 'accepts key? with no args' 


    it 'registers an offense for value? with one arg' 


    it 'accepts value? with no args' 


    it 'auto-corrects key? with has_key?' 


    it 'auto-corrects value? with has_value?' 

  end
end

