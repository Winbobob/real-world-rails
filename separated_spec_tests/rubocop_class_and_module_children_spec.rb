# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ClassAndModuleChildren, :config do
  subject(:cop) { described_class.new(config) }

  context 'nested style' do
    let(:cop_config) { { 'EnforcedStyle' => 'nested' } }

    it 'registers an offense for not nested classes' 


    it 'registers an offense for not nested classes with explicit superclass' 


    it 'registers an offense for not nested modules' 


    it 'accepts nested children' 


    it 'accepts :: in parent class on inheritance' 

  end

  context 'compact style' do
    let(:cop_config) { { 'EnforcedStyle' => 'compact' } }

    it 'registers a offense for classes with nested children' 


    it 'registers a offense for modules with nested children' 


    it 'accepts compact style for classes/modules' 


    it 'accepts nesting for classes/modules with more than one child' 


    it 'accepts class/module with single method' 


    it 'accepts nesting for classes with an explicit superclass' 

  end

  context 'autocorrect' do
    let(:cop_config) do
      { 'AutoCorrect' => 'true', 'EnforcedStyle' => enforced_style }
    end

    context 'nested style' do
      let(:enforced_style) { 'nested' }

      it 'corrects a not nested class' 


      it 'corrects a not nested class with explicit superclass' 


      it 'corrects a not nested module' 


      it 'does not correct nested children' 


      it 'does not correct :: in parent class on inheritance' 

    end

    context 'compact style' do
      let(:enforced_style) { 'compact' }

      it 'corrects nested children' 


      it 'corrects modules with nested children' 


      it 'does not correct compact style for classes/modules' 


      it 'does not correct nested classes/modules with more than one child' 


      it 'does not correct class/module with single method' 


      it 'does not correct nesting for classes with an explicit superclass' 

    end
  end
end

