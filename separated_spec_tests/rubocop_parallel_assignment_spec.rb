# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ParallelAssignment, :config do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => { 'Width' => 2 })
  end

  shared_examples('offenses') do |source|
    it "registers an offense for: #{source.gsub(/\s*\n\s*/, '; ')}" 

  end

  it_behaves_like('offenses', 'a, b, c = 1, 2, 3')
  it_behaves_like('offenses', 'a, b, c = [1, 2, 3]')
  it_behaves_like('offenses', 'a, b, c = [1, 2], [3, 4], [5, 6]')
  it_behaves_like('offenses', 'a, b, c = {a: 1}, {b: 2}, {c: 3}')
  it_behaves_like('offenses', 'a, b, c = CONSTANT1, CONSTANT2, CONSTANT3')
  it_behaves_like('offenses', 'a, b, c = [1, 2], {a: 1}, CONSTANT3')
  it_behaves_like('offenses', 'a, b = foo(), bar()')
  it_behaves_like('offenses', 'a, b = foo { |a| puts a }, bar()')
  it_behaves_like('offenses', 'CONSTANT1, CONSTANT2 = CONSTANT3, CONSTANT4')
  it_behaves_like('offenses', 'a, b = 1, 2 if something')
  it_behaves_like('offenses', 'a, b = 1, 2 unless something')
  it_behaves_like('offenses', 'a, b = 1, 2 while something')
  it_behaves_like('offenses', 'a, b = 1, 2 until something')
  it_behaves_like('offenses', "a, b = 1, 2 rescue 'Error'")
  it_behaves_like('offenses', 'a, b = 1, a')
  it_behaves_like('offenses', 'a, b = a, b')
  it_behaves_like('offenses',
                  'a, b = foo.map { |e| e.id }, bar.map { |e| e.id }')
  it_behaves_like('offenses', <<-RUBY.strip_indent)
    array = [1, 2, 3]
    a, b, c, = 8, 9, array
  RUBY
  it_behaves_like('offenses', <<-RUBY.strip_indent)
    if true
      a, b = 1, 2
    end
  RUBY
  it_behaves_like('offenses', 'a, b = Float::INFINITY, Float::INFINITY')
  it_behaves_like('offenses', 'Float::INFINITY, Float::INFINITY = 1, 2')
  it_behaves_like('offenses', 'a[0], a[1] = a[1], a[2]')
  it_behaves_like('offenses', 'obj.attr1, obj.attr2 = obj.attr3, obj.attr1')
  it_behaves_like('offenses', 'obj.attr1, ary[0] = ary[1], obj.attr1')
  it_behaves_like('offenses', 'a[0], a[1] = a[1], b[0]')

  shared_examples('allowed') do |source|
    it "allows assignment of: #{source.gsub(/\s*\n\s*/, '; ')}" 

  end

  it_behaves_like('allowed', 'a = 1')
  it_behaves_like('allowed', 'a = a')
  it_behaves_like('allowed', 'a, = a')
  it_behaves_like('allowed', 'a, = 1')
  it_behaves_like('allowed', "a = *'foo'")
  it_behaves_like('allowed', "a, = *'foo'")
  it_behaves_like('allowed', 'a, = 1, 2, 3')
  it_behaves_like('allowed', 'a, = *foo')
  it_behaves_like('allowed', 'a, *b = [1, 2, 3]')
  it_behaves_like('allowed', '*a, b = [1, 2, 3]')
  it_behaves_like('allowed', 'a, b = b, a')
  it_behaves_like('allowed', 'a, b, c = b, c, a')
  it_behaves_like('allowed', 'a, b = (a + b), (a - b)')
  it_behaves_like('allowed', 'a, b = foo.map { |e| e.id }')
  it_behaves_like('allowed', 'a, b = foo()')
  it_behaves_like('allowed', 'a, b = *foo')
  it_behaves_like('allowed', 'a, b, c = 1, 2, *node')
  it_behaves_like('allowed', 'a, b, c = *node, 1, 2')
  it_behaves_like('allowed', 'begin_token, end_token = CONSTANT')
  it_behaves_like('allowed', 'CONSTANT, = 1, 2')
  it_behaves_like('allowed', <<-RUBY.strip_indent)
    a = 1
    b = 2
  RUBY
  it_behaves_like('allowed', <<-RUBY.strip_indent)
    foo = [1, 2, 3]
    a, b, c = foo
  RUBY
  it_behaves_like('allowed', <<-RUBY.strip_indent)
    array = [1, 2, 3]
    a, = array
  RUBY
  it_behaves_like('allowed', 'a, b = Float::INFINITY')
  it_behaves_like('allowed', 'a[0], a[1] = a[1], a[0]')
  it_behaves_like('allowed', 'obj.attr1, obj.attr2 = obj.attr2, obj.attr1')
  it_behaves_like('allowed', 'obj.attr1, ary[0] = ary[0], obj.attr1')
  it_behaves_like('allowed', 'ary[0], ary[1], ary[2] = ary[1], ary[2], ary[0]')
  it_behaves_like('allowed', 'self.a, self.b = self.b, self.a')
  it_behaves_like('allowed', 'self.a, self.b = b, a')

  it 'highlights the entire expression' 


  it 'does not highlight the modifier statement' 


  describe 'autocorrect' do
    it 'corrects when the number of left hand variables matches ' \
      'the number of right hand variables' do
        new_source = autocorrect_source(<<-RUBY.strip_indent)
          a, b, c = 1, 2, 3
        RUBY

        expect(new_source).to eq(<<-RUBY.strip_indent)
          a = 1
          b = 2
          c = 3
        RUBY
      end

    it 'corrects when the right variable is an array' 


    it 'corrects when the right variable is a word array' 


    it 'corrects when the right variable is a symbol array' 


    it 'corrects when assigning to method returns' 


    it 'corrects when assigning from multiple methods with blocks' 


    it 'corrects when using constants' 


    it 'corrects when the expression is missing spaces' 


    it 'corrects when using single indentation' 


    it 'corrects when using nested indentation' 


    it 'corrects when the expression uses a modifier if statement' 


    it 'corrects when the expression uses a modifier if statement ' \
       'inside a method' do
      new_source = autocorrect_source(<<-RUBY.strip_indent)
        def foo
          a, b = 1, 2 if foo
        end
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        def foo
          if foo
            a = 1
            b = 2
          end
        end
      RUBY
    end

    it 'corrects parallel assignment in if statements' 


    it 'corrects when the expression uses a modifier unless statement' 


    it 'corrects parallel assignment in unless statements' 


    it 'corrects when the expression uses a modifier while statement' 


    it 'corrects parallel assignment in while statements' 


    it 'corrects when the expression uses a modifier until statement' 


    it 'corrects parallel assignment in until statements' 


    it 'corrects when the expression uses a modifier rescue statement' 


    it 'corrects parallel assignment inside rescue statements '\
       'within method definitions' do
      new_source = autocorrect_source(<<-RUBY.strip_indent)
        def bar
          a, b = 1, 2
        rescue
          'foo'
        end
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        def bar
          a = 1
          b = 2
        rescue
          'foo'
        end
      RUBY
    end

    it 'corrects parallel assignment in rescue statements '\
       'within begin ... rescue' do
      new_source = autocorrect_source(<<-RUBY.strip_indent)
        begin
          a, b = 1, 2
        rescue
          'foo'
        end
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        begin
          a = 1
          b = 2
        rescue
          'foo'
        end
      RUBY
    end

    it 'corrects when the expression uses a modifier rescue statement ' \
       'as the only thing inside of a method' do
      new_source = autocorrect_source(<<-RUBY.strip_indent)
        def foo
          a, b = 1, 2 rescue foo
        end
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        def foo
          a = 1
          b = 2
        rescue
          foo
        end
      RUBY
    end

    it 'corrects when the expression uses a modifier rescue statement ' \
       'inside of a method' do
      new_source = autocorrect_source(<<-RUBY.strip_indent)
        def foo
          a, b = %w(1 2) rescue foo
          something_else
        end
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        def foo
          begin
            a = '1'
            b = '2'
          rescue
            foo
          end
          something_else
        end
      RUBY
    end

    it 'corrects when assignments must be reordered to avoid changing ' \
       'meaning' do
      new_source = autocorrect_source(<<-RUBY.strip_indent)
        a, b, c, d = 1, a + 1, b + 1, a + b + c
      RUBY

      expect(new_source).to eq(<<-RUBY.strip_indent)
        d = a + b + c
        c = b + 1
        b = a + 1
        a = 1
      RUBY
    end

    shared_examples('no correction') do |description, source|
      context description do
        it "does not change: #{source.gsub(/\s*\n\s*/, '; ')}" 

      end
    end

    it_behaves_like 'no correction',
                    'when there are more left variables than right variables',
                    'a, b, c, d = 1, 2'

    it_behaves_like 'no correction',
                    'when there are more right variables than left variables',
                    'a, b = 1, 2, 3'

    it_behaves_like 'no correction',
                    'when expanding an assigned variable', <<-RUBY.strip_indent
      foo = [1, 2, 3]
      a, b, c = foo
    RUBY

    describe 'using custom indentation width' do
      let(:config) do
        RuboCop::Config.new('Performance/ParallelAssignment' => {
                              'Enabled' => true
                            },
                            'Layout/IndentationWidth' => {
                              'Enabled' => true,
                              'Width' => 3
                            })
      end

      it 'works with standard correction' 


      it 'works with guard clauses' 


      it 'works with rescue' 


      it 'works with nesting' 

    end
  end
end

