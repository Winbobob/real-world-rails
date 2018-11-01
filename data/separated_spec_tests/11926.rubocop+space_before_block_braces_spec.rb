# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceBeforeBlockBraces, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnforcedStyle' => 'space' } }

  context 'when EnforcedStyle is space' do
    it 'accepts braces surrounded by spaces' 


    it 'registers an offense for left brace without outer space' 


    it 'registers an offense for opposite + correct style' 


    it 'registers an offense for multiline block where left brace has no ' \
       'outer space' do
      expect_offense(<<-RUBY.strip_indent)
        foo.map{ |a|
               ^ Space missing to the left of {.
          a.bar.to_s
        }
      RUBY
    end

    it 'auto-corrects missing space' 

  end

  context 'when EnforcedStyle is no_space' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_space' } }

    it 'registers an offense for braces surrounded by spaces' 


    it 'registers an offense for correct + opposite style' 


    it 'accepts left brace without outer space' 

  end

  context 'with space before empty braces not allowed' do
    let(:cop_config) do
      {
        'EnforcedStyle' => 'space',
        'EnforcedStyleForEmptyBraces' => 'no_space'
      }
    end

    it 'accepts empty braces without outer space' 


    it 'registers an offense for empty braces' 


    it 'auto-corrects unwanted space' 

  end

  context 'with space before empty braces allowed' do
    let(:cop_config) do
      {
        'EnforcedStyle' => 'no_space',
        'EnforcedStyleForEmptyBraces' => 'space'
      }
    end

    it 'accepts empty braces with outer space' 


    it 'registers an offense for empty braces' 


    it 'auto-corrects missing space' 

  end

  context 'with invalid value for EnforcedStyleForEmptyBraces' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBraces' => 'unknown' } }

    it 'fails with an error' 

  end
end

