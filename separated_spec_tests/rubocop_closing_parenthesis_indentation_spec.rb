# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::ClosingParenthesisIndentation do
  subject(:cop) { described_class.new }

  context 'for method calls' do
    context 'with line break before 1st parameter' do
      it 'registers an offense for misaligned )' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 

    end

    context 'with no line break before 1st parameter' do
      it 'registers an offense for misaligned )' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 


      it 'accepts empty ()' 


      it 'accepts a correctly indented )' 


      it 'autocorrects misindented )' 

    end
  end

  context 'for method assignments with indented parameters' do
    context 'with line break before 1st parameter' do
      it 'registers an offense for misaligned )' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 

    end

    context 'with no line break before 1st parameter' do
      it 'registers an offense for misaligned )' 


      it 'can handle inner method calls' 


      it 'can handle individual arguments that are broken over lines' 


      it 'can handle indentation up against the left edge' 


      it 'can handle hash arguments that are not broken over lines' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 


      it 'accepts empty ()' 


      it 'accepts a correctly indented )' 


      it 'autocorrects misindented )' 

    end
  end

  context 'for method chains' do
    it 'can handle multiple chains with differing breaks' 


    it 'can autocorrect method chains' 

  end

  context 'for method definitions' do
    context 'with line break before 1st parameter' do
      it 'registers an offense for misaligned )' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 

    end

    context 'with no line break before 1st parameter' do
      it 'registers an offense for misaligned )' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 


      it 'accepts empty ()' 

    end
  end

  context 'for grouped expressions' do
    context 'with line break before 1st operand' do
      it 'registers an offense for misaligned )' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 

    end

    context 'with no line break before 1st operand' do
      it 'registers an offense for misaligned )' 


      it 'autocorrects misaligned )' 


      it 'accepts a correctly aligned )' 


      it 'accepts ) that does not begin its line' 

    end
  end

  it 'accepts begin nodes that are not grouped expressions' 

end

