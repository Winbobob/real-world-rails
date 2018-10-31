# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ModuleFunction, :config do
  subject(:cop) { described_class.new(config) }

  context 'when enforced style is `module_function`' do
    let(:cop_config) { { 'EnforcedStyle' => 'module_function' } }

    it 'registers an offense for `extend self` in a module' 


    it 'accepts `extend self` in a class' 


    it 'auto-corrects `extend self` to `module_function`' 

  end

  context 'when enforced style is `extend_self`' do
    let(:cop_config) { { 'EnforcedStyle' => 'extend_self' } }

    it 'registers an offense for `module_function` without an argument' 


    it 'accepts module_function with an argument' 


    it 'auto-corrects `module_function` to `extend self`' 

  end
end

