# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::ShadowedArgument, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'IgnoreImplicitReferences' => false } }

  describe 'method argument shadowing' do
    context 'when a single argument is shadowed' do
      it 'registers an offense' 


      context 'when zsuper is used' do
        it 'registers an offense' 


        context 'when IgnoreImplicitReferences config option is set to true' do
          let(:cop_config) { { 'IgnoreImplicitReferences' => true } }

          it 'accepts' 

        end
      end

      context 'when argument was used in shorthand assignment' do
        it 'does not register an offense' 

      end

      context 'when binding is used' do
        it 'registers an offense' 


        context 'when IgnoreImplicitReferences config option is set to true' do
          let(:cop_config) { { 'IgnoreImplicitReferences' => true } }

          it 'accepts' 

        end
      end

      context 'and the argument is not used' do
        it 'accepts' 

      end

      context 'and shadowed within a conditional' do
        it 'registers an offense without specifying where '\
           'the reassignment took place' do
          expect_offense(<<-RUBY.strip_indent)
            def do_something(foo)
                             ^^^ Argument `foo` was shadowed by a local variable before it was used.
              if bar
                foo = 43
              end
              foo = 42
              puts foo
            end
          RUBY
        end

        context 'and was used before shadowing' do
          it 'accepts' 

        end

        context 'and the argument was not shadowed outside the conditional' do
          it 'accepts' 

        end

        context 'and the conditional occurs after the reassignment' do
          it 'registers an offense' 

        end

        context 'and the conditional is nested within a conditional' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              def do_something(foo)
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                if bar
                  if baz
                    foo = 43
                  end
                end
                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end

        context 'and the conditional is nested within a lambda' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              def do_something(foo)
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                lambda do
                  if baz
                    foo = 43
                  end
                end
                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end
      end

      context 'and shadowed within a block' do
        it 'registers an offense without specifying where '\
           'the reassignment took place' do
          expect_offense(<<-RUBY.strip_indent)
            def do_something(foo)
                             ^^^ Argument `foo` was shadowed by a local variable before it was used.
              something { foo = 43 }

              foo = 42
              puts foo
            end
          RUBY
        end

        context 'and was used before shadowing' do
          it 'accepts' 

        end

        context 'and the argument was not shadowed outside the block' do
          it 'accepts' 

        end

        context 'and the block occurs after the reassignment' do
          it 'registers an offense' 

        end

        context 'and the block is nested within a block' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              def do_something(foo)
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                something do
                  lambda do
                    foo = 43
                  end
                end

                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end

        context 'and the block is nested within a conditional' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              def do_something(foo)
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                if baz
                  lambda do
                    foo = 43
                  end
                end

                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end
      end
    end

    context 'when multiple arguments are shadowed' do
      context 'and one of them shadowed within a lambda while another is ' \
        'shadowed outside' do
        it 'registers an offense' 

      end
    end
  end

  describe 'block argument shadowing' do
    context 'when a single argument is shadowed' do
      it 'registers an offense' 


      context 'when zsuper is used' do
        it 'accepts' 

      end

      context 'when binding is used' do
        it 'registers an offense' 


        context 'when IgnoreImplicitReferences config option is set to true' do
          let(:cop_config) { { 'IgnoreImplicitReferences' => true } }

          it 'accepts' 

        end
      end

      context 'and the argument is not used' do
        it 'accepts' 

      end

      context 'and shadowed within a conditional' do
        it 'registers an offense without specifying where '\
           'the reassignment took place' do
          expect_offense(<<-RUBY.strip_indent)
            do_something do |foo|
                             ^^^ Argument `foo` was shadowed by a local variable before it was used.
              if bar
                foo = 43
              end
              foo = 42
              puts foo
            end
          RUBY
        end

        context 'and was used before shadowing' do
          it 'accepts' 

        end

        context 'and the argument was not shadowed outside the conditional' do
          it 'accepts' 

        end

        context 'and the conditional occurs after the reassignment' do
          it 'registers an offense' 

        end

        context 'and the conditional is nested within a conditional' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              do_something do |foo|
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                if bar
                  if baz
                    foo = 43
                  end
                end
                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end

        context 'and the conditional is nested within a lambda' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              do_something do |foo|
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                lambda do
                  if baz
                    foo = 43
                  end
                end
                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end
      end

      context 'and shadowed within a block' do
        it 'registers an offense without specifying where '\
           'the reassignment took place' do
          expect_offense(<<-RUBY.strip_indent)
            do_something do |foo|
                             ^^^ Argument `foo` was shadowed by a local variable before it was used.
              something { foo = 43 }

              foo = 42
              puts foo
            end
          RUBY
        end

        context 'and was used before shadowing' do
          it 'accepts' 

        end

        context 'and the argument was not shadowed outside the block' do
          it 'accepts' 

        end

        context 'and the block occurs after the reassignment' do
          it 'registers an offense' 

        end

        context 'and the block is nested within a block' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              do_something do |foo|
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                something do
                  lambda do
                    foo = 43
                  end
                end

                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end

        context 'and the block is nested within a conditional' do
          it 'registers an offense without specifying where '\
             'the reassignment took place' do
            expect_offense(<<-RUBY.strip_indent)
              do_something do |foo|
                               ^^^ Argument `foo` was shadowed by a local variable before it was used.
                if baz
                  lambda do
                    foo = 43
                  end
                end

                foo = 42
                puts foo
              end
            RUBY
          end

          context 'and the argument was used before shadowing' do
            it 'accepts' 

          end
        end
      end
    end

    context 'when multiple arguments are shadowed' do
      context 'and one of them shadowed within a lambda while another is ' \
        'shadowed outside' do
        it 'registers an offense' 

      end
    end
  end
end

