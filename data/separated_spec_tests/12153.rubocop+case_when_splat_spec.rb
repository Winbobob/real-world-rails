# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Performance::CaseWhenSplat do
  subject(:cop) { described_class.new }

  it 'allows case when without splat' 


  it 'allows splat on a variable in the last when condition' 


  it 'allows multiple splat conditions on variables at the end' 


  it 'registers an offense for case when with a splat in the first condition' 


  it 'registers an offense for case when with a splat without an else' 


  it 'registers an offense for splat conditions in when then' 


  it 'registers an offense for a single when with splat expansion followed ' \
     'by another value' do
    expect_offense(<<-RUBY.strip_indent)
      case foo
      when *Foo, Bar
      ^^^^^^^^^ Reordering `when` conditions with a splat to the end of the `when` branches can improve performance.
        nil
      end
    RUBY
  end

  it 'registers an offense for multiple splat conditions at the beginning' 


  it 'registers an offense for multiple out of order splat conditions' 


  it 'registers an offense for splat condition that do not appear at the end' 


  it 'allows splat expansion on an array literal' 


  it 'allows splat expansion on array literal as the last condition' 


  it 'registers an offense for a splat on a variable that proceeds a splat ' \
     'on an array literal as the last condition' do
    expect_offense(<<-RUBY.strip_indent)
      case foo
      when *cond
      ^^^^^^^^^^ Reordering `when` conditions with a splat to the end of the `when` branches can improve performance.
        bar
      when *[1, 2]
        baz
      end
    RUBY
  end

  it 'registers an offense when splat is part of the condition' 


  context 'autocorrect' do
    it 'corrects a single when with splat expansion followed by ' \
      'another value' do
      source = <<-RUBY.strip_indent
        case foo
        when *Foo, Bar, Baz
          nil
        end
      RUBY
      new_source = autocorrect_source(source)
      expect(new_source).to eq(<<-RUBY.strip_indent)
        case foo
        when Bar, Baz, *Foo
          nil
        end
      RUBY
    end

    it 'corrects a when with splat expansion followed by another value ' \
      'when there are multiple whens' do
      source = <<-RUBY.strip_indent
        case foo
        when *Foo, Bar
          nil
        when FooBar
          1
        end
      RUBY
      new_source = autocorrect_source(source)
      expect(new_source).to eq(<<-RUBY.strip_indent)
        case foo
        when FooBar
          1
        when Bar, *Foo
          nil
        end
      RUBY
    end

    it 'corrects a when with multiple out of order splat expansions ' \
      'followed by other values when there are multiple whens' do
      source = <<-RUBY.strip_indent
        case foo
        when *Foo, Bar, *Baz, Qux
          nil
        when FooBar
          1
        end
      RUBY
      new_source = autocorrect_source(source)
      expect(new_source).to eq(<<-RUBY.strip_indent)
        case foo
        when FooBar
          1
        when Bar, Qux, *Foo, *Baz
          nil
        end
      RUBY
    end

    it 'moves a single splat condition to the end of the when conditions' 


    it 'moves multiple splat condition to the end of the when conditions' 


    it 'moves multiple out of order splat condition to the end ' \
       'of the when conditions' do
      new_source = autocorrect_source_with_loop(<<-RUBY.strip_indent)
        case foo
        when *cond1
          bar
        when 3
          doo
        when *cond2
          foobar
        when 6
          baz
        end
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        case foo
        when 3
          doo
        when 6
          baz
        when *cond1
          bar
        when *cond2
          foobar
        end
      RUBY
    end

    it 'corrects splat condition when using when then' 


    it 'corrects nested case when statements' 


    it 'corrects splat on a variable and leaves an array literal alone' 


    it 'corrects a splat as part of the condition' 


    it 'corrects an array followed by splat in the same condition' 


    it 'corrects a splat followed by array in the same condition' 

  end
end

