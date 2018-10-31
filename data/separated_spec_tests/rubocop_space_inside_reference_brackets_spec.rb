# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::SpaceInsideReferenceBrackets, :config do
  subject(:cop) { described_class.new(config) }

  context 'with space inside empty brackets not allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBrackets' => 'no_space' } }

    it 'accepts empty brackets with no space inside' 


    it 'registers an offense for empty brackets with one space inside' 


    it 'registers an offense for empty brackets with lots of space inside' 


    it 'auto-corrects whitespaces in empty brackets' 

  end

  context 'with space inside empty braces allowed' do
    let(:cop_config) { { 'EnforcedStyleForEmptyBrackets' => 'space' } }

    it 'accepts empty brackets with space inside' 


    it 'registers offense for empty brackets with no space inside' 


    it 'registers offense for empty brackets with more than one space inside' 


    it 'auto-corrects multiple offenses for empty brackets' 

  end

  context 'when EnforcedStyle is no_space' do
    let(:cop_config) { { 'EnforcedStyle' => 'no_space' } }

    it 'does not register offense for array literals' 


    it 'does not register offense for reference brackets with no spaces' 


    it 'does not register offense for ref bcts with no spaces that assign' 


    it 'registers an offense when a reference bracket with a leading whitespace
        is assigned by another reference bracket' do
      expect_offense(<<-RUBY.strip_indent)
        a[ "foo"] = b["something"]
          ^ Do not use space inside reference brackets.
      RUBY
    end

    it 'registers an offense when a reference bracket with a trailing whitespace
        is assigned by another reference bracket' do
      expect_offense(<<-RUBY.strip_indent)
        a["foo" ] = b["something"]
               ^ Do not use space inside reference brackets.
      RUBY
    end

    it 'registers an offense when a reference bracket is assigned by another
        reference bracket with trailing whitespace' do
      expect_offense(<<-RUBY.strip_indent)
        a["foo"] = b["something" ]
                                ^ Do not use space inside reference brackets.
      RUBY
    end

    it 'accepts square brackets as method name' 


    it 'accepts square brackets called with method call syntax' 


    it 'accepts an array as a reference object' 


    it 'registers offense in ref brackets with leading whitespace' 


    it 'registers offense in ref brackets with trailing whitespace' 


    it 'registers offense in second ref brackets with leading whitespace' 


    it 'registers offense in second ref brackets with trailing whitespace' 


    it 'registers offense in third ref brackets with leading whitespace' 


    it 'registers offense in third ref brackets with trailing whitespace' 


    it 'registers multiple offenses in one set of ref brackets' 


    it 'registers multiple offenses for multiple sets of ref brackets' 


    context 'auto-correct' do
      it 'fixes multiple offenses in one set of ref brackets' 


      it 'fixes multiple offenses for multiple sets of ref brackets' 


      it 'avoids altering array brackets' 

    end
  end

  context 'when EnforcedStyle is space' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'space',
        'EnforcedStyleForEmptyBrackets' => 'space' }
    end

    it 'does not register offense for array literals' 


    it 'does not register offense for reference brackets with spaces' 


    it 'does not register offense for ref bcts with spaces that assign' 


    it 'registers an offense when a reference bracket with no leading whitespace
        is assigned by another reference bracket' do
      expect_offense(<<-RUBY.strip_indent)
        a["foo" ] = b[ "something" ]
         ^ Use space inside reference brackets.
      RUBY
    end

    it 'registers an offense when a reference bracket with no trailing
        whitespace is assigned by another reference bracket' do
      expect_offense(<<-RUBY.strip_indent)
        a[ "foo"] = b[ "something" ]
                ^ Use space inside reference brackets.
      RUBY
    end

    it 'registers an offense when a reference bracket is assigned by another
        reference bracket with no trailing whitespace' do
      expect_offense(<<-RUBY.strip_indent)
        a[ "foo" ] = b[ "something"]
                                   ^ Use space inside reference brackets.
      RUBY
    end

    it 'accepts square brackets as method name' 


    it 'accepts square brackets called with method call syntax' 


    it 'accepts an array as a reference object' 


    it 'registers offense in ref brackets with no leading whitespace' 


    it 'registers offense in ref brackets with no trailing whitespace' 


    it 'registers offense in second ref brackets with no leading whitespace' 


    it 'registers offense in second ref brackets with no trailing whitespace' 


    it 'registers offense in third ref brackets with no leading whitespace' 


    it 'registers offense in third ref brackets with no trailing whitespace' 


    it 'registers multiple offenses in one set of ref brackets' 


    it 'registers multiple offenses for multiple sets of ref brackets' 


    context 'auto-correct' do
      it 'fixes multiple offenses in one set of ref brackets' 


      it 'fixes multiple offenses for multiple sets of ref brackets' 


      it 'avoids altering array brackets' 

    end
  end
end

