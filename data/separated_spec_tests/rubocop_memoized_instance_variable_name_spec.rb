# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::MemoizedInstanceVariableName do
  subject(:cop) { described_class.new }

  context 'memoized variable does not match method name' do
    it 'registers an offense' 

  end

  context 'memoized variable does not match class method name' do
    it 'registers an offense' 

  end

  context 'memoized variable does not match method name during assignment' do
    it 'registers an offense' 

  end

  context 'memoized variable does not match method name for block' do
    it 'registers an offense' 

  end

  context 'memoized variable after other code does not match method name' do
    it 'registers an offense' 


    it 'registers an offense for a predicate method' 


    it 'registers an offense for a bang method' 

  end

  context 'memoized variable matches method name' do
    it 'does not register an offense' 


    context 'memoized variable matches method name during assignment' do
      it 'does not register an offense' 

    end

    context 'memoized variable matches method name for block' do
      it 'does not register an offense' 

    end

    context 'non-memoized variable does not match method name' do
      it 'does not register an offense' 

    end

    context 'memoized variable matches predicate method name' do
      it 'does not register an offense' 

    end

    context 'memoized variable matches bang method name' do
      it 'does not register an offense' 

    end

    context 'code follows memoized variable assignment' do
      it 'does not register an offense' 


      context 'memoized variable after other code' do
        it 'does not register an offense' 

      end

      context 'instance variables in initialize methods' do
        it 'does not register an offense' 

      end
    end
  end
end

