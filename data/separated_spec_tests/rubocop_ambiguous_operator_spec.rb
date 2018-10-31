# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::AmbiguousOperator do
  subject(:cop) { described_class.new }

  context 'with a splat operator in the first argument' do
    context 'without parentheses' do
      context 'without whitespaces on the right of the operator' do
        let(:source) do
          <<-RUBY.strip_indent
            array = [1, 2, 3]
            puts *array
          RUBY
        end

        it 'registers an offense' 

      end

      context 'with a whitespace on the right of the operator' do
        it 'accepts' 

      end
    end

    context 'with parentheses' do
      it 'accepts' 

    end
  end

  context 'with a block ampersand in the first argument' do
    context 'without parentheses' do
      context 'without whitespaces on the right of the operator' do
        let(:source) do
          <<-RUBY.strip_indent
            process = proc { do_something }
            2.times &process
          RUBY
        end

        it 'registers an offense' 

      end

      context 'with a whitespace on the right of the operator' do
        it 'accepts' 

      end
    end

    context 'with parentheses' do
      it 'accepts' 

    end
  end
end

