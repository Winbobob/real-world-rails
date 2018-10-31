# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::FormatParameterMismatch do
  subject(:cop) { described_class.new }

  shared_examples 'variables' do |variable|
    it 'does not register an offense for % called on a variable' 


    it 'does not register an offense for format called on a variable' 


    it 'does not register an offense for format called on a variable' 

  end

  it_behaves_like 'variables', 'CONST'
  it_behaves_like 'variables', 'var'
  it_behaves_like 'variables', '@var'
  it_behaves_like 'variables', '@@var'
  it_behaves_like 'variables', '$var'

  it 'registers an offense when calling Kernel.format ' \
     'and the fields do not match' do
    expect_offense(<<-RUBY.strip_indent)
      Kernel.format("%s %s", 1)
             ^^^^^^ Number of arguments (1) to `format` doesn't match the number of fields (2).
    RUBY
  end

  it 'registers an offense when calling Kernel.sprintf ' \
     'and the fields do not match' do
    expect_offense(<<-RUBY.strip_indent)
      Kernel.sprintf("%s %s", 1)
             ^^^^^^^ Number of arguments (1) to `sprintf` doesn't match the number of fields (2).
    RUBY
  end

  it 'registers an offense when there are less arguments than expected' 


  it 'registers an offense when there are more arguments than expected' 


  it 'does not register an offense when arguments and fields match' 


  it 'correctly ignores double percent' 


  it 'constants do not register offenses' 


  it 'registers offense with sprintf' 


  it 'correctly parses different sprintf formats' 


  it 'registers an offense for String#%' 


  it 'does not register offense for `String#%` when arguments, fields match' 


  it 'does not register an offense when single argument is a hash' 


  it 'does not register an offense when single argument is not an array' 


  context 'when splat argument is present' do
    it 'does not register an offense when args count is less than expected' 


    context 'when args count is more than expected' do
      it 'registers an offense for `#%`' 


      it 'registers an offense for `#format`' 


      it 'registers an offense for `#sprintf`' 

    end
  end

  context 'when multiple arguments are called for' do
    context 'and a single variable argument is passed' do
      it 'does not register an offense' 

    end

    context 'and a single send node is passed' do
      it 'does not register an offense' 

    end
  end

  context 'when format is not a string literal' do
    it 'does not register an offense' 

  end

  # Regression: https://github.com/rubocop-hq/rubocop/issues/3869
  context 'when passed an empty array' do
    it 'does not register an offense' 

  end

  it 'ignores percent right next to format string' 


  it 'accepts an extra argument for dynamic width' 


  it 'registers an offense if extra argument for dynamic width not given' 


  it 'accepts an extra arg for dynamic width with other preceding flags' 


  it 'accepts an extra arg for dynamic width with other following flags' 


  it 'does not register an offense argument is the result of a message send' 


  it 'does not register an offense when using named parameters' 


  it 'identifies correctly digits for spacing in format' 


  it 'finds faults even when the string looks like a HEREDOC' 


  it 'does not register an offense for sprintf with splat argument' 


  it 'does not register an offense for format with splat argument' 


  context 'on format with %{} interpolations' do
    context 'and 1 argument' do
      it 'does not register an offense' 

    end

    context 'and multiple arguments' do
      it 'registers an offense' 

    end
  end

  context 'on format with %<> interpolations' do
    context 'and 1 argument' do
      it 'does not register an offense' 

    end

    context 'and multiple arguments' do
      it 'registers an offense' 

    end
  end

  context 'with wildcard' do
    it 'does not register an offense for width' 


    it 'does not register an offense for precision' 


    it 'does not register an offense for width and precision' 


    it 'does not register an offense for multiple wildcards' 

  end

  it 'finds the correct number of fields' 

end

