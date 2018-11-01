# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RedundantParentheses do
  subject(:cop) { described_class.new }

  shared_examples 'redundant' do |expr, correct, type, highlight = nil|
    it "registers an offense for parentheses around #{type}" 


    it 'auto-corrects' 

  end

  shared_examples 'plausible' do |expr|
    it 'accepts parentheses when arguments are unparenthesized' 

  end

  shared_examples 'keyword with return value' do |keyword|
    it_behaves_like 'redundant', "(#{keyword})", keyword, 'a keyword'
    it_behaves_like 'redundant', "(#{keyword}())", "#{keyword}()", 'a keyword'
    it_behaves_like 'redundant', "(#{keyword}(1))", "#{keyword}(1)", 'a keyword'
    it_behaves_like 'plausible', "(#{keyword} 1, 2)"
  end

  shared_examples 'keyword with arguments' do |keyword|
    it_behaves_like 'redundant', "(#{keyword})", keyword, 'a keyword'
    it_behaves_like 'redundant', "(#{keyword}())", "#{keyword}()", 'a keyword'
    it_behaves_like 'redundant', "(#{keyword}(1, 2))", "#{keyword}(1, 2)",
                    'a keyword'
    it_behaves_like 'plausible', "(#{keyword} 1, 2)"
  end

  it_behaves_like 'redundant', '("x")', '"x"', 'a literal'
  it_behaves_like 'redundant', '("#{x}")', '"#{x}"', 'a literal'
  it_behaves_like 'redundant', '(:x)', ':x', 'a literal'
  it_behaves_like 'redundant', '(:"#{x}")', ':"#{x}"', 'a literal'
  it_behaves_like 'redundant', '(1)', '1', 'a literal'
  it_behaves_like 'redundant', '(1.2)', '1.2', 'a literal'
  it_behaves_like 'redundant', '({})', '{}', 'a literal'
  it_behaves_like 'redundant', '([])', '[]', 'a literal'
  it_behaves_like 'redundant', '(nil)', 'nil', 'a literal'
  it_behaves_like 'redundant', '(true)', 'true', 'a literal'
  it_behaves_like 'redundant', '(false)', 'false', 'a literal'
  it_behaves_like 'redundant', '(/regexp/)', '/regexp/', 'a literal'
  it_behaves_like 'redundant', '("x"; "y")', '"x"; "y"', 'a literal'
  it_behaves_like 'redundant', '(1; 2)', '1; 2', 'a literal'
  it_behaves_like 'redundant', '(1i)', '1i', 'a literal'
  it_behaves_like 'redundant', '(1r)', '1r', 'a literal'
  it_behaves_like 'redundant', '(__FILE__)', '__FILE__', 'a keyword'
  it_behaves_like 'redundant', '(__LINE__)', '__LINE__', 'a keyword'
  it_behaves_like 'redundant', '(__ENCODING__)', '__ENCODING__', 'a keyword'
  it_behaves_like 'redundant', '(redo)', 'redo', 'a keyword'
  it_behaves_like 'redundant', '(retry)', 'retry', 'a keyword'
  it_behaves_like 'redundant', '(self)', 'self', 'a keyword'

  it_behaves_like 'redundant', '(X) ? Y : N', 'X ? Y : N', 'a constant', '(X)'
  it_behaves_like 'redundant', '(X)? Y : N', 'X ? Y : N', 'a constant', '(X)'

  it_behaves_like 'keyword with return value', 'break'
  it_behaves_like 'keyword with return value', 'next'
  it_behaves_like 'keyword with return value', 'return'

  it_behaves_like 'keyword with arguments', 'super'
  it_behaves_like 'keyword with arguments', 'yield'

  it_behaves_like 'redundant', '(defined?(:A))', 'defined?(:A)', 'a keyword'
  it_behaves_like 'plausible', '(defined? :A)'

  it_behaves_like 'plausible', '(alias a b)'
  it_behaves_like 'plausible', '(not 1)'
  it_behaves_like 'plausible', '(a until b)'
  it_behaves_like 'plausible', '(a while b)'

  it_behaves_like 'redundant', 'x = 1; (x)', 'x = 1; x', 'a variable', '(x)'
  it_behaves_like 'redundant', '(@x)', '@x', 'a variable'
  it_behaves_like 'redundant', '(@@x)', '@@x', 'a variable'
  it_behaves_like 'redundant', '($x)', '$x', 'a variable'

  it_behaves_like 'redundant', '(X)', 'X', 'a constant'

  it_behaves_like 'redundant', '(x)', 'x', 'a method call'
  it_behaves_like 'redundant', '(x(1, 2))', 'x(1, 2)', 'a method call'
  it_behaves_like 'redundant', '("x".to_sym)', '"x".to_sym', 'a method call'
  it_behaves_like 'redundant', '(x[:y])', 'x[:y]', 'a method call'
  it_behaves_like 'redundant', '("foo"[0])', '"foo"[0]', 'a method call'
  it_behaves_like 'redundant', '(["foo"][0])', '["foo"][0]', 'a method call'
  it_behaves_like 'redundant', '({0 => :a}[0])', '{0 => :a}[0]', 'a method call'
  it_behaves_like 'redundant', '(x; y)', 'x; y', 'a method call'

  it_behaves_like 'redundant', '(!x)', '!x', 'an unary operation'
  it_behaves_like 'redundant', '(~x)', '~x', 'an unary operation'
  it_behaves_like 'redundant', '(-x)', '-x', 'an unary operation'
  it_behaves_like 'redundant', '(+x)', '+x', 'an unary operation'
  it_behaves_like 'plausible', '(!x.m arg)'
  it_behaves_like 'plausible', '(!x).y'
  it_behaves_like 'plausible', '-(1.foo)'
  it_behaves_like 'plausible', '+(1.foo)'
  it_behaves_like 'plausible', '-(1.foo.bar)'
  it_behaves_like 'plausible', '+(1.foo.bar)'
  it_behaves_like 'plausible', '()'

  it_behaves_like 'redundant', '[(1)]', '[1]', 'a literal', '(1)'
  it_behaves_like 'redundant', "[(1\n)]", "[1\n]", 'a literal', "(1\n)"
  it_behaves_like 'plausible', "[(1\n),]"
  it_behaves_like 'redundant', '{a: (1)}', '{a: 1}', 'a literal', '(1)'
  it_behaves_like 'redundant', "{a: (1\n)}", "{a: 1\n}", 'a literal', "(1\n)"
  it_behaves_like 'plausible', "{a: (1\n),}"
  it_behaves_like 'redundant', '(0)**2', '0**2', 'a literal', '(0)'
  it_behaves_like 'redundant', '(2)**2', '2**2', 'a literal', '(2)'
  it_behaves_like 'redundant', '(2.1)**2', '2.1**2', 'a literal', '(2.1)'
  it_behaves_like 'redundant', '2**(-2)', '2**-2', 'a literal', '(-2)'
  it_behaves_like 'redundant', '2**(2)', '2**2', 'a literal', '(2)'
  it_behaves_like 'plausible', '(-2)**2'
  it_behaves_like 'plausible', '(-2.1)**2'

  it_behaves_like 'plausible', 'x = (foo; bar)'
  it_behaves_like 'plausible', 'x += (foo; bar)'
  it_behaves_like 'plausible', 'x + (foo; bar)'
  it_behaves_like 'plausible', 'x((foo; bar))'
  it_behaves_like 'redundant', <<-RUBY, <<-RUBY2, 'a method call', '(foo; bar)'
    def x
      (foo; bar)
    end
  RUBY
    def x
      foo; bar
    end
  RUBY2
  it_behaves_like 'redundant', <<-RUBY, <<-RUBY2, 'a method call', '(foo; bar)'
    def x
      baz
      (foo; bar)
    end
  RUBY
    def x
      baz
      foo; bar
    end
  RUBY2
  it_behaves_like 'redundant', <<-RUBY, <<-RUBY2, 'a method call', '(foo; bar)'
    x do
      (foo; bar)
    end
  RUBY
    x do
      foo; bar
    end
  RUBY2
  it_behaves_like 'redundant', <<-RUBY, <<-RUBY2, 'a method call', '(foo; bar)'
    x do
      baz
      (foo; bar)
    end
  RUBY
    x do
      baz
      foo; bar
    end
  RUBY2

  it 'accepts parentheses around a method call with unparenthesized ' \
     'arguments' do
    expect_no_offenses('(a 1, 2) && (1 + 1)')
  end

  it 'accepts parentheses inside an irange' 


  it 'accepts parentheses inside an erange' 


  it 'accepts parentheses around an irange' 


  it 'accepts parentheses around an erange' 


  it 'accepts parentheses around operator keywords' 


  it 'registers an offense when there is space around the parentheses' 


  it 'accepts parentheses when they touch the preceding keyword' 


  it 'accepts parentheses when they touch the following keyword' 


  context 'when a hash literal is the first argument in a method call' do
    it 'accepts parentheses if the argument list is not parenthesized ' 


    it 'registers an offense if the argument list is parenthesized ' 

  end

  context 'when a hash literal is the second argument in a method call' do
    it 'registers an offense' 

  end

  context 'when a non-parenthesized call has an arg and a block' do
    it 'accepts parens around the arg' 

  end

  it 'accepts parentheses around the error passed to rescue' 


  it 'accepts parentheses around a constant passed to when' 


  it 'accepts parentheses in super call with hash' 

end
