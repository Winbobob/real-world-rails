# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::StringReplacement do
  subject(:cop) { described_class.new }

  it 'accepts methods other than gsub' 


  shared_examples 'accepts' do |method|
    context 'non deterministic parameters' do
      it 'accepts gsub when the length of the pattern is greater than 1' 


      it 'accepts the first param being a variable' 


      it 'accepts the second param being a variable' 


      it 'accepts the both params being a variables' 


      it 'accepts gsub with only one param' 


      it 'accepts gsub with a block' 


      it 'accepts a pattern with string interpolation' 


      it 'accepts a replacement with string interpolation' 


      it 'allows empty regex literal pattern' 


      it 'allows empty regex pattern from string' 


      it 'allows empty regex pattern from regex' 


      it 'allows regex literals with options' 


      it 'allows regex with options' 


      it 'allows empty string pattern' 

    end

    it 'accepts calls to gsub when the length of the pattern is shorter than ' \
       'the length of the replacement' do
      expect_no_offenses("'abc'.#{method}('a', 'ab')")
    end

    it 'accepts calls to gsub when the length of the pattern is longer than ' \
       'the length of the replacement' do
      expect_no_offenses("'abc'.#{method}('ab', 'd')")
    end
  end

  it_behaves_like('accepts', 'gsub')
  it_behaves_like('accepts', 'gsub!')

  describe 'deterministic regex' do
    describe 'regex literal' do
      it 'registers an offense when using space' 


      %w[a b c ' " % ! = < > # & ; : ` ~ 1 2 3 - _ , \r \\\\ \y \u1234
         \x65].each do |str|
        it "registers an offense when replacing #{str} with a literal" 


        it "registers an offense when deleting #{str}" 

      end

      it 'allows deterministic regex when the length of the pattern ' \
         'and the length of the replacement do not match' do
        expect_no_offenses(%('abc'.gsub(/a/, 'def')))
      end

      it 'registers an offense when escape characters in regex' 


      it 'registers an offense when using %r notation' 

    end

    describe 'regex constructor' do
      it 'registers an offense when only using word characters' 


      it 'registers an offense when regex is built from regex' 


      it 'registers an offense when using compile' 

    end
  end

  describe 'non deterministic regex' do
    it 'allows regex containing a +' 


    it 'allows regex containing a *' 


    it 'allows regex containing a ^' 


    it 'allows regex containing a $' 


    it 'allows regex containing a ?' 


    it 'allows regex containing a .' 


    it 'allows regex containing a |' 


    it 'allows regex containing ()' 


    it 'allows regex containing escaped ()' 


    it 'allows regex containing {}' 


    it 'allows regex containing []' 


    it 'allows regex containing a backslash' 


    it 'allows regex literal containing interpolations' 


    it 'allows regex constructor containing a string with interpolations' 


    it 'allows regex constructor containing regex with interpolations' 

  end

  it 'registers an offense when the pattern has non deterministic regex ' \
     'as a string' do
    expect_offense(<<-RUBY.strip_indent)
      'a + c'.gsub('+', '-')
              ^^^^^^^^^^^^^^ Use `tr` instead of `gsub`.
    RUBY
  end

  it 'registers an offense when using gsub to find and replace ' \
     'a single character' do
    expect_offense(<<-RUBY.strip_indent)
      'abc'.gsub('a', '1')
            ^^^^^^^^^^^^^^ Use `tr` instead of `gsub`.
    RUBY
  end

  it 'registers an offense when using gsub! to find and replace ' \
     'a single character ' do
    expect_offense(<<-RUBY.strip_indent)
      'abc'.gsub!('a', '1')
            ^^^^^^^^^^^^^^^ Use `tr!` instead of `gsub!`.
    RUBY
  end

  it 'registers an offense for gsub! when deleting one characters' 


  it 'registers an offense when using escape characters in the replacement' 


  it 'registers an offense when using escape characters in the pattern' 


  context 'auto-correct' do
    describe 'corrects to tr' do
      it 'corrects when the length of the pattern and replacement are one' 


      it 'corrects when the pattern is a regex literal' 


      it 'corrects when the pattern is a regex literal using %r' 


      it 'corrects when the pattern uses Regexp.new' 


      it 'corrects when the pattern uses Regexp.compile' 


      it 'corrects when the replacement contains a new line character' 


      it 'corrects when the replacement contains escape backslash' 


      it 'corrects when the pattern contains a new line character' 


      it 'corrects when the pattern contains double backslash' 


      it 'corrects when replacing to a single quote' 


      it 'corrects when replacing to a double quote' 

    end

    describe 'corrects to delete' do
      it 'corrects when deleting a single character' 


      it 'corrects when the pattern is a regex literal' 


      it 'corrects when deleting an escape character' 


      it 'corrects when the pattern uses Regexp.new' 


      it 'corrects when the pattern uses Regexp.compile' 


      it 'corrects when there are no brackets' 


      it 'corrects when a regexp contains escapes' 

    end
  end
end

