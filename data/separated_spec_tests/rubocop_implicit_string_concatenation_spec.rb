# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::ImplicitStringConcatenation do
  subject(:cop) { described_class.new }

  context 'on a single string literal' do
    it 'does not register an offense' 

  end

  context 'on adjacent string literals on the same line' do
    let(:source) { 'class A; "abc" "def"; end' }

    it 'registers an offense' 

  end

  context 'on adjacent string literals on different lines' do
    it 'does not register an offense' 

  end

  context 'when the string literals contain newlines' do
    let(:source) { "def method; 'ab\nc' 'de\nf'; end" }

    it 'registers an offense' 

  end

  context 'on a string with interpolations' do
    it 'does register an offense' 

  end

  context 'when inside an array' do
    let(:source) { 'array = ["abc" "def"]' }

    it 'notes that the strings could be separated by a comma instead' 

  end

  context "when in a method call's argument list" do
    let(:source) { 'method("abc" "def")' }

    it 'notes that the strings could be separated by a comma instead' 

  end
end

