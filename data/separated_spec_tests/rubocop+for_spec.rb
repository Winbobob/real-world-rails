# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::For, :config do
  subject(:cop) { described_class.new(config) }

  context 'when each is the enforced style' do
    let(:cop_config) { { 'EnforcedStyle' => 'each' } }

    it 'registers an offense for for' 


    it 'registers an offense for opposite + correct style' 


    context 'auto-correct' do
      it 'changes for to each' 


      context 'with range' do
        let(:expected_each_with_range) do
          <<-RUBY.strip_indent
            def func
              (1...value).each do |n|
                puts n
              end
            end
          RUBY
        end

        it 'changes for to each' 


        it 'changes for that does not have do or semicolon to each' 


        context 'without parentheses' do
          it 'changes for to each' 


          it 'changes for that does not have do or semicolon to each' 

        end
      end

      it 'corrects a tuple of items' 


      it 'changes for that does not have do or semicolon to each' 

    end

    it 'accepts multiline each' 


    it 'accepts :for' 


    it 'accepts def for' 

  end

  context 'when for is the enforced style' do
    let(:cop_config) { { 'EnforcedStyle' => 'for' } }

    it 'accepts for' 


    it 'registers an offense for multiline each' 


    it 'registers an offense for each without an item' 


    it 'registers an offense for correct + opposite style' 


    context 'auto-correct' do
      it 'changes each to for' 


      it 'corrects each to for and uses _ as the item' 


      it 'corrects a tuple of items' 

    end

    it 'accepts single line each' 


    context 'when using safe navigation operator' do
      let(:ruby_version) { 2.3 }

      it 'does not break' 

    end
  end
end

