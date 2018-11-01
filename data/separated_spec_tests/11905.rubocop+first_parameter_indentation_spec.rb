# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::FirstParameterIndentation, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => style }
  end

  let(:other_cops) do
    {
      'Layout/IndentationWidth' => {
        'Width' => indentation_width
      }
    }
  end

  shared_examples 'common behavior' do
    context 'when IndentationWidth:Width is 2' do
      let(:indentation_width) { 2 }

      it 'registers an offense for an over-indented first parameter' 


      it 'registers an offense for an under-indented first parameter' 


      it 'registers an offense on lines affected by another offense' 


      it 'auto-corrects nested offenses' 


      context 'for assignment' do
        it 'accepts a correctly indented first parameter and does not care ' \
           'about the second parameter' do
          expect_no_offenses(<<-RUBY.strip_indent)
            x = run(
              :foo,
                bar: 3
            )
          RUBY
        end

        context 'with line break' do
          it 'accepts a correctly indented first parameter' 


          it 'registers an offense for an under-indented first parameter' 

        end
      end

      it 'accepts a first parameter that is not preceded by a line break' 


      context 'when the receiver contains a line break' do
        it 'accepts a correctly indented first parameter' 


        it 'registers an offense for an over-indented first parameter' 


        it 'accepts a correctly indented first parameter preceded by an ' \
           'empty line' do
          expect_no_offenses(<<-RUBY.strip_indent)
            puts x.
              merge(

                b: 2
              )
          RUBY
        end

        context 'when preceded by a comment line' do
          it 'accepts a correctly indented first parameter' 


          it 'registers an offense for an under-indented first parameter' 

        end
      end

      it 'accepts method calls with no parameters' 


      it 'accepts operator calls' 


      it 'does not view []= as an outer method call' 


      it 'does not view chained call as an outer method call' 


      it 'auto-corrects an under-indented first parameter' 

    end

    context 'when IndentationWidth:Width is 4' do
      let(:indentation_width) { 4 }

      it 'auto-corrects an over-indented first parameter' 

    end

    context 'when indentation width is overridden for this cop only' do
      let(:cop_config) do
        {
          'EnforcedStyle' => style,
          'IndentationWidth' => 4
        }
      end

      it 'accepts a correctly indented first parameter' 


      it 'auto-corrects an over-indented first parameter' 

    end
  end

  context 'when EnforcedStyle is special_for_inner_method_call' do
    let(:style) { 'special_for_inner_method_call' }
    let(:indentation_width) { 2 }

    include_examples 'common behavior'

    context 'for method calls within method calls' do
      context 'with outer parentheses' do
        it 'registers an offense for an over-indented first parameter' 

      end

      context 'without outer parentheses' do
        it 'accepts a first parameter with special indentation' 

      end

      it 'auto-corrects an over-indented first parameter' 

    end
  end

  context 'when EnforcedStyle is ' \
          'special_for_inner_method_call_in_parentheses' do
    let(:style) { 'special_for_inner_method_call_in_parentheses' }
    let(:indentation_width) { 2 }

    include_examples 'common behavior'

    context 'for method calls within method calls' do
      context 'with outer parentheses' do
        it 'registers an offense for an over-indented first parameter' 


        it 'registers an offense for an under-indented first parameter' 


        it 'accepts a correctly indented first parameter in interpolation' 


        it 'accepts a correctly indented first parameter with fullwidth ' \
           'characters' do
          expect_no_offenses(<<-RUBY.strip_indent)
            puts('Ｒｕｂｙ', f(
                               a))
          RUBY
        end
      end

      context 'without outer parentheses' do
        it 'accepts a first parameter with consistent style indentation' 

      end

      it 'auto-corrects an over-indented first parameter' 

    end
  end

  context 'when EnforcedStyle is consistent' do
    let(:style) { 'consistent' }
    let(:indentation_width) { 2 }

    include_examples 'common behavior'

    context 'for method calls within method calls' do
      it 'registers an offense for an over-indented first parameter' 


      it 'accepts first parameter indented relative to previous line' 


      it 'auto-corrects an over-indented first parameter' 

    end
  end

  context 'when EnforcedStyle is consistent_relative_to_receiver' do
    let(:style) { 'consistent_relative_to_receiver' }

    context 'when IndentationWidth:Width is 2' do
      let(:indentation_width) { 2 }

      it 'registers an offense for an over-indented first parameter' 


      it 'registers an offense for an under-indented first parameter' 


      it 'registers an offense on lines affected by another offense' 


      it 'auto-corrects nested offenses' 


      context 'for assignment' do
        it 'accepts a correctly indented first parameter and does not care ' \
           'about the second parameter' do
          expect_offense(<<-RUBY.strip_indent)
            x = run(
              :foo,
              ^^^^ Indent the first parameter one step more than `run(`.
                bar: 3
            )
          RUBY
        end

        context 'with line break' do
          it 'accepts a correctly indented first parameter' 


          it 'registers an offense for an under-indented first parameter' 

        end
      end

      it 'accepts a first parameter that is not preceded by a line break' 


      context 'when the receiver contains a line break' do
        it 'accepts a correctly indented first parameter' 


        it 'registers an offense for an over-indented first parameter' 


        it 'accepts a correctly indented first parameter preceded by an ' \
           'empty line' do
          expect_no_offenses(<<-RUBY.strip_indent)
            puts x.
              merge(

                b: 2
              )
          RUBY
        end

        context 'when preceded by a comment line' do
          it 'accepts a correctly indented first parameter' 


          it 'registers an offense for an under-indented first parameter' 

        end
      end

      it 'accepts method calls with no parameters' 


      it 'accepts operator calls' 


      it 'does not view []= as an outer method call' 


      it 'does not view chained call as an outer method call' 


      it 'auto-corrects an under-indented first parameter' 

    end

    context 'when IndentationWidth:Width is 4' do
      let(:indentation_width) { 4 }

      it 'auto-corrects an over-indented first parameter' 

    end

    context 'when indentation width is overridden for this cop only' do
      let(:indentation_width) { nil }
      let(:cop_config) do
        {
          'EnforcedStyle' => style,
          'IndentationWidth' => 4
        }
      end

      it 'accepts a correctly indented first parameter' 


      it 'auto-corrects an over-indented first parameter' 

    end

    context 'for method calls within method calls' do
      let(:indentation_width) { 2 }

      context 'with outer parentheses' do
        it 'registers an offense for an over-indented first parameter' 


        it 'indents all relative to the receiver' 

      end

      context 'without outer parentheses' do
        it 'accepts a first parameter with special indentation' 


        it 'indents all relative to the receiver' 

      end

      it 'auto-corrects an over-indented first parameter' 

    end
  end
end

