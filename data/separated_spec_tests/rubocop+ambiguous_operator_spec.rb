# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::AmbiguousOperator do
  subject(:cop) { described_class.new }

  context 'with a splat operator in the first argument' do
    context 'without parentheses' do
      context 'without whitespaces on the right of the operator' do
        it 'registers an offense' 

      end

      context 'with a whitespace on the right of the operator' do
        it 'does not register an offense' 

      end
    end

    context 'with parentheses around the splatted argument' do
      it 'does not register an offense' 

    end
  end

  context 'with a block ampersand in the first argument' do
    context 'without parentheses' do
      context 'without whitespaces on the right of the operator' do
        it 'registers an offense' 

      end

      context 'with a whitespace on the right of the operator' do
        it 'does not register an offense' 

      end
    end

    context 'with parentheses around the block argument' do
      it 'does not register an offense' 

    end
  end
end

