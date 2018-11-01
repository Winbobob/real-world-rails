# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::ShadowedException do
  subject(:cop) { described_class.new }

  context 'modifier rescue' do
    it 'accepts rescue in its modifier form' 

  end

  context 'single rescue' do
    it 'accepts an empty rescue' 


    it 'accepts rescuing a single exception' 


    it 'accepts rescuing a single custom exception' 


    it 'accepts rescuing a custom exception and a standard exception' 


    it 'accepts rescuing multiple custom exceptions' 


    it 'accepts rescue containing multiple same error code exceptions' 


    it 'registers an offense rescuing exceptions that are ' \
      'ancestors of each other ' do
      expect_offense(<<-RUBY.strip_indent)
        def
          something
        rescue StandardError, RuntimeError
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Do not shadow rescued Exceptions.
          handle_exception
        end
      RUBY
    end

    it 'registers an offense rescuing Exception with any other error or ' \
       'exception' do
      expect_offense(<<-RUBY.strip_indent)
        begin
          something
        rescue NonStandardError, Exception
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Do not shadow rescued Exceptions.
          handle_exception
        end
      RUBY
    end

    it 'accepts rescuing a single exception that is assigned to a variable' 


    it 'accepts rescuing a single exception that has an ensure' 


    it 'accepts rescuing a single exception that has an else' 


    it 'accepts rescuing a multiple exceptions that are not ancestors that ' \
       'have an else' do
      expect_no_offenses(<<-RUBY.strip_indent)
        begin
          something
        rescue NoMethodError, ZeroDivisionError
          handle_exception
        else
          handle_non_exception
        end
      RUBY
    end

    context 'when there are multiple levels of exceptions in the same rescue' do
      it 'registers an offense for two exceptions' 


      it 'registers an offense for more than two exceptions' 

    end

    it 'registers an offense for the same exception multiple times' 


    it 'accepts splat arguments passed to rescue' 


    it 'accepts rescuing nil' 


    it 'accepts rescuing nil and another exception' 


    it 'registers an offense when rescuing nil multiple exceptions of ' \
       'different levels' do
      expect_offense(<<-RUBY.strip_indent)
        begin
          a
        rescue nil, StandardError, Exception
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Do not shadow rescued Exceptions.
          b
        end
      RUBY
    end
  end

  context 'multiple rescues' do
    it 'registers an offense when a higher level exception is rescued before' \
       ' a lower level exception' do
      expect_offense(<<-RUBY.strip_indent)
        begin
          something
        rescue Exception
        ^^^^^^^^^^^^^^^^ Do not shadow rescued Exceptions.
          handle_exception
        rescue StandardError
          handle_standard_error
        end
      RUBY
    end

    it 'registers an offense when a higher level exception is rescued before ' \
       'a lower level exception when there are multiple exceptions ' \
       'rescued in a group' do
      expect_offense(<<-RUBY.strip_indent)
        begin
          something
        rescue Exception
        ^^^^^^^^^^^^^^^^ Do not shadow rescued Exceptions.
          handle_exception
        rescue NoMethodError, ZeroDivisionError
          handle_standard_error
        end
      RUBY
    end

    it 'registers an offense rescuing out of order exceptions when there ' \
       'is an ensure' do
      expect_offense(<<-RUBY.strip_indent)
        begin
          something
        rescue Exception
        ^^^^^^^^^^^^^^^^ Do not shadow rescued Exceptions.
          handle_exception
        rescue StandardError
          handle_standard_error
        ensure
          everything_is_ok
        end
      RUBY
    end

    it 'accepts rescuing exceptions in order of level' 


    it 'accepts many (>= 7) rescue groups' 


    it 'accepts rescuing exceptions in order of level with multiple ' \
       'exceptions in a group' do
      expect_no_offenses(<<-RUBY.strip_indent)
        begin
          something
        rescue NoMethodError, ZeroDivisionError
          handle_standard_error
        rescue Exception
          handle_exception
        end
      RUBY
    end

    it 'accepts rescuing exceptions in order of level with multiple ' \
       'exceptions in a group with custom exceptions' do
      expect_no_offenses(<<-RUBY.strip_indent)
        begin
          something
        rescue NonStandardError, NoMethodError
          handle_standard_error
        rescue Exception
          handle_exception
        end
      RUBY
    end

    it 'accepts rescuing custom exceptions in multiple rescue groups' 


    context 'splat arguments' do
      it 'accepts splat arguments passed to multiple rescues' 


      it 'registers an offense for splat arguments rescued after ' \
         'rescuing a known exception' do
        expect_no_offenses(<<-RUBY.strip_indent)
          begin
            a
          rescue StandardError
            b
          rescue *BAR
            c
          end
        RUBY
      end

      it 'registers an offense for splat arguments rescued after ' \
         'rescuing Exception' do
        expect_offense(<<-RUBY.strip_indent)
          begin
            a
          rescue Exception
          ^^^^^^^^^^^^^^^^ Do not shadow rescued Exceptions.
            b
          rescue *BAR
            c
          end
        RUBY
      end
    end

    context 'exceptions from different ancestry chains' do
      it 'accepts rescuing exceptions in one order' 


      it 'accepts rescuing exceptions in another order' 

    end

    it 'accepts rescuing nil before another exception' 


    it 'accepts rescuing nil after another exception' 


    it 'accepts rescuing a known exception after an unknown exceptions' 


    it 'accepts rescuing a known exception before an unknown exceptions' 


    it 'accepts rescuing a known exception between unknown exceptions' 


    it 'registers an offense rescuing Exception before an unknown exceptions' 


    it 'ignores expressions of non-const' 


    context 'last rescue does not specify exception class' do
      it 'highlights range ending at rescue keyword' 

    end
  end
end

