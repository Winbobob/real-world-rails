# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::StringLiteralsInInterpolation, :config do
  subject(:cop) { described_class.new(config) }

  context 'configured with single quotes preferred' do
    let(:cop_config) { { 'EnforcedStyle' => 'single_quotes' } }

    it 'registers an offense for double quotes within embedded expression' 


    it 'registers an offense for double quotes within embedded expression in ' \
       'a heredoc string' do
      expect_offense(<<-'SOURCE'.strip_indent)
        <<RUBY
        #{"A"}
          ^^^ Prefer single-quoted strings inside interpolations.
        RUBY
      SOURCE
    end

    it 'accepts double quotes on a static string' 


    it 'accepts double quotes on a broken static string' 


    it 'accepts double quotes on static strings within a method' 


    it 'can handle a built-in constant parsed as string' 


    it 'can handle character literals' 


    it 'auto-corrects " with \'' 

  end

  context 'configured with double quotes preferred' do
    let(:cop_config) { { 'EnforcedStyle' => 'double_quotes' } }

    it 'registers an offense for single quotes within embedded expression' 


    it 'registers an offense for single quotes within embedded expression in ' \
       'a heredoc string' do
      expect_offense(<<-'SOURCE'.strip_indent)
        <<RUBY
        #{'A'}
          ^^^ Prefer double-quoted strings inside interpolations.
        RUBY
      SOURCE
    end
  end

  context 'when configured with a bad value' do
    let(:cop_config) { { 'EnforcedStyle' => 'other' } }

    it 'fails' 

  end
end

