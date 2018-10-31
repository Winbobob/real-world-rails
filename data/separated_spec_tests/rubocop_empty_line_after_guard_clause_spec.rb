# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLineAfterGuardClause do
  subject(:cop) { described_class.new }

  it 'registers an offense for guard clause not followed by empty line' 


  it 'registers an offense for next guard clause not followed by empty line' 


  it 'registers offence when guard clause is before `begin`' 


  it 'registers an offense for next guard clause not followed by empty line ' \
     'when guard clause is after heredoc' do
    expect_offense(<<-RUBY.strip_indent)
      def foo
        raise ArgumentError, <<-MSG unless path
          Must be called with mount point
        MSG
      ^^^^^ Add empty line after guard clause.
        bar
      end
    RUBY
  end

  it 'registers an offense for next guard clause not followed by empty line ' \
     'when guard clause is after condition without method invocation' do
    expect_no_offenses(<<-'RUBY'.strip_indent)
      def foo
        raise unless $1 == o

        bar
      end
    RUBY
  end

  it 'registers an offense for next guard clause not followed by empty line ' \
     'when guard clause is after method call with argument' do
    expect_offense(<<-'RUBY'.strip_indent)
      def foo
        raise SerializationError.new("Unsupported argument type: #{argument.class.name}") unless serializer
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Add empty line after guard clause.
        serializer.serialize(argument)
      end
    RUBY
  end

  it 'does not register offence for modifier if' 


  it 'does not register offence for guard clause followed by end' 


  it 'does not register offence for guard clause inside oneliner block' 


  it 'does not register offence for multiple guard clauses' 


  it 'does not register offence if next line is end' 


  it 'does not register offence when guard clause is before `rescue`' 


  it 'does not register offence when guard clause is before `ensure`' 


  it 'does not register offence when guard clause is before `rescue`-`else`' 


  it 'does not register offence when guard clause is before `else`' 


  it 'does not register offence when guard clause is before `elsif`' 


  it 'does not register offence when guard clause is after single line ' \
     'heredoc' do
    expect_no_offenses(<<-RUBY.strip_indent)
      def foo
        raise ArgumentError, <<-MSG unless path
          Must be called with mount point
        MSG

        bar
      end
    RUBY
  end

  it 'does not register offence when guard clause is after multiline heredoc' 


  it 'registers an offence for methods starting with end_' 


  it 'autocorrects offence' 


  it 'correctly autocorrects offence with comment on same line' 

end

