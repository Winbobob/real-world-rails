# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::ConstantName do
  subject(:cop) { described_class.new }

  it 'registers an offense for camel case in const name' 


  it 'registers an offense for camel case in const name' \
     'when using frozen object assignment' do
    expect_offense(<<-RUBY.strip_indent)
      TopCase = 5.freeze
      ^^^^^^^ Use SCREAMING_SNAKE_CASE for constants.
    RUBY
  end

  it 'registers an offense for non-POSIX upper case in const name' 


  it 'registers offenses for camel case in multiple const assignment' 


  it 'registers an offense for snake case in const name' 


  it 'registers 1 offense if rhs is offending const assignment' 


  it 'allows screaming snake case in const name' 


  it 'allows screaming snake case in multiple const assignment' 


  it 'allows screaming snake case with POSIX upper case characters' 


  it 'does not check names if rhs is a method call' 


  it 'does not check names if rhs is a method call with conditional assign' 


  it 'does not check names if rhs is a `Class.new`' 


  it 'does not check names if rhs is a `Class.new` with conditional assign' 


  it 'does not check names if rhs is a `Struct.new`' 


  it 'does not check names if rhs is a `Struct.new` with conditional assign' 


  it 'does not check names if rhs is a method call with block' 


  it 'does not check if rhs is another constant' 


  it 'does not check if rhs is a non-offensive const assignment' 


  it 'checks qualified const names' 

end

