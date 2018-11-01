# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::MultilineTernaryOperator do
  subject(:cop) { described_class.new }

  it 'registers offense when the if branch and the else branch are ' \
     'on a separate line from the condition' do
    expect_offense(<<-RUBY.strip_indent)
      a = cond ?
          ^^^^^^ Avoid multi-line ternary operators, use `if` or `unless` instead.
        b : c
    RUBY
  end

  it 'registers an offense when the false branch is on a separate line' 


  it 'registers an offense when everything is on a separate line' 


  it 'accepts a single line ternary operator expression' 

end

