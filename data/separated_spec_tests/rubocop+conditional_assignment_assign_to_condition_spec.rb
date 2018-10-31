# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ConditionalAssignment do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Style/ConditionalAssignment' => {
                          'Enabled' => true,
                          'SingleLineConditionsOnly' => true,
                          'IncludeTernaryExpressions' => true,
                          'EnforcedStyle' => 'assign_to_condition',
                          'SupportedStyles' => %w[assign_to_condition
                                                  assign_inside_condition]
                        },
                        'Layout/EndAlignment' => {
                          'EnforcedStyleAlignWith' => end_alignment_align_with,
                          'Enabled' => true
                        },
                        'Metrics/LineLength' => {
                          'Max' => 80,
                          'Enabled' => true
                        })
  end

  let(:end_alignment_align_with) { 'start_of_line' }

  it 'counts array assignment when determining multiple assignment' 


  it 'allows method calls in conditionals' 


  it 'allows if else without variable assignment' 


  it 'allows assignment to the result of a ternary operation' 


  it 'registers an offense for assignment in ternary operation' 


  it 'allows modifier if' 


  it 'allows modifier if inside of if else' 


  it "doesn't crash when assignment statement uses chars which have " \
     'special meaning in a regex' do
    # regression test; see GH issue 2876
    expect_offense(<<-RUBY.strip_indent)
      if condition
      ^^^^^^^^^^^^ Use the return of the conditional for variable assignment and comparison.
        default['key-with-dash'] << a
      else
        default['key-with-dash'] << b
      end
    RUBY
  end

  shared_examples 'comparison methods' do |method|
    it 'registers an offense for comparison methods in if else' 


    it 'registers an offense for comparison methods in unless else' 


    it 'registers an offense for comparison methods in case when' 

  end

  it_behaves_like('comparison methods', '==')
  it_behaves_like('comparison methods', '!=')
  it_behaves_like('comparison methods', '=~')
  it_behaves_like('comparison methods', '!~')
  it_behaves_like('comparison methods', '<=>')

  context 'empty branch' do
    it 'allows an empty if statement' 


    it 'allows an empty elsif statement' 


    it 'allows if elsif without else' 


    it 'allows assignment in if without an else' 


    it 'allows assignment in unless without an else' 


    it 'allows assignment in case when without an else' 


    it 'allows an empty when branch with an else' 


    it 'allows case with an empty else' 

  end

  it 'allows assignment of different variables in if else' 


  it 'allows method calls in if else' 


  it 'allows if elsif else with the same assignment only in if else' 


  it 'allows if elsif else with the same assignment only in if elsif' 


  it 'allows if elsif else with the same assignment only in elsif else' 


  it 'allows assignment using different operators in if else' 


  it 'allows assignment using different (method) operators in if..else' 


  it 'allows aref assignment with different indices in if..else' 


  it 'allows assignment using different operators in if elsif else' 


  it 'allows assignment of different variables in case when else' 


  it 'registers an offense in an if else if the assignment is already ' \
    'at the line length limit' do
    expect_offense(<<-RUBY.strip_indent)
      if foo
      ^^^^^^ Use the return of the conditional for variable assignment and comparison.
        bar = #{'a' * 72}
      else
        bar = #{'b' * 72}
      end
    RUBY
  end

  context 'correction would exceed max line length' do
    it 'allows assignment to the same variable in if else if the correction ' \
       'would create a line longer than the configured LineLength' do
      expect_no_offenses(<<-RUBY.strip_indent)
        if foo
          #{'a' * 78}
          bar = 1
        else
          bar = 2
        end
      RUBY
    end

    it 'allows assignment to the same variable in if else if the correction ' \
       'would cause the condition to exceed the configured LineLength' do
      expect_no_offenses(<<-RUBY.strip_indent)
        if #{'a' * 78}
          bar = 1
        else
          bar = 2
        end
      RUBY
    end

    it 'allows assignment to the same variable in case when else if the ' \
       'correction would create a line longer than the configured LineLength' do
      expect_no_offenses(<<-RUBY.strip_indent)
        case foo
        when foobar
          #{'a' * 78}
          bar = 1
        else
          bar = 2
        end
      RUBY
    end
  end

  shared_examples 'all variable types' do |variable|
    it 'registers an offense assigning any variable type in ternary' 


    it 'registers an offense assigning any variable type in if else' 


    it 'registers an offense assigning any variable type in case when' 


    it 'allows assignment to the return of if else' 


    it 'allows assignment to the return of case when' 


    it 'allows assignment to the return of a ternary' 

  end

  it_behaves_like('all variable types', 'bar')
  it_behaves_like('all variable types', 'BAR')
  it_behaves_like('all variable types', 'FOO::BAR')
  it_behaves_like('all variable types', '@bar')
  it_behaves_like('all variable types', '@@bar')
  it_behaves_like('all variable types', '$BAR')
  it_behaves_like('all variable types', 'foo.bar')

  shared_examples 'all assignment types' do |assignment|
    let(:end_alignment_align_with) { 'keyword' }

    { 'local variable' => 'bar',
      'constant' => 'CONST',
      'class variable' => '@@cvar',
      'instance variable' => '@ivar',
      'global variable' => '$gvar' }.each do |type, name|
      context "for a #{type} lval" do
        it "registers an offense for assignment using #{assignment} " \
           'in ternary' do
          source = "foo? ? #{name} #{assignment} 1 : #{name} #{assignment} 2"
          inspect_source(source)

          expect(cop.messages).to eq(['Use the return of the conditional for ' \
            'variable assignment and comparison.'])
        end

        it "allows assignment using #{assignment} to ternary" 


        it "registers an offense for assignment using #{assignment} in " \
           'if else' do
          source = <<-RUBY.strip_indent
            if foo
              #{name} #{assignment} 1
            else
              #{name} #{assignment} 2
            end
          RUBY
          inspect_source(source)

          expect(cop.messages).to eq(['Use the return of the conditional for ' \
            'variable assignment and comparison.'])
        end

        it "registers an offense for assignment using #{assignment} in "\
        ' case when' do
          source = <<-RUBY.strip_indent
            case foo
            when "a"
              #{name} #{assignment} 1
            else
              #{name} #{assignment} 2
            end
          RUBY
          inspect_source(source)

          expect(cop.messages).to eq(['Use the return of the conditional for ' \
            'variable assignment and comparison.'])
        end

        it "autocorrects for assignment using #{assignment} in if else" 

      end
    end
  end

  it_behaves_like('all assignment types', '=')
  it_behaves_like('all assignment types', '==')
  it_behaves_like('all assignment types', '===')
  it_behaves_like('all assignment types', '+=')
  it_behaves_like('all assignment types', '-=')
  it_behaves_like('all assignment types', '*=')
  it_behaves_like('all assignment types', '**=')
  it_behaves_like('all assignment types', '/=')
  it_behaves_like('all assignment types', '%=')
  it_behaves_like('all assignment types', '^=')
  it_behaves_like('all assignment types', '&=')
  it_behaves_like('all assignment types', '|=')
  it_behaves_like('all assignment types', '<=')
  it_behaves_like('all assignment types', '>=')
  it_behaves_like('all assignment types', '<<=')
  it_behaves_like('all assignment types', '>>=')
  it_behaves_like('all assignment types', '||=')
  it_behaves_like('all assignment types', '&&=')
  it_behaves_like('all assignment types', '+=')
  it_behaves_like('all assignment types', '<<')
  it_behaves_like('all assignment types', '-=')

  it 'registers an offense for assignment in if elsif else' 


  it 'registers an offense for assignment in if elsif elsif else' 


  it 'registers an offense for assignment in if else when the assignment ' \
    'spans multiple lines' do
    expect_offense(<<-RUBY.strip_indent)
      if foo
      ^^^^^^ Use the return of the conditional for variable assignment and comparison.
        foo = {
          a: 1,
          b: 2,
          c: 2,
          d: 2,
          e: 2,
          f: 2,
          g: 2,
          h: 2
        }
      else
        foo = { }
      end
    RUBY
  end

  it 'autocorrects assignment in if else when the assignment ' \
    'spans multiple lines' do
    source = <<-RUBY.strip_indent
      if foo
        foo = {
          a: 1,
          b: 2,
          c: 2,
          d: 2,
          e: 2,
          f: 2,
          g: 2,
          h: 2
        }
      else
        foo = { }
      end
    RUBY
    new_source = autocorrect_source(source)

    expect(new_source).to eq(<<-RUBY.strip_indent)
      foo = if foo
        {
          a: 1,
          b: 2,
          c: 2,
          d: 2,
          e: 2,
          f: 2,
          g: 2,
          h: 2
        }
      else
        { }
      end
    RUBY
  end

  context 'assignment as the last statement' do
    it 'allows more than variable assignment in if else' 


    it 'allows more than variable assignment in if elsif else' 


    it 'allows multiple assignment in if else' 


    it 'allows multiple assignment in if elsif else' 


    it 'allows multiple assignment in if elsif elsif else' 


    it 'allows multiple assignment in if elsif else when the last ' \
       'assignment is the same and the earlier assignments do not appear in ' \
       'all branches' do
      expect_no_offenses(<<-RUBY.strip_indent)
        if baz
          foo = 1
          bar = 1
        elsif foobar
          baz = 2
          bar = 2
        else
          boo = 3
          bar = 3
        end
      RUBY
    end

    it 'allows multiple assignment in case when else when the last ' \
       'assignment is the same and the earlier assignments do not appear ' \
       'in all branches' do
      expect_no_offenses(<<-RUBY.strip_indent)
        case foo
        when foobar
          baz = 1
          bar = 1
        when foobaz
          boo = 2
          bar = 2
        else
          faz = 3
          bar = 3
        end
      RUBY
    end

    it 'allows out of order multiple assignment in if elsif else' 


    it 'allows multiple assignment in unless else' 


    it 'allows multiple assignments in case when with only one when' 


    it 'allows multiple assignments in case when with multiple whens' 


    it 'allows multiple assignments in case when if there are uniq ' \
       'variables in the when branches' do
      expect_no_offenses(<<-RUBY.strip_indent)
        case foo
        when foobar
          foo = 1
          baz = 1
          bar = 1
        when foobaz
          foo = 2
          baz = 2
          bar = 2
        else
          foo = 3
          bar = 3
        end
      RUBY
    end

    it 'allows multiple assignment in case statements when the last ' \
       'assignment is the same and the earlier assignments do not appear in ' \
       'all branches' do
      expect_no_offenses(<<-RUBY.strip_indent)
        case foo
        when foobar
          foo = 1
          bar = 1
        when foobaz
          baz = 2
          bar = 2
        else
          boo = 3
          bar = 3
        end
      RUBY
    end

    it 'allows assignment in if elsif else with some branches only ' \
       'containing variable assignment and others containing more than ' \
       'variable assignment' do
      expect_no_offenses(<<-RUBY.strip_indent)
        if foo
          bar = 1
        elsif foobar
          method_call
          bar = 2
        elsif baz
          bar = 3
        else
          method_call
          bar = 4
        end
      RUBY
    end

    it 'allows variable assignment in unless else with more than ' \
       'variable assignment' do
      expect_no_offenses(<<-RUBY.strip_indent)
        unless foo
          method_call
          bar = 1
        else
          method_call
          bar = 2
        end
      RUBY
    end

    it 'allows variable assignment in case when else with more than ' \
       'variable assignment' do
      expect_no_offenses(<<-RUBY.strip_indent)
        case foo
        when foobar
          method_call
          bar = 1
        else
          method_call
          bar = 2
        end
      RUBY
    end

    context 'multiple assignment in only one branch' do
      it 'allows multiple assignment is in if' 


      it 'allows multiple assignment is in elsif' 


      it 'registers an offense when multiple assignment is in else' 

    end
  end

  it 'registers an offense for assignment in if then else' 


  it 'registers an offense for assignment in unless else' 


  it 'registers an offense for assignment in case when then else' 


  it 'registers an offense for assignment in case with when when else' 


  it 'allows different assignment types in case with when when else' 


  it 'allows assignment in multiple branches when it is ' \
     'wrapped in a modifier' do
    expect_no_offenses(<<-RUBY.strip_indent)
      if foo
        bar << 1
      else
        bar << 2 if foobar
      end
    RUBY
  end

  context 'auto-correct' do
    shared_examples 'comparison correction' do |method|
      let(:end_alignment_align_with) { 'keyword' }

      it 'corrects comparison methods in if elsif else' 


      it 'corrects comparison methods in unless else' 


      it 'corrects comparison methods in case when' 

    end

    it_behaves_like('comparison correction', '==')
    it_behaves_like('comparison correction', '!=')
    it_behaves_like('comparison correction', '=~')
    it_behaves_like('comparison correction', '!~')
    it_behaves_like('comparison correction', '<=>')

    it 'corrects assignment in ternary operations' 


    it 'corrects assignment in ternary operations using strings' 


    it 'corrects =~ in ternary operations' 


    it 'corrects aref assignment in ternary operations' 


    it 'corrects << in ternary operations' 


    it 'corrects assignment in if else' 


    it 'corrects assignment to unbracketed array in if else' 


    it 'corrects assignment in if elsif else' 


    shared_examples '2 character assignment types' do |asgn|
      it "corrects assignment using #{asgn} in if elsif else" 


      it "corrects assignment using #{asgn} in case when else" 


      it "corrects assignment using #{asgn} in unless else" 

    end

    it_behaves_like('2 character assignment types', '+=')
    it_behaves_like('2 character assignment types', '-=')
    it_behaves_like('2 character assignment types', '<<')

    shared_examples '3 character assignment types' do |asgn|
      it "corrects assignment using #{asgn} in if elsif else" 


      it "corrects assignment using #{asgn} in case when else" 


      it "corrects assignment using #{asgn} in unless else" 

    end

    it_behaves_like('3 character assignment types', '&&=')
    it_behaves_like('3 character assignment types', '||=')

    it 'corrects assignment in if elsif else with multiple elsifs' 


    it 'corrects assignment in unless else' 


    it 'corrects assignment in case when else' 


    it 'corrects assignment in case when else with multiple whens' 


    context 'assignment from a method' do
      it 'corrects if else' 


      it 'corrects unless else' 


      it 'corrects case when' 

    end

    context 'then' do
      it 'corrects if then elsif then else' 


      it 'corrects case when then else' 

    end

    it 'preserves comments during correction in if else' 


    it 'preserves comments during correction in case when else' 


    context 'aref assignment' do
      it 'corrects if..else' 


      context 'with different indices' do
        it "doesn't register an offense" 

      end
    end

    context 'self.attribute= assignment' do
      it 'corrects if..else' 


      context 'with different receivers' do
        it "doesn't register an offense" 

      end
    end

    context 'multiple assignment' do
      it 'does not register an offense in if else' 


      it 'does not register an offense in case when' 

    end
  end

  context 'configured to check conditions with multiple statements' do
    subject(:cop) { described_class.new(config) }

    let(:config) do
      RuboCop::Config.new('Style/ConditionalAssignment' => {
                            'Enabled' => true,
                            'SingleLineConditionsOnly' => false,
                            'IncludeTernaryExpressions' => true,
                            'EnforcedStyle' => 'assign_to_condition',
                            'SupportedStyles' => %w[assign_to_condition
                                                    assign_inside_condition]
                          },
                          'Layout/EndAlignment' => {
                            'EnforcedStyleAlignWith' => 'keyword',
                            'Enabled' => true
                          },
                          'Metrics/LineLength' => {
                            'Max' => 80,
                            'Enabled' => true
                          })
    end

    context 'assignment as the last statement' do
      it 'registers an offense in if else with more than variable assignment' 


      it 'registers an offense in if elsif else with more than ' \
         'variable assignment' do
        expect_offense(<<-RUBY.strip_indent)
          if foo
          ^^^^^^ Use the return of the conditional for variable assignment and comparison.
            method_call
            bar = 1
          elsif foobar
            method_call
            bar = 2
          else
            method_call
            bar = 3
          end
        RUBY
      end

      it 'register an offense for multiple assignment in if else' 


      it 'registers an offense for multiple assignment in if elsif else' 


      it 'allows multiple assignment in if elsif elsif else' 


      it 'allows out of order multiple assignment in if elsif else' 


      it 'allows multiple assignment in unless else' 


      it 'allows multiple assignments in case when with only one when' 


      it 'allows multiple assignments in case when with multiple whens' 


      it 'registers an offense in if elsif else with some branches only ' \
          'containing variable assignment and others containing more than ' \
          'variable assignment' do
        expect_offense(<<-RUBY.strip_indent)
          if foo
          ^^^^^^ Use the return of the conditional for variable assignment and comparison.
            bar = 1
          elsif foobar
            method_call
            bar = 2
          elsif baz
            bar = 3
          else
            method_call
            bar = 4
          end
        RUBY
      end

      it 'registers an offense in unless else with more than ' \
         'variable assignment' do
        expect_offense(<<-RUBY.strip_indent)
          unless foo
          ^^^^^^^^^^ Use the return of the conditional for variable assignment and comparison.
            method_call
            bar = 1
          else
            method_call
            bar = 2
          end
        RUBY
      end

      it 'registers an offense in case when else with more than ' \
         'variable assignment' do
        expect_offense(<<-RUBY.strip_indent)
          case foo
          ^^^^^^^^ Use the return of the conditional for variable assignment and comparison.
          when foobar
            method_call
            bar = 1
          else
            method_call
            bar = 2
          end
        RUBY
      end

      context 'multiple assignment in only one branch' do
        it 'registers an offense when multiple assignment is in if' 


        it 'registers an offense when multiple assignment is in elsif' 


        it 'registers an offense when multiple assignment is in else' 

      end
    end

    it 'allows assignment in multiple branches when it is ' \
       'wrapped in a modifier' do
      expect_no_offenses(<<-RUBY.strip_indent)
        if foo
          bar << 1
          bar << 2
        else
          bar << 3
          bar << 4 if foobar
        end
      RUBY
    end

    it 'registers an offense for multiple assignment when an earlier ' \
       'assignment is is protected by a modifier' do
      expect_offense(<<-RUBY.strip_indent)
        if foo
        ^^^^^^ Use the return of the conditional for variable assignment and comparison.
          bar << 1
          bar << 2
        else
          bar << 3 if foobar
          bar << 4
        end
      RUBY
    end

    context 'auto-correct' do
      it 'corrects multiple assignment in if else' 


      it 'corrects multiple assignment in if elsif else' 


      it 'corrects multiple assignment in if elsif else with multiple elsifs' 


      it 'corrects multiple assignment in case when' 


      it 'corrects multiple assignment in case when with multiple whens' 


      it 'corrects multiple assignment in unless else' 


      it 'corrects assignment in an if statement that is nested ' \
        'in unless else' do
        source = <<-RUBY.strip_indent
          unless foo
            if foobar
              baz = 1
            elsif qux
              baz = 2
            else
              baz = 3
            end
          else
            baz = 4
          end
        RUBY

        new_source = autocorrect_source(source)

        expect(new_source).to eq(<<-RUBY.strip_indent)
          unless foo
            baz = if foobar
              1
            elsif qux
              2
            else
              3
                  end
          else
            baz = 4
          end
        RUBY
      end
    end
  end

  context 'EndAlignment configured to start_of_line' do
    subject(:cop) { described_class.new(config) }

    let(:config) do
      RuboCop::Config.new('Style/ConditionalAssignment' => {
                            'Enabled' => true,
                            'SingleLineConditionsOnly' => false,
                            'IncludeTernaryExpressions' => true
                          },
                          'Layout/EndAlignment' => {
                            'EnforcedStyleAlignWith' => 'start_of_line',
                            'Enabled' => true
                          },
                          'Metrics/LineLength' => {
                            'Max' => 80,
                            'Enabled' => true
                          })

      context 'auto-correct' do
        it 'uses proper end alignment in if' 


        it 'uses proper end alignment in unless' 


        it 'uses proper end alignment in case' 

      end
    end
  end

  context 'IncludeTernaryExpressions false' do
    let(:config) do
      RuboCop::Config.new('Style/ConditionalAssignment' => {
                            'Enabled' => true,
                            'SingleLineConditionsOnly' => true,
                            'IncludeTernaryExpressions' => false,
                            'EnforcedStyle' => 'assign_to_condition',
                            'SupportedStyles' => %w[assign_to_condition
                                                    assign_inside_condition]
                          },
                          'Layout/EndAlignment' => {
                            'EnforcedStyleAlignWith' => 'keyword',
                            'Enabled' => true
                          },
                          'Metrics/LineLength' => {
                            'Max' => 80,
                            'Enabled' => true
                          })
    end

    it 'allows assignment in ternary operation' 

  end
end

