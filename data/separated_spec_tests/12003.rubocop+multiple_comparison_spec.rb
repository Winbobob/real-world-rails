# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MultipleComparison do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'does not register an offense for comparing an lvar' 


  it 'registers an offense when `a` is compared twice' 


  it 'registers an offense when `a` is compared three times' 


  it 'registers an offense when `a` is compared three times on the right ' \
    'hand side' do
    expect_offense(<<-RUBY.strip_indent)
      a = "a"
      if "a" == a || "b" == a || "c" == a
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Avoid comparing a variable with multiple items in a conditional, use `Array#include?` instead.
        print a
      end
    RUBY
  end

  it 'registers an offense when `a` is compared three times, once on the ' \
    'righthand side' do
    expect_offense(<<-RUBY.strip_indent)
      a = "a"
      if a == "a" || "b" == a || a == "c"
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Avoid comparing a variable with multiple items in a conditional, use `Array#include?` instead.
        print a
      end
    RUBY
  end

  it 'registers an offense when multiple comparison is not ' \
     'part of a conditional' do
    expect_offense(<<-RUBY.strip_indent)
      def foo(x)
        x == 1 || x == 2 || x == 3
        ^^^^^^^^^^^^^^^^^^^^^^^^^^ Avoid comparing a variable with multiple items in a conditional, use `Array#include?` instead.
      end
    RUBY
  end

  it 'does not register an offense for comparing multiple literal strings' 


  it 'does not register an offense for comparing multiple int literals' 


  it 'does not register an offense for comparing lvars' 


  it 'does not register an offense for comparing lvars when a string is ' \
    'on the lefthand side' do
    expect_no_offenses(<<-RUBY.strip_indent)
      a = "a"
      b = "b"
      if a == "a" || "b" == b
        print a
      end
    RUBY
  end

  it 'does not register an offense for a == b || b == a' 


  it 'does not register an offense for a duplicated condition' 


  it 'does not register an offense for Array#include?' 

end

