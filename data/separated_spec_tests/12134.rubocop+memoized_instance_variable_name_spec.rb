# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Naming::MemoizedInstanceVariableName, :config do
  subject(:cop) { described_class.new(config) }

  context 'with default EnforcedStyleForLeadingUnderscores => disallowed' do
    let(:cop_config) do
      { 'EnforcedStyleForLeadingUnderscores' => 'disallowed' }
    end

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


      it 'does not registers an offense when method has leading `_`' 


      it 'does not register an offense with a leading `_` for both names' 


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

  context 'EnforcedStyleForLeadingUnderscores: required' do
    let(:cop_config) { { 'EnforcedStyleForLeadingUnderscores' => 'required' } }

    it 'registers an offense when names match but missing a leading _' 


    it 'registers an offense when it has leading `_` but names do not match' 


    it 'does not register an offense with a leading `_` for both names' 

  end

  context 'EnforcedStyleForLeadingUnderscores: optional' do
    let(:cop_config) { { 'EnforcedStyleForLeadingUnderscores' => 'optional' } }

    context 'memoized variable matches method name' do
      it 'does not register an offense with a leading underscore' 


      it 'does not register an offense without a leading underscore' 


      it 'does not register an offense with a leading `_` for both names' 


      it 'does not register an offense with a leading `_` for method name' 

    end
  end
end

