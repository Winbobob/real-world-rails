# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::UnfreezeString, :config do
  subject(:cop) { described_class.new(config) }

  context 'TargetRubyVersion >= 2.3', :ruby23 do
    it 'registers an offense for an empty string with `.dup`' 


    it 'registers an offense for a string with `.dup`' 


    it 'registers an offense for a heredoc with `.dup`' 


    it 'registers an offense for a string that contains a string' \
       'interpolation with `.dup`' do
      expect_offense(<<-'RUBY'.strip_indent)
        "foo#{bar}baz".dup
        ^^^^^^^^^^^^^^^^^^ Use unary plus to get an unfrozen string literal.
      RUBY
    end

    it 'registers an offense for `String.new`' 


    it 'registers an offense for `String.new` with an empty string' 


    it 'registers an offense for `String.new` with a string' 


    it 'accepts an empty string with unary plus operator' 


    it 'accepts a string with unary plus operator' 


    it 'accepts `String.new` with capacity option' 

  end
end

