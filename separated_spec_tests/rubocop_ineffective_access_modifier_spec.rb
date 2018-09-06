# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::IneffectiveAccessModifier do
  subject(:cop) { described_class.new }

  context 'when `private` is applied to a class method' do
    it 'registers an offense' 

  end

  context 'when `protected` is applied to a class method' do
    it 'registers an offense' 

  end

  context 'when `private_class_method` is used' do
    it "doesn't register an offense" 

  end

  context 'when a `class << self` block is used' do
    it "doesn't register an offense" 

  end

  context 'when there is an intervening instance method' do
    it 'still registers an offense' 

  end
end

