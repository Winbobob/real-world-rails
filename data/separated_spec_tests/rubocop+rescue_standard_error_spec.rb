# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RescueStandardError, :config do
  subject(:cop) { described_class.new(config) }

  context 'implicit' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'implicit',
        'SupportedStyles' => %w[implicit explicit] }
    end

    context 'when rescuing in a begin block' do
      it 'accpets rescuing no error class' 


      it 'accepts rescuing no error class, assigned to a variable' 


      it 'accepts rescuing a single error class other than StandardError' 


      it 'accepts rescuing a single error class other than StandardError, ' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          begin
            foo
          rescue BarError => e
            bar
          end
        RUBY
      end

      context 'when rescuing StandardError by itself' do
        it 'registers an offense' 


        it 'autocorrect will remove StandardError' 


        context 'when the error is assigned to a variable' do
          it 'registers an offense' 


          it 'autocorrect will remove StandardError' 

        end
      end

      it 'accepts rescuing StandardError with other errors' 


      it 'accepts rescuing StandardError with other errors, ' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          begin
            foo
          rescue StandardError, BarError => e
            bar
          rescue BazError, StandardError => e
            baz
          end
        RUBY
      end
    end

    context 'when rescuing in a method definition' do
      it 'accepts rescuing no error class' 


      it 'accepts rescuing no error class, assigned to a variable' 


      it 'accepts rescuing a single error other than StandardError' 


      it 'accepts rescuing a single error other than StandardError, ' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          def baz
            foo
          rescue BarError => e
            bar
          end
        RUBY
      end

      context 'when rescuing StandardError by itself' do
        it 'registers an offense' 


        it 'autocorrect will remove StandardError' 


        context 'when the error is assigned to a variable' do
          it 'registers an offense' 


          it 'autocorrect will remove StandardError' 

        end
      end

      it 'accepts rescuing StandardError with other errors' 


      it 'accepts rescuing StandardError with other errors, ' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          def foobar
            foo
          rescue StandardError, BarError => e
            bar
          rescue BazError, StandardError => e
            baz
          end
        RUBY
      end
    end

    it 'accepts rescue modifier' 

  end

  context 'explicit' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'explicit',
        'SupportedStyles' => %w[implicit explicit] }
    end

    context 'when rescuing in a begin block' do
      context 'when calling rescue without an error class' do
        it 'registers an offense' 


        it 'autocorrect will add StandardError' 


        context 'when the error is assigned to a variable' do
          it 'registers an offense' 


          it 'autocorrect will add StandardError' 

        end
      end

      it 'accepts rescuing a single error other than StandardError' 


      it 'accepts rescuing a single error other than StandardError' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          begin
            foo
          rescue BarError => e
            bar
          end
        RUBY
      end

      it 'accepts rescuing StandardError by itself' 


      it 'accepts rescuing StandardError by itself, assigned to a variable' 


      it 'accepts rescuing StandardError with other errors' 


      it 'accepts rescuing StandardError with other errors, ' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          begin
            foo
          rescue StandardError, BarError => e
            bar
          rescue BazError, StandardError => e
            baz
          end
        RUBY
      end
    end

    context 'when rescuing in a method definition' do
      context 'when rescue is called without an error class' do
        it 'registers an offense' 


        it 'autocorrect will add StandardError' 

      end

      context 'when the error is assigned to a variable' do
        it 'registers an offense' 


        it 'autocorrect will add StandardError' 

      end

      it 'accepts rescueing a single error other than StandardError' 


      it 'accepts rescueing a single error other than StandardError, ' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          def baz
            foo
          rescue BarError => e
            bar
          end
        RUBY
      end

      it 'accepts rescuing StandardError by itself' 


      it 'accepts rescuing StandardError by itself, assigned to a variable' 


      it 'accepts rescuing StandardError with other errors' 


      it 'accepts rescuing StandardError with other errors, ' \
        'assigned to a variable' do
        expect_no_offenses(<<-RUBY.strip_indent)
          def foobar
            foo
          rescue StandardError, BarError => e
            bar
          rescue BazError, StandardError => e
            baz
          end
        RUBY
      end
    end

    it 'accepts rescue modifier' 

  end
end

