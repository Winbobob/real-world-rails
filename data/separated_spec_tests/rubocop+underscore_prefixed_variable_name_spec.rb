# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::UnderscorePrefixedVariableName do
  subject(:cop) { described_class.new }

  context 'when an underscore-prefixed variable is used' do
    it 'registers an offense' 

  end

  context 'when non-underscore-prefixed variable is used' do
    it 'does not register an offense' 

  end

  context 'when an underscore-prefixed variable is reassigned' do
    it 'does not register an offense' 

  end

  context 'when an underscore-prefixed method argument is used' do
    it 'registers an offense' 

  end

  context 'when an underscore-prefixed block argument is used' do
    it 'registers an offense' 

  end

  context 'when an underscore-prefixed variable in top-level scope is used' do
    it 'registers an offense' 

  end

  context 'when an underscore-prefixed variable is captured by a block' do
    it 'accepts' 

  end

  context 'when an underscore-prefixed named capture variable is used' do
    it 'registers an offense' 

  end

  %w[super binding].each do |keyword|
    context "in a method calling `#{keyword}` without arguments" do
      context 'when an underscore-prefixed argument is not used explicitly' do
        it 'does not register an offense' 

      end

      context 'when an underscore-prefixed argument is used explicitly' do
        it 'registers an offense' 

      end
    end

    context "in a method calling `#{keyword}` with arguments" do
      context 'when an underscore-prefixed argument is not used' do
        it 'does not register an offense' 

      end

      context 'when an underscore-prefixed argument is used explicitly' do
        it 'registers an offense' 

      end
    end
  end
end

