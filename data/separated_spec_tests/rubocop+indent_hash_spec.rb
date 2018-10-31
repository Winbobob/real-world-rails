# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::IndentHash do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    supported_styles = {
      'SupportedStyles' => %w[special_inside_parentheses consistent
                              align_braces]
    }
    RuboCop::Config.new('Layout/AlignHash' => align_hash_config,
                        'Layout/IndentHash' =>
                        cop_config.merge(supported_styles).merge(
                          'IndentationWidth' => cop_indent
                        ),
                        'Layout/IndentationWidth' => { 'Width' => 2 })
  end
  let(:align_hash_config) do
    {
      'Enabled' => true,
      'EnforcedColonStyle' => 'key',
      'EnforcedHashRocketStyle' => 'key'
    }
  end
  let(:cop_config) { { 'EnforcedStyle' => 'special_inside_parentheses' } }
  let(:cop_indent) { nil } # use indentation width from Layout/IndentationWidth

  shared_examples 'right brace' do
    it 'registers an offense for incorrectly indented }' 

  end

  context 'when the AlignHash style is separator for :' do
    let(:align_hash_config) do
      {
        'Enabled' => true,
        'EnforcedColonStyle' => 'separator',
        'EnforcedHashRocketStyle' => 'key'
      }
    end

    it 'accepts correctly indented first pair' 


    it 'registers an offense for incorrectly indented first pair with :' 


    include_examples 'right brace'
  end

  context 'when the AlignHash style is separator for =>' do
    let(:align_hash_config) do
      {
        'Enabled' => true,
        'EnforcedColonStyle' => 'key',
        'EnforcedHashRocketStyle' => 'separator'
      }
    end

    it 'accepts correctly indented first pair' 


    it 'registers an offense for incorrectly indented first pair with =>' 


    include_examples 'right brace'
  end

  context 'when hash is operand' do
    it 'accepts correctly indented first pair' 


    it 'registers an offense for incorrectly indented first pair' 


    it 'auto-corrects incorrectly indented first pair' 


    include_examples 'right brace'
  end

  context 'when hash is argument to setter' do
    it 'accepts correctly indented first pair' 


    it 'registers an offense for incorrectly indented first pair' 

  end

  context 'when hash is right hand side in assignment' do
    it 'registers an offense for incorrectly indented first pair' 


    it 'auto-corrects incorrectly indented first pair' 


    it 'accepts correctly indented first pair' 


    it 'accepts several pairs per line' 


    it 'accepts a first pair on the same line as the left brace' 


    it 'accepts single line hash' 


    it 'accepts an empty hash' 


    context 'when indentation width is overridden for this cop' do
      let(:cop_indent) { 3 }

      it 'auto-corrects incorrectly indented first pair' 


      it 'accepts correctly indented first pair' 

    end
  end

  context 'when hash is method argument' do
    context 'and arguments are surrounded by parentheses' do
      context 'and EnforcedStyle is special_inside_parentheses' do
        it 'accepts special indentation for first argument' 


        it "registers an offense for 'consistent' indentation" 


        it "registers an offense for 'align_braces' indentation" 


        it 'auto-corrects incorrectly indented first pair' 


        it 'accepts special indentation for second argument' 


        it 'accepts normal indentation for hash within hash' 

      end

      context 'and EnforcedStyle is consistent' do
        let(:cop_config) { { 'EnforcedStyle' => 'consistent' } }

        it 'accepts normal indentation for first argument' 


        it 'registers an offense for incorrect indentation' 


        it 'accepts normal indentation for second argument' 

      end
    end

    context 'and argument are not surrounded by parentheses' do
      it 'accepts braceless hash' 


      it 'accepts single line hash with braces' 


      it 'accepts a correctly indented multi-line hash with braces' 


      it 'registers an offense for incorrectly indented multi-line hash ' \
         'with braces' do
        expect_offense(<<-RUBY.strip_indent)
          func x, {
                 a: 1, b: 2 }
                 ^^^^ Use 2 spaces for indentation in a hash, relative to the start of the line where the left curly brace is.
        RUBY
      end
    end
  end

  context 'when EnforcedStyle is align_braces' do
    let(:cop_config) { { 'EnforcedStyle' => 'align_braces' } }

    it 'accepts correctly indented first pair' 


    it 'accepts several pairs per line' 


    it 'accepts a first pair on the same line as the left brace' 


    it 'accepts single line hash' 


    it 'accepts an empty hash' 


    context "when 'consistent' style is used" do
      it 'registers an offense for incorrect indentation' 


      it 'auto-corrects incorrectly indented first pair' 

    end

    context "when 'special_inside_parentheses' style is used" do
      it 'registers an offense for incorrect indentation' 

    end

    it 'registers an offense for incorrectly indented }' 

  end
end

