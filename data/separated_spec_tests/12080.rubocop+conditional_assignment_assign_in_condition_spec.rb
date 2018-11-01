# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ConditionalAssignment do
  subject(:cop) { described_class.new(config) }

  shared_examples 'all variable types' do |variable|
    it 'registers an offense assigning any variable type to ternary' 


    it 'allows assigning any variable type inside ternary' 


    it 'registers an offense assigning any variable type to if else' 


    it 'registers an offense assigning any variable type to if elsif else' 


    it 'registers an offense assigning any variable type to if else' \
      'with multiple assignment' do
      source = <<-RUBY.strip_indent
        #{variable}, #{variable} = if foo
                        something
                      else
                        something_else
                      end
      RUBY
      inspect_source(source)

      expect(cop.messages).to eq(['Assign variables inside of conditionals'])
    end

    it 'allows assigning any variable type inside if else' \
      'with multiple assignment' do
      expect_no_offenses(<<-RUBY.strip_indent)
        if foo
          #{variable}, #{variable} = something
        else
          #{variable}, #{variable} = something_else
        end
      RUBY
    end

    it 'allows assigning any variable type inside if else' 


    it 'allows assignment to if without else' 


    it 'registers an offense assigning any variable type to unless else' 


    it 'allows assigning any variable type inside unless else' 


    it 'registers an offense for assigning any variable type to case when' 


    it 'allows assigning any variable type inside case when' 


    it 'does not crash for rescue assignment' 


    context 'auto-correct' do
      it 'corrects assigning any variable type to ternary' 


      it 'corrects assigning any variable type to if elsif else' 


      it 'corrects assigning any variable type to unless else' 


      it 'corrects assigning any variable type to case when' 

    end
  end

  shared_examples 'all assignment types' do |assignment|
    it 'registers an offense for any assignment to ternary' 


    it 'registers an offense any assignment to if else' 


    it 'allows any assignment to if without else' 


    it 'registers an offense for any assignment to unless else' 


    it 'registers an offense any assignment to case when' 


    context 'auto-correct' do
      it 'corrects any assignment to ternary' 


      it 'corrects any assignment to if else' 


      it 'corrects any assignment to unless else' 


      it 'corrects any assignment to case when' 

    end
  end

  shared_examples 'multiline all variable types' do |variable, expected|
    it 'assigning any variable type to a multiline if else' 


    it 'assigning any variable type to an if else with multiline ' \
       'in one branch' do
      source = <<-RUBY.strip_indent
        #{variable} = if foo
                        1
                      else
                        something_else
                        2
                      end
      RUBY
      inspect_source(source)

      expect(cop.messages).to eq(expected)
    end

    it 'assigning any variable type to a multiline if elsif else' 


    it 'assigning any variable type to a multiline unless else' 


    it 'assigning any variable type to a multiline case when' 

  end

  shared_examples 'multiline all assignment types' do |assignment, expected|
    it 'any assignment to a multiline if else' 


    it 'any assignment to a multiline unless else' 


    it 'any assignment to a multiline case when' 

  end

  shared_examples 'single line condition auto-correct' do
    it 'corrects assignment to an if else condition' 


    it 'corrects assignment to an if elsif else condition' 


    it 'corrects assignment to an if elsif else with multiple elsifs' 


    it 'corrects assignment to an unless else condition' 


    it 'corrects assignment to a case when else condition' 


    it 'corrects assignment to a case when else with multiple whens' 


    it 'corrects assignment to a ternary operator' 

  end

  context 'SingleLineConditionsOnly true' do
    let(:config) do
      RuboCop::Config.new('Style/ConditionalAssignment' => {
                            'Enabled' => true,
                            'SingleLineConditionsOnly' => true,
                            'IncludeTernaryExpressions' => true,
                            'EnforcedStyle' => 'assign_inside_condition',
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

    it_behaves_like('all variable types', 'bar')
    it_behaves_like('all variable types', 'BAR')
    it_behaves_like('all variable types', 'FOO::BAR')
    it_behaves_like('all variable types', '@bar')
    it_behaves_like('all variable types', '@@bar')
    it_behaves_like('all variable types', '$BAR')
    it_behaves_like('all variable types', 'foo.bar')

    it_behaves_like('multiline all variable types', 'bar', [])
    it_behaves_like('multiline all variable types', 'BAR', [])
    it_behaves_like('multiline all variable types', 'FOO::BAR', [])
    it_behaves_like('multiline all variable types', '@bar', [])
    it_behaves_like('multiline all variable types', '@@bar', [])
    it_behaves_like('multiline all variable types', '$BAR', [])
    it_behaves_like('multiline all variable types', 'foo.bar', [])

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
    it_behaves_like('all assignment types', '-=')
    it_behaves_like('all assignment types', '<<')

    it_behaves_like('multiline all assignment types', '=', [])
    it_behaves_like('multiline all assignment types', '==', [])
    it_behaves_like('multiline all assignment types', '===', [])
    it_behaves_like('multiline all assignment types', '+=', [])
    it_behaves_like('multiline all assignment types', '-=', [])
    it_behaves_like('multiline all assignment types', '*=', [])
    it_behaves_like('multiline all assignment types', '**=', [])
    it_behaves_like('multiline all assignment types', '/=', [])
    it_behaves_like('multiline all assignment types', '%=', [])
    it_behaves_like('multiline all assignment types', '^=', [])
    it_behaves_like('multiline all assignment types', '&=', [])
    it_behaves_like('multiline all assignment types', '|=', [])
    it_behaves_like('multiline all assignment types', '<=', [])
    it_behaves_like('multiline all assignment types', '>=', [])
    it_behaves_like('multiline all assignment types', '<<=', [])
    it_behaves_like('multiline all assignment types', '>>=', [])
    it_behaves_like('multiline all assignment types', '||=', [])
    it_behaves_like('multiline all assignment types', '&&=', [])
    it_behaves_like('multiline all assignment types', '+=', [])
    it_behaves_like('multiline all assignment types', '-=', [])
    it_behaves_like('multiline all assignment types', '<<', [])

    it 'allows a method call in the subject of a ternary operator' 


    it 'registers an offense for assignment using a method that ends with ' \
       'an equal sign' do
      expect_offense(<<-RUBY.strip_indent)
        self.attributes = foo? ? 1 : 2
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Assign variables inside of conditionals
      RUBY
    end

    it 'registers an offense for assignment using []=' 


    it 'registers an offense for assignment to an if then else' 


    it 'registers an offense for assignment to case when then else' 


    context 'for loop' do
      it 'ignores pseudo assignments in a for loop' 

    end

    context 'auto-correct' do
      it_behaves_like('single line condition auto-correct')

      it 'corrects assignment to an if then else' 


      it 'corrects assignment to case when then else' 


      it 'corrects assignment using a method that ends with an equal sign' 


      it 'corrects assignment using []=' 


      it 'corrects assignment to a namespaced constant' 

    end
  end

  context 'SingleLineConditionsOnly false' do
    let(:config) do
      RuboCop::Config.new('Style/ConditionalAssignment' => {
                            'Enabled' => true,
                            'SingleLineConditionsOnly' => false,
                            'IncludeTernaryExpressions' => true,
                            'EnforcedStyle' => 'assign_inside_condition',
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

    it_behaves_like('all variable types', 'bar')
    it_behaves_like('all variable types', 'BAR')
    it_behaves_like('all variable types', 'FOO::BAR')
    it_behaves_like('all variable types', '@bar')
    it_behaves_like('all variable types', '@@bar')
    it_behaves_like('all variable types', '$BAR')
    it_behaves_like('all variable types', 'foo.bar')

    it_behaves_like('multiline all variable types', 'bar',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all variable types', 'BAR',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all variable types', 'FOO::BAR',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all variable types', '@bar',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all variable types', '@@bar',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all variable types', '$BAR',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all variable types', 'foo.bar',
                    ['Assign variables inside of conditionals'])

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
    it_behaves_like('all assignment types', '-=')
    it_behaves_like('all assignment types', '<<')

    it_behaves_like('multiline all assignment types', '=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '==',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '===',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '+=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '-=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '*=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '**=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '/=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '%=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '^=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '&=',
                    [described_class::ASSIGN_TO_CONDITION_MSG])
    it_behaves_like('multiline all assignment types', '|=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '<=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '>=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '<<=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '>>=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '||=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '&&=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '+=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '-=',
                    ['Assign variables inside of conditionals'])
    it_behaves_like('multiline all assignment types', '<<',
                    ['Assign variables inside of conditionals'])

    it_behaves_like('single line condition auto-correct')

    it 'corrects assignment to a multiline if else condition' 


    it 'corrects assignment to a multiline if elsif else condition' 


    it 'corrects assignment to an if elsif else with multiple elsifs' 


    it 'corrects assignment to an unless else condition' 


    it 'corrects assignment to a case when else condition' 


    it 'corrects assignment to a case when else with multiple whens' 

  end

  context 'IncludeTernaryExpressions false' do
    let(:config) do
      RuboCop::Config.new('Style/ConditionalAssignment' => {
                            'Enabled' => true,
                            'SingleLineConditionsOnly' => true,
                            'IncludeTernaryExpressions' => false,
                            'EnforcedStyle' => 'assign_inside_condition',
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

    it 'allows assigning any variable type to ternary' 

  end
end

