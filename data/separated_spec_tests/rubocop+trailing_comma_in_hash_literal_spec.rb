# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::TrailingCommaInHashLiteral, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'single line lists' do |extra_info|
    it 'registers an offense for trailing comma in a literal' 


    it 'accepts literal without trailing comma' 


    it 'accepts single element literal without trailing comma' 


    it 'accepts empty literal' 


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

      it 'registers an offense for trailing comma in literal' 


      it 'accepts literal with no trailing comma' 


      it 'accepts comma inside a heredoc parameters at the end' 


      it 'accepts comma in comment after last value item' 


      it 'auto-corrects unwanted comma in literal' 

    end

    context 'when EnforcedStyleForMultiline is comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'comma' } }

      context 'when closing bracket is on same line as last value' do
        it 'accepts literal with no trailing comma' 

      end

      it 'registers an offense for no trailing comma' 


      it 'registers an offense for trailing comma in a comment' 


      it 'accepts trailing comma' 


      it 'accepts missing comma after a heredoc' 


      it 'auto-corrects missing comma' 


      it 'accepts a multiline hash with a single pair and trailing comma' 

    end

    context 'when EnforcedStyleForMultiline is consistent_comma' do
      let(:cop_config) { { 'EnforcedStyleForMultiline' => 'consistent_comma' } }

      context 'when closing bracket is on same line as last value' do
        it 'registers an offense for literal with no trailing comma' 


        it 'auto-corrects a missing comma' 

      end

      it 'registers an offense for no trailing comma' 


      it 'accepts trailing comma' 


      it 'accepts missing comma after a heredoc' 


      it 'auto-corrects missing comma' 


      it 'accepts a multiline hash with a single pair and trailing comma' 


      it 'accepts a multiline hash with pairs on a single line and' \
         'trailing comma' do
        expect_no_offenses(<<-RUBY.strip_indent)
          bar = {
            a: 1001, b: 2020,
          }
        RUBY
      end
    end
  end
end

