# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RequireParentheses do
  subject(:cop) { described_class.new }

  it 'registers an offense for missing parentheses around expression with ' \
     '&& operator' do
    expect_offense(<<-RUBY.strip_indent)
      if day.is? 'monday' && month == :jan
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Use parentheses in the method call to avoid confusion about precedence.
        foo
      end
    RUBY
  end

  it 'registers an offense for missing parentheses around expression with ' \
     '|| operator' do
    expect_offense(<<-RUBY.strip_indent)
      day_is? 'tuesday' || true
      ^^^^^^^^^^^^^^^^^^^^^^^^^ Use parentheses in the method call to avoid confusion about precedence.
    RUBY
  end

  it 'registers an offense for missing parentheses around expression in ' \
     'ternary' do
    expect_offense(<<-RUBY.strip_indent)
      wd.include? 'tuesday' && true == true ? a : b
      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Use parentheses in the method call to avoid confusion about precedence.
    RUBY
  end

  it 'accepts missing parentheses around expression with + operator' 


  it 'accepts method calls without parentheses followed by keyword and/or' 


  it 'accepts method calls that are all operations' 


  it 'accepts condition that is not a call' 


  it 'accepts parentheses around expression with boolean operator' 


  it 'accepts method call with parentheses in ternary' 


  it 'accepts missing parentheses when method is not a predicate' 


  it 'accepts calls to methods that are setters' 


  it 'accepts calls to methods that are operators' 

end

