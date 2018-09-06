# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::TrailingCommaInArrayLiteral, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'single line lists' do |extra_info|
    it 'registers an offense for trailing comma' 


    it 'accepts literal without trailing comma' 


    it 'accepts single element literal without trailing comma' 


    it 'accepts empty literal' 


    it 'accepts rescue clause' 


    it 'auto-corrects unwanted comma in literal' 

  end

  context 'with single line list of values' do
    context 'when EnforcedStyleForMultiline is no_comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'no_comma' } }

      include_examples 'single line lists', ''
    end

    context 'when EnforcedStyleForMultiline is comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'comma' } }

      include_examples 'single line lists',
                       ', unless each item is on its own line'
    end

    context 'when EnforcedStyleForMultiline is consistent_comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'consistent_comma' } }

      include_examples 'single line lists',
                       ', unless items are split onto multiple lines'
    end
  end

  context 'with multi-line list of values' do
    context 'when EnforcedStyleForMultiline is no_comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'no_comma' } }

      it 'registers an offense for trailing comma' 


      it 'accepts a literal with no trailing comma' 


      it 'auto-corrects unwanted comma' 

    end

    context 'when EnforcedStyleForMultiline is comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'comma' } }

      context 'when closing bracket is on same line as last value' do
        it 'accepts literal with no trailing comma' 

      end

      it 'accepts literal with two of the values on the same line' 


      it 'registers an offense for a literal with two of the values ' \
         'on the same line and a trailing comma' do
        inspect_source(<<-RUBY.strip_indent)
          VALUES = [
                     1001, 2020,
                     3333,
                   ]
        RUBY
        expect(cop.messages)
          .to eq(['Avoid comma after the last item of an array, unless each ' \
                  'item is on its own line.'])
      end

      it 'accepts trailing comma' 


      it 'accepts a multiline word array' 


      it 'accepts an empty array being passed as a method argument' 


      it 'auto-corrects literal with two of the values on the same' \
         ' line and a trailing comma' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          VALUES = [
                     1001, 2020,
                     3333
                   ]
        RUBY
        expect(new_source).to eq(<<-RUBY.strip_indent)
          VALUES = [
                     1001, 2020,
                     3333
                   ]
        RUBY
      end

      it 'accepts a multiline array with a single item and trailing comma' 

    end

    context 'when EnforcedStyleForMultiline is consistent_comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'consistent_comma' } }

      context 'when closing bracket is on same line as last value' do
        it 'registers an offense for no trailing comma' 

      end

      it 'accepts two values on the same line' 


      it 'registers an offense for literal with two of the values ' \
         'on the same line and no trailing comma' do
        inspect_source(<<-RUBY.strip_indent)
          VALUES = [
                     1001, 2020,
                     3333
                   ]
        RUBY
        expect(cop.messages)
          .to eq(['Put a comma after the last item of a multiline array.'])
      end

      it 'accepts trailing comma' 


      it 'accepts a multiline word array' 


      it 'auto-corrects a literal with two of the values on the same' \
         ' line and a trailing comma' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          VALUES = [
                     1001, 2020,
                     3333
                   ]
        RUBY
        expect(new_source).to eq(<<-RUBY.strip_indent)
          VALUES = [
                     1001, 2020,
                     3333,
                   ]
        RUBY
      end

      it 'accepts a multiline array with a single item and trailing comma' 


      it 'accepts a multiline array with items on a single line and' \
         'trailing comma' do
        inspect_source(<<-RUBY.strip_indent)
          foo = [
            1, 2,
          ]
        RUBY
        expect(cop.offenses.empty?).to be(true)
      end
    end
  end
end

