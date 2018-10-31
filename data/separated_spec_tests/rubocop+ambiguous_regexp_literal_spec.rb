# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::AmbiguousRegexpLiteral do
  subject(:cop) { described_class.new }

  context 'with a regexp literal in the first argument' do
    context 'without parentheses' do
      it 'registers an offense' 

    end

    context 'with parentheses' do
      it 'accepts' 

    end
  end
end

