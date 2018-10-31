# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::RequireParentheses do
  subject(:cop) { described_class.new }

  it 'registers an offense for missing parentheses around expression with ' \
     '&& operator' do
    inspect_source(<<-RUBY.strip_indent)
      if day.is? 'monday' && month == :jan
        foo
      end
    RUBY
    expect(cop.highlights).to eq(["day.is? 'monday' && month == :jan"])
    expect(cop.messages)
      .to eq(['Use parentheses in the method call to avoid confusion about ' \
              'precedence.'])
  end

  it 'registers an offense for missing parentheses around expression with ' \
     '|| operator' do
    inspect_source("day_is? 'tuesday' || true")
    expect(cop.highlights).to eq(["day_is? 'tuesday' || true"])
  end

  it 'registers an offense for missing parentheses around expression in ' \
     'ternary' do
    inspect_source("wd.include? 'tuesday' && true == true ? a : b")
    expect(cop.highlights).to eq(["wd.include? 'tuesday' && true == true"])
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

