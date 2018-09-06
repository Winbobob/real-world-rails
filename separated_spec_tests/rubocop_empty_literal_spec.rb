# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::EmptyLiteral do
  subject(:cop) { described_class.new }

  describe 'Empty Array' do
    it 'registers an offense for Array.new()' 


    it 'registers an offense for Array.new' 


    it 'does not register an offense for Array.new(3)' 


    it 'auto-corrects Array.new to []' 


    it 'auto-corrects Array.new in block in block' 


    it 'does not registers an offense Array.new with block' 


    it 'does not register Array.new with block in other block' 

  end

  describe 'Empty Hash' do
    it 'registers an offense for Hash.new()' 


    it 'registers an offense for Hash.new' 


    it 'does not register an offense for Hash.new(3)' 


    it 'does not register an offense for Hash.new { block }' 


    it 'auto-corrects Hash.new to {}' 


    it 'auto-corrects Hash.new in block ' 


    it 'auto-corrects Hash.new to {} in various contexts' 


    it 'auto-correct Hash.new to {} as the only parameter to a method' 


    it 'auto-correct Hash.new to {} as the first parameter to a method' 

  end

  describe 'Empty String' do
    it 'registers an offense for String.new()' 


    it 'registers an offense for String.new' 


    it 'does not register an offense for String.new("top")' 


    it 'auto-corrects String.new to empty string literal' 


    context 'when double-quoted string literals are preferred' do
      subject(:cop) { described_class.new(config) }

      let(:config) do
        RuboCop::Config.new(
          'Style/StringLiterals' =>
            {
              'EnforcedStyle' => 'double_quotes'
            }
        )
      end

      it 'registers an offense for String.new' 


      it 'auto-corrects String.new to a double-quoted empty string literal' 

    end

    context 'when frozen string literals is enabled' do
      let(:ruby_version) { 2.3 }

      it 'does not register an offense for String.new' 

    end
  end
end

