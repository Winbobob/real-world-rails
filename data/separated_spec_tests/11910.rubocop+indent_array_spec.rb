# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::IndentArray do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    supported_styles = {
      'SupportedStyles' => %w[special_inside_parentheses consistent
                              align_brackets]
    }
    RuboCop::Config.new('Layout/IndentArray' =>
                        cop_config.merge(supported_styles).merge(
                          'IndentationWidth' => cop_indent
                        ),
                        'Layout/IndentationWidth' => { 'Width' => 2 })
  end
  let(:cop_config) { { 'EnforcedStyle' => 'special_inside_parentheses' } }
  let(:cop_indent) { nil } # use indent from Layout/IndentationWidth

  context 'when array is operand' do
    it 'accepts correctly indented first element' 


    it 'registers an offense for incorrectly indented first element' 


    it 'auto-corrects incorrectly indented first element' 


    it 'registers an offense for incorrectly indented ]' 


    context 'when indentation width is overridden for this cop' do
      let(:cop_indent) { 4 }

      it 'accepts correctly indented first element' 


      it 'registers an offense for incorrectly indented first element' 

    end
  end

  context 'when array is argument to setter' do
    it 'accepts correctly indented first element' 


    it 'registers an offense for incorrectly indented first element' 

  end

  context 'when array is right hand side in assignment' do
    it 'registers an offense for incorrectly indented first element' 


    it 'auto-corrects incorrectly indented first element' 


    it 'accepts correctly indented first element' 


    it 'accepts several elements per line' 


    it 'accepts a first element on the same line as the left bracket' 


    it 'accepts single line array' 


    it 'accepts an empty array' 


    it 'accepts multi-assignments with brackets' 


    it 'accepts multi-assignments with no brackets' 

  end

  context 'when array is method argument' do
    context 'and arguments are surrounded by parentheses' do
      context 'and EnforcedStyle is special_inside_parentheses' do
        it 'accepts special indentation for first argument' 


        it "registers an offense for 'consistent' indentation" 


        it "registers an offense for 'align_brackets' indentation" 


        it 'auto-corrects incorrectly indented first element' 


        it 'accepts special indentation for second argument' 


        it 'accepts normal indentation for array within array' 

      end

      context 'and EnforcedStyle is consistent' do
        let(:cop_config) { { 'EnforcedStyle' => 'consistent' } }

        it 'accepts normal indentation for first argument' 


        it 'registers an offense for incorrect indentation' 


        it 'accepts normal indentation for second argument' 

      end
    end

    context 'and argument are not surrounded by parentheses' do
      it 'accepts bracketless array' 


      it 'accepts single line array with brackets' 


      it 'accepts a correctly indented multi-line array with brackets' 


      it 'registers an offense for incorrectly indented multi-line array ' \
         'with brackets' do
        expect_offense(<<-RUBY.strip_indent)
          func x, [
                 1, 2]
                 ^ Use 2 spaces for indentation in an array, relative to the start of the line where the left square bracket is.
        RUBY
      end
    end
  end

  context 'when EnforcedStyle is align_brackets' do
    let(:cop_config) { { 'EnforcedStyle' => 'align_brackets' } }

    it 'accepts correctly indented first element' 


    it 'accepts several elements per line' 


    it 'accepts a first element on the same line as the left bracket' 


    it 'accepts single line array' 


    it 'accepts an empty array' 


    it 'accepts multi-assignments with brackets' 


    it 'accepts multi-assignments with no brackets' 


    context "when 'consistent' style is used" do
      it 'registers an offense for incorrect indentation' 


      it 'auto-corrects incorrectly indented first element' 

    end

    context "when 'special_inside_parentheses' style is used" do
      it 'registers an offense for incorrect indentation' 

    end

    it 'registers an offense for incorrectly indented ]' 


    context 'when indentation width is overridden for this cop' do
      let(:cop_indent) { 4 }

      it 'accepts correctly indented first element' 


      it 'autocorrects indentation which does not match IndentationWidth' 

    end
  end
end

