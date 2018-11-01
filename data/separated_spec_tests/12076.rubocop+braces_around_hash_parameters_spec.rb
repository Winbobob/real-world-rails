# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::BracesAroundHashParameters, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'general non-offenses' do
    it 'accepts one non-hash parameter' 


    it 'accepts multiple non-hash parameters' 


    it 'accepts one empty hash parameter' 


    it 'accepts one empty hash parameter with whitespace' 

  end

  shared_examples 'no_braces and context_dependent non-offenses' do
    it 'accepts one hash parameter without braces' 


    it 'accepts one hash parameter without braces and with multiple keys' 


    it 'accepts one hash parameter without braces and with one hash value' 


    it 'accepts property assignment with braces' 


    it 'accepts operator with a hash parameter with braces' 

  end

  shared_examples 'no_braces and context_dependent offenses' do
    it 'registers an offense for one non-hash parameter followed by a hash ' \
       'parameter with braces' do
      expect_offense(<<-RUBY.strip_indent)
        where(1, { y: 2 })
                 ^^^^^^^^ Redundant curly braces around a hash parameter.
      RUBY
    end

    it 'registers an offense for one object method hash parameter with ' \
       'braces' do
      expect_offense(<<-RUBY.strip_indent)
        x.func({ y: "z" })
               ^^^^^^^^^^ Redundant curly braces around a hash parameter.
      RUBY
    end

    it 'registers an offense for one hash parameter with braces' 


    it 'registers an offense for one hash parameter with braces and ' \
       'whitespace' do
      expect_offense(<<-RUBY.strip_indent)
        where(  
          { x: 1 }   )
          ^^^^^^^^ Redundant curly braces around a hash parameter.
      RUBY
    end

    it 'registers an offense for one hash parameter with braces and multiple ' \
       'keys' do
      expect_offense(<<-RUBY.strip_indent)
        where({ x: 1, foo: "bar" })
              ^^^^^^^^^^^^^^^^^^^^ Redundant curly braces around a hash parameter.
      RUBY
    end
  end

  shared_examples 'no_braces and context_dependent auto-corrections' do
    it 'corrects one non-hash parameter followed by a hash parameter with ' \
       'braces' do
      corrected = autocorrect_source('where(1, { y: 2 })')
      expect(corrected).to eq('where(1, y: 2)')
    end

    it 'corrects one object method hash parameter with braces' 


    it 'corrects one hash parameter with braces' 


    it 'corrects one hash parameter with braces and whitespace' 


    it 'corrects one hash parameter with braces and multiple keys' 


    it 'corrects one hash parameter with braces and extra leading whitespace' 


    it 'corrects one hash parameter with braces and extra trailing ' \
       'whitespace' do
      corrected = autocorrect_source('where({ x: 1, y: 2   })')
      expect(corrected).to eq('where(x: 1, y: 2)')
    end

    it 'corrects one hash parameter with braces and a trailing comma' 


    it 'corrects one hash parameter with braces and trailing comma and ' \
       'whitespace' do
      corrected = autocorrect_source('where({ x: 1, y: 2,   })')
      expect(corrected).to eq('where(x: 1, y: 2)')
    end

    it 'corrects one hash parameter with braces without adding extra space' 


    it 'does not break indent' 


    it 'does not remove trailing comma nor realign args' 


    it 'corrects brace removal with 2 extra lines' 


    it 'corrects brace removal with extra lines & multiple pairs' 


    it 'corrects brace removal with lower extra line' 


    it 'corrects brace removal with top extra line' 


    context 'with a comment following the last key-value pair' do
      it 'corrects and leaves line breaks' 

    end

    context 'in a method call without parentheses' do
      it 'corrects a hash parameter with trailing comma' 

    end

    context 'in a method call with multi line arguments without parentheses' do
      it 'removes hash braces' 

    end
  end

  context 'when EnforcedStyle is no_braces' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_braces' } }

    context 'for correct code' do
      include_examples 'general non-offenses'
      include_examples 'no_braces and context_dependent non-offenses'
    end

    context 'for incorrect code' do
      include_examples 'no_braces and context_dependent offenses'

      it 'registers an offense for two hash parameters with braces' 

    end

    describe '#autocorrect' do
      include_examples 'no_braces and context_dependent auto-corrections'

      it 'corrects one hash parameter with braces' 


      it 'corrects two hash parameters with braces' 


      it 'corrects two hash parameters with braces & extra lines' 


      it 'corrects parameters with braces & trailing comma' 


      it 'corrects hash multiline parameters with braces & trailing comma' 

    end
  end

  context 'when EnforcedStyle is context_dependent' do
    let(:cop_config) { { 'EnforcedStyle' => 'context_dependent' } }

    context 'for correct code' do
      include_examples 'general non-offenses'
      include_examples 'no_braces and context_dependent non-offenses'

      it 'accepts two hash parameters with braces' 

    end

    context 'for incorrect code' do
      include_examples 'no_braces and context_dependent offenses'

      it 'registers an offense for one hash parameter with braces and one ' \
         'without' do
        expect_offense(<<-RUBY.strip_indent)
          where({ x: 1 }, y: 2)
                          ^^^^ Missing curly braces around a hash parameter.
        RUBY
      end
    end

    describe '#autocorrect' do
      include_examples 'no_braces and context_dependent auto-corrections'

      it 'corrects one hash parameter with braces and one without' 


      it 'corrects one hash parameter with braces' 

    end
  end

  context 'when EnforcedStyle is braces' do
    let(:cop_config) { { 'EnforcedStyle' => 'braces' } }

    context 'for correct code' do
      include_examples 'general non-offenses'

      it 'accepts one hash parameter with braces' 


      it 'accepts multiple hash parameters with braces' 


      it 'accepts one hash parameter with braces and whitespace' 

    end

    context 'for incorrect code' do
      it 'registers an offense for one hash parameter without braces' 


      it 'registers an offense for one hash parameter with multiple keys and ' \
         'without braces' do
        expect_offense(<<-RUBY.strip_indent)
          where(x: "y", foo: "bar")
                ^^^^^^^^^^^^^^^^^^ Missing curly braces around a hash parameter.
        RUBY
      end

      it 'registers an offense for one hash parameter without braces with ' \
         'one hash value' do
        expect_offense(<<-RUBY.strip_indent)
          where(x: { "y" => "z" })
                ^^^^^^^^^^^^^^^^^ Missing curly braces around a hash parameter.
        RUBY
      end
    end

    describe '#autocorrect' do
      it 'corrects one hash parameter without braces' 


      it 'corrects one hash parameter with multiple keys and without braces' 


      it 'corrects one hash parameter without braces with one hash value' 

    end
  end
end

