# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::IndentationWidth do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new('Layout/IndentationWidth' => cop_config,
                        'Layout/IndentationConsistency' => consistency_config,
                        'Layout/EndAlignment' => end_alignment_config,
                        'Layout/DefEndAlignment' => def_end_alignment_config)
  end
  let(:consistency_config) { { 'EnforcedStyle' => 'normal' } }
  let(:end_alignment_config) do
    { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'variable' }
  end
  let(:def_end_alignment_config) do
    { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'start_of_line' }
  end

  context 'with Width set to 4' do
    let(:cop_config) { { 'Width' => 4 } }

    context 'for a file with byte order mark' do
      let(:bom) { "\xef\xbb\xbf" }

      it 'accepts correctly indented method definition' 

    end

    context 'with ignored patterns set' do
      let(:cop_config) do
        {
          'Width' => 4,
          'IgnoredPatterns' => ['^\s*module', '^\s*(els)?if.*[A-Z][a-z]+']
        }
      end

      it 'accepts unindented lines for those keywords' 

    end

    context 'with if statement' do
      it 'registers an offense for bad indentation of an if body' 

    end

    describe '#autocorrect' do
      it 'corrects bad indentation' 

    end
  end

  context 'with Width set to 2' do
    let(:cop_config) { { 'Width' => 2 } }

    context 'with if statement' do
      it 'registers an offense for bad indentation of an if body' 


      it 'registers an offense for bad indentation of an else body' 


      it 'registers an offense for bad indentation of an elsif body' 


      it 'registers offense for bad indentation of ternary inside else' 


      it 'registers offense for bad indentation of modifier if in else' 


      it 'accepts indentation after if on new line after assignment' 


      it 'accepts `rescue` after an empty body' 


      it 'accepts `ensure` after an empty body' 


      describe '#autocorrect' do
        it 'corrects bad indentation' 


        it 'does not correct in scopes that contain block comments' 


        it 'does not indent heredoc strings' 


        it 'indents parenthesized expressions' 


        it 'leaves rescue ; end unchanged' 


        it 'leaves block unchanged if block end is not on its own line' 


        it 'handles lines with only whitespace' 

      end

      it 'accepts a one line if statement' 


      it 'accepts a correctly aligned if/elsif/else/end' 


      it 'accepts a correctly aligned if/elsif/else/end as a method argument' 


      it 'accepts if/elsif/else/end laid out as a table' 


      it 'accepts if/then/else/end laid out as another table' 


      it 'accepts an empty if' 


      context 'with assignment' do
        shared_examples 'assignment with if statement' do
          context 'and end is aligned with variable' do
            it 'accepts an if with end aligned with setter' 


            it 'accepts an if with end aligned with element assignment' 


            it 'accepts an if with end aligned with variable' 


            it 'accepts an if/else' 


            it 'accepts an if/else with chaining after the end' 


            it 'accepts an if/else with chaining with a block after the end' 

          end

          context 'and end is aligned with keyword' do
            it 'registers an offense for an if with setter' 


            it 'registers an offense for an if with element assignment' 


            it 'registers an offense for an if' 


            it 'registers an offense for a while' 


            it 'registers an offense for an until' 

          end

          context 'and end is aligned randomly' do
            it 'registers an offense for an if' 


            it 'registers an offense for a while' 


            it 'registers an offense for an until' 

          end
        end

        context 'when alignment style is variable' do
          let(:end_alignment_config) do
            { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'variable' }
          end

          include_examples 'assignment with if statement'
        end

        context 'when alignment style is start_of_line' do
          let(:end_alignment_config) do
            { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'start_of_line' }
          end

          include_examples 'assignment with if statement'
        end

        context 'when alignment style is keyword' do
          let(:end_alignment_config) do
            { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'keyword' }
          end

          context 'and end is aligned with variable' do
            it 'registers an offense for an if' 


            it 'registers an offense for a while' 


            it 'autocorrects bad indentation' 

          end

          context 'and end is aligned with keyword' do
            it 'accepts an if in assignment' 


            it 'accepts an if/else in assignment' 


            it 'accepts an if/else in assignment on next line' 


            it 'accepts a while in assignment' 


            it 'accepts an until in assignment' 

          end
        end
      end

      it 'accepts an if/else branches with rescue clauses' 

    end

    context 'with unless' do
      it 'registers an offense for bad indentation of an unless body' 


      it 'accepts an empty unless' 

    end

    context 'with case' do
      it 'registers an offense for bad indentation in a case/when body' 


      it 'registers an offense for bad indentation in a case/else body' 


      it 'accepts correctly indented case/when/else' 


      it 'accepts aligned values in when clause' 


      it 'accepts case/when/else laid out as a table' 


      it 'accepts case/when/else with then beginning a line' 


      it 'accepts indented when/else plus indented body' 

    end

    context 'with while/until' do
      it 'registers an offense for bad indentation of a while body' 


      it 'registers an offense for bad indentation of begin/end/while' 


      it 'registers an offense for bad indentation of an until body' 


      it 'accepts an empty while' 

    end

    context 'with for' do
      it 'registers an offense for bad indentation of a for body' 


      it 'accepts an empty for' 

    end

    context 'with def/defs' do
      shared_examples 'without modifier on the same line' do
        it 'registers an offense for bad indentation of a def body' 


        it 'registers an offense for bad indentation of a defs body' 


        it 'accepts an empty def body' 


        it 'accepts an empty defs body' 


        it 'with an assignment' 

      end

      context 'when end is aligned with start of line' do
        let(:def_end_alignment_config) do
          { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'start_of_line' }
        end

        include_examples 'without modifier on the same line'

        context 'when modifier and def are on the same line' do
          it 'accepts a correctly aligned body' 


          it 'registers an offense for bad indentation of a def body' 


          it 'registers an offense for bad indentation of a defs body' 

        end

        context 'when multiple modifiers and def are on the same line' do
          it 'accepts a correctly aligned body' 


          it 'registers an offense for bad indentation of a def body' 


          it 'registers an offense for bad indentation of a defs body' 


          context 'when multiple modifiers are used in a block and' \
                  'a method call is made at end of the block' do
            it 'accepts a correctly aligned body' 


            it 'registers an offense for bad indentation of a def' 


            it 'registers an offense for bad indentation of a def body' 

          end
        end
      end

      context 'when end is aligned with def' do
        let(:def_end_alignment_config) do
          { 'Enabled' => true, 'EnforcedStyleAlignWith' => 'def' }
        end

        include_examples 'without modifier on the same line'

        context 'when modifier and def are on the same line' do
          it 'accepts a correctly aligned body' 


          it 'registers an offense for bad indentation of a def body' 


          it 'registers an offense for bad indentation of a defs body' 

        end
      end
    end

    context 'with class' do
      it 'registers an offense for bad indentation of a class body' 


      it 'accepts an empty class body' 


      context 'with access modifier' do
        it 'registers an offense for bad indentation of sections' 

      end

      context 'when consistency style is normal' do
        it 'accepts indented public, protected, and private' 


        it 'registers offenses for rails indentation' 

      end

      context 'when consistency style is rails' do
        let(:consistency_config) { { 'EnforcedStyle' => 'rails' } }

        it 'registers an offense for normal non-rails indentation' 

      end
    end

    context 'with module' do
      context 'when consistency style is normal' do
        it 'registers an offense for bad indentation of a module body' 


        it 'accepts an empty module body' 

      end

      context 'when consistency style is rails' do
        let(:consistency_config) { { 'EnforcedStyle' => 'rails' } }

        it 'registers an offense for bad indentation of a module body' 


        it 'accepts normal non-rails indentation of module functions' 

      end
    end

    context 'with begin/rescue/else/ensure/end' do
      it 'registers an offense for bad indentation of bodies' 

    end

    context 'with def/rescue/end' do
      it 'registers an offense for bad indentation of bodies' 


      it 'registers an offense for bad indent of defs bodies with a modifier' 

    end

    context 'with block' do
      context 'when consistency style is rails' do
        let(:consistency_config) { { 'EnforcedStyle' => 'rails' } }

        it 'registers an offense for bad indentation in a do/end body' 

      end

      it 'registers an offense for bad indentation of a do/end body' 


      it 'registers an offense for bad indentation of a {} body' 


      it 'accepts a correctly indented block body' 


      it 'accepts an empty block body' 


      # The cop uses the block end/} as the base for indentation, so if it's not
      # on its own line, all bets are off.
      it 'accepts badly indented code if block end is not on separate line' 

    end
  end
end

