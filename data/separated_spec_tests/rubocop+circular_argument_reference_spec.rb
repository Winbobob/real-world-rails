# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::CircularArgumentReference do
  subject(:cop) { described_class.new }

  describe 'circular argument references in ordinal arguments' do
    context 'when the method contains a circular argument reference' do
      it 'registers an offense' 

    end

    context 'when the method does not contain a circular argument reference' do
      it 'does not register an offense' 

    end

    context 'when the seemingly-circular default value is a method call' do
      it 'does not register an offense' 

    end
  end

  describe 'circular argument references in keyword arguments' do
    context 'when the keyword argument is not circular' do
      it 'does not register an offense' 

    end

    context 'when the keyword argument is not circular, and calls a method' do
      it 'does not register an offense' 

    end

    context 'when there is one circular argument reference' do
      it 'registers an offense' 

    end

    context 'when the keyword argument is not circular, but calls a method ' \
            'of its own class with a self specification' do
      it 'does not register an offense' 

    end

    context 'when the keyword argument is not circular, but calls a method ' \
            'of some other object with the same name' do
      it 'does not register an offense' 

    end

    context 'when there are multiple offensive keyword arguments' do
      it 'registers an offense' 

    end
  end
end

