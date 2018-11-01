# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::ImplicitStringConcatenation do
  subject(:cop) { described_class.new }

  context 'on a single string literal' do
    it 'does not register an offense' 

  end

  context 'on adjacent string literals on the same line' do
    it 'registers an offense' 

  end

  context 'on adjacent string literals on different lines' do
    it 'does not register an offense' 

  end

  context 'when the string literals contain newlines' do
    it 'registers an offense' 

  end

  context 'on a string with interpolations' do
    it 'does register an offense' 

  end

  context 'when inside an array' do
    it 'notes that the strings could be separated by a comma instead' 

  end

  context "when in a method call's argument list" do
    it 'notes that the strings could be separated by a comma instead' 

  end
end

