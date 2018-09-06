# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::EvalWithLocation do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using `#eval` without any arguments' 


  it 'registers an offense when using `#eval` with `binding` only' 


  it 'registers an offense when using `#eval` without lineno' 


  it 'registers an offense when using `#eval` with an incorrect line number' 


  it 'registers an offense when using `#eval` with a heredoc and ' \
     'an incorrect line number' do
    expect_offense(<<-RUBY.strip_indent)
      eval <<-CODE, binding, __FILE__, __LINE__ + 2
                                       ^^^^^^^^^^^^ Use `__LINE__ + 1` instead of `__LINE__ + 2`, as they are used by backtraces.
        do_something
      CODE
    RUBY
  end

  it 'registers an offense when using `#eval` with a string on a new line ' 


  it 'registers an offense when using `#class_eval` without any arguments' 


  it 'registers an offense when using `#module_eval` without any arguments' 


  it 'registers an offense when using `#instance_eval` without any arguments' 


  it 'registers an offense when using `#class_eval` with an incorrect lineno' 


  it 'accepts `eval` with a heredoc, a filename and `__LINE__ + 1`' 


  it 'accepts `eval` with a code that is a variable' 


  it 'accepts `eval` with a string, a filename and `__LINE__`' 


  it 'accepts `eval` with a string, a filename and `__LINE__` on a new line' 

end

