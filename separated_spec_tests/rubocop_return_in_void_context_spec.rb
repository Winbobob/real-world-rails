# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::ReturnInVoidContext do
  subject(:cop) { described_class.new }

  context 'with an initialize method containing a return with a value' do
    it 'registers an offense' 

  end

  context 'with an initialize method containing a return without a value' do
    it 'accepts' 

  end

  context 'with a setter method containing a return with a value' do
    it 'registers an offense' 

  end

  context 'with a setter method containing a return without a value' do
    it 'accepts' 

  end

  context 'with a non initialize method containing a return' do
    it 'accepts' 

  end

  context 'with a class method called initialize containing a return' do
    it 'accepts' 

  end

  context 'when return is in top scope' do
    it 'accepts' 

  end
end

