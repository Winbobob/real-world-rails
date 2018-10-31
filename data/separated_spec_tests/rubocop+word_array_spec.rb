# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::WordArray, :config do
  subject(:cop) { described_class.new(config) }

  before do
    # Reset data which is shared by all instances of WordArray
    described_class.largest_brackets = -Float::INFINITY
  end

  let(:other_cops) do
    {
      'Style/PercentLiteralDelimiters' => {
        'PreferredDelimiters' => {
          'default' => '()'
        }
      }
    }
  end

  context 'when EnforcedStyle is percent' do
    let(:cop_config) do
      { 'MinSize' => 0,
        'WordRegex' => /\A[\p{Word}\n\t]+\z/,
        'EnforcedStyle' => 'percent' }
    end

    it 'registers an offense for arrays of single quoted strings' 


    it 'registers an offense for arrays of double quoted strings' 


    it 'registers an offense for arrays of unicode word characters' 


    it 'registers an offense for arrays with character constants' 


    it 'registers an offense for strings with embedded newlines and tabs' 


    it 'registers an offense for strings with newline and tab escapes' 


    it 'uses %W when autocorrecting strings with newlines and tabs' 


    it 'does not register an offense for array of non-words' 


    it 'does not register an offense for array containing non-string' 


    it 'does not register an offense for array starting with %w' 


    it 'does not register an offense for array with empty strings' 


    # Bug: https://github.com/rubocop-hq/rubocop/issues/4481
    it 'does not register an offense in an ambiguous block context' 


    it 'registers an offense in a non-ambiguous block context' 


    it 'does not register offense for array with allowed number of strings' 


    it 'does not register an offense for an array with comments in it' 


    it 'registers an offense for an array with comments outside of it' 


    it 'auto-corrects an array of words' 


    it 'auto-corrects an array with one element' 


    it 'auto-corrects an array of words and character constants' 


    it 'keeps the line breaks in place after auto-correct' 


    it 'auto-corrects an array of words in multiple lines' 


    it 'auto-corrects an array of words using partial newlines' 


    it 'detects right value of MinSize to use for --auto-gen-config' 


    it 'detects when the cop must be disabled to avoid offenses' 


    it "doesn't fail in wacky ways when multiple cop instances are used" 

  end

  context 'when EnforcedStyle is array' do
    let(:cop_config) do
      { 'MinSize' => 0,
        'WordRegex' => /\A[\p{Word}]+\z/,
        'EnforcedStyle' => 'brackets' }
    end

    it 'does not register an offense for arrays of single quoted strings' 


    it 'does not register an offense for arrays of double quoted strings' 


    it 'registers an offense for a %w() array' 


    it 'auto-corrects a %w() array' 


    it 'autocorrects a %w() array which uses single quotes' 


    it 'autocorrects a %W() array which uses escapes' 


    it 'autocorrects a %W() array which uses string interpolation' 


    it "doesn't fail on strings which are not valid UTF-8" 


    it "doesn't fail on strings which are not valid UTF-8" \
       'and encoding: binary is specified' do
      expect_no_offenses(<<-'RUBY'.strip_indent)
        # -*- encoding: binary -*-
        ["\xC0",
         "\xC2\x4a",
         "\xC2\xC2",
         "\x4a\x82",
         "\x82\x82",
         "\xe1\x82\x4a",
        ]
      RUBY
    end
  end

  context 'with a custom WordRegex configuration' do
    let(:cop_config) { { 'MinSize' => 0, 'WordRegex' => /\A[\w@.]+\z/ } }

    it 'registers an offense for arrays of email addresses' 


    it 'auto-corrects an array of email addresses' 

  end

  context 'when the WordRegex configuration is not a Regexp' do
    let(:cop_config) { { 'WordRegex' => 'just_a_string' } }

    it 'still parses the code without raising an error' 

  end

  context 'with a WordRegex configuration which accepts almost anything' do
    let(:cop_config) { { 'MinSize' => 0, 'WordRegex' => /\S+/ } }

    it 'uses %W when autocorrecting strings with non-printable chars' 


    it 'uses %w for strings which only appear to have an escape' 

  end

  context 'with a treacherous WordRegex configuration' do
    let(:cop_config) { { 'MinSize' => 0, 'WordRegex' => /[\w \[\]\(\)]/ } }

    it "doesn't break when words contain whitespace" 


    it "doesn't break when words contain delimiters" 


    context 'when PreferredDelimiters is specified' do
      let(:other_cops) do
        {
          'Style/PercentLiteralDelimiters' => {
            'PreferredDelimiters' => {
              'default' => '[]'
            }
          }
        }
      end

      it 'autocorrects an array with delimiters' 

    end
  end

  context 'with non-default MinSize' do
    let(:cop_config) do
      { 'MinSize' => 2,
        'WordRegex' => /\A[\p{Word}\n\t]+\z/,
        'EnforcedStyle' => 'percent' }
    end

    it 'does not autocorrects arrays of one symbol if MinSize > 1' 

  end
end

