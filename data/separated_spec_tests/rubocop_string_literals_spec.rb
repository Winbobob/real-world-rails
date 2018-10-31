# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::StringLiterals, :config do
  subject(:cop) { described_class.new(config) }

  context 'configured with single quotes preferred' do
    let(:cop_config) { { 'EnforcedStyle' => 'single_quotes' } }

    it 'registers offense for double quotes when single quotes suffice' 


    it 'registers offense for correct + opposite' 


    it 'accepts single quotes' 


    it 'accepts single quotes in interpolation' 


    it 'accepts %q and %Q quotes' 


    it 'accepts % quotes' 


    it 'accepts heredocs' 


    it 'accepts double quotes when new line is used' 


    it 'accepts double quotes when interpolating & quotes in multiple lines' 


    it 'accepts double quotes when single quotes are used' 


    it 'accepts double quotes when interpolating an instance variable' 


    it 'accepts double quotes when interpolating a global variable' 


    it 'accepts double quotes when interpolating a class variable' 


    it 'accepts double quotes when control characters are used' 


    it 'accepts double quotes when unicode control sequence is used' 


    it 'accepts double quotes at the start of regexp literals' 


    it 'accepts double quotes with some other special symbols' 


    it 'accepts " in a %w' 


    it 'accepts \\\\\n in a string' do # this would be: "\\\n"
      expect_no_offenses('"foo \\\\\n bar"')
    end

    it 'accepts double quotes in interpolation' 


    it 'detects unneeded double quotes within concatenated string' 


    it 'can handle a built-in constant parsed as string' 


    it 'can handle character literals' 


    it 'auto-corrects " with \'' 


    it 'registers an offense for "\""' 


    it 'registers an offense for words with non-ascii chars' 


    it 'autocorrects words with non-ascii chars' 


    it 'does not register an offense for words with non-ascii chars and ' \
       'other control sequences' do
      inspect_source('"España\n"')
      expect(cop.offenses.size).to eq(0)
    end

    it 'does not autocorrect words with non-ascii chars and other control ' \
       'sequences' do
      new_source = autocorrect_source('"España\n"')
      expect(new_source).to eq('"España\n"')
    end
  end

  context 'configured with double quotes preferred' do
    let(:cop_config) { { 'EnforcedStyle' => 'double_quotes' } }

    it 'registers offense for single quotes when double quotes would ' \
      'be equivalent' do
      expect_offense(<<-RUBY.strip_indent)
        s = 'abc'
            ^^^^^ Prefer double-quoted strings unless you need single quotes to avoid extra backslashes for escaping.
      RUBY
      expect(cop.config_to_allow_offenses).to eq('EnforcedStyle' =>
                                                 'single_quotes')
    end

    it 'registers offense for opposite + correct' 


    it 'registers offense for escaped single quote in single quotes' 


    it 'does not accept multiple escaped single quotes in single quotes' 


    it 'accepts double quotes' 


    it 'accepts single quotes in interpolation' 


    it 'accepts %q and %Q quotes' 


    it 'accepts % quotes' 


    it 'accepts heredocs' 


    it 'accepts single quotes in string with escaped non-\' character' 


    it 'accepts escaped single quote in string with escaped non-\' character' 


    it 'accepts single quotes when they are needed' 


    it 'flags single quotes with plain # (not #@var or #{interpolation}' 


    it 'accepts single quotes at the start of regexp literals' 


    it "accepts ' in a %w" 


    it 'can handle a built-in constant parsed as string' 


    it "auto-corrects ' with \"" 

  end

  context 'when configured with a bad value' do
    let(:cop_config) { { 'EnforcedStyle' => 'other' } }

    it 'fails' 

  end

  context 'when ConsistentQuotesInMultiline is true' do
    context 'and EnforcedStyle is single_quotes' do
      let(:cop_config) do
        {
          'ConsistentQuotesInMultiline' => true,
          'EnforcedStyle' => 'single_quotes'
        }
      end

      it 'registers an offense for strings with line breaks in them' 


      it 'accepts continued strings using all single quotes' 


      it 'registers an offense for mixed quote styles in a continued string' 


      it 'registers an offense for unneeded double quotes in continuation' 


      it "doesn't register offense for double quotes with interpolation" 


      it "doesn't register offense for double quotes with embedded single" 


      it 'accepts for double quotes with an escaped special character' 


      it 'accepts for double quotes with an escaped normal character' 


      it "doesn't choke on heredocs with inconsistent indentation" 

    end

    context 'and EnforcedStyle is double_quotes' do
      let(:cop_config) do
        {
          'ConsistentQuotesInMultiline' => true,
          'EnforcedStyle' => 'double_quotes'
        }
      end

      it 'accepts continued strings using all double quotes' 


      it 'registers an offense for mixed quote styles in a continued string' 


      it 'registers an offense for unneeded single quotes in continuation' 


      it "doesn't register offense for single quotes with embedded double" 

    end
  end
end

