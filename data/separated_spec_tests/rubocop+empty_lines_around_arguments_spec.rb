# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::EmptyLinesAroundArguments, :config do
  subject(:cop) { described_class.new(config) }

  context 'when extra lines' do
    it 'registers offense for empty line before arg' 


    it 'registers offense for empty line after arg' 


    it 'registers offense for empty line between args' 


    it 'registers offenses when multiple empty lines are detected' 


    it 'registers offense when args start on definition line' 


    it 'registers offense when empty line between normal arg & block arg' 


    it 'registers offense on correct line for single offense example' 


    it 'registers offense on correct lines for multi-offense example' 


    it 'autocorrects empty line detected at top' 


    it 'autocorrects empty line detected at bottom' 


    it 'autocorrects empty line detected in the middle' 


    it 'autocorrects multiple empty lines' 


    it 'autocorrects args that start on definition line' 

  end

  context 'when no extra lines' do
    it 'accpets one line methods' 


    it 'accepts multiple listed mixed args' 


    it 'accepts listed args starting on definition line' 


    it 'accepts block argument with empty line' 


    it 'accepts method with argument that trails off block' 


    it 'accepts method with no arguments that trails off block' 


    it 'accepts method with argument that trails off heredoc' 


    context 'with one argument' do
      it 'ignores empty lines inside of method arguments' 

    end

    context 'with multiple arguments' do
      it 'ignores empty lines inside of method arguments' 

    end
  end
end

