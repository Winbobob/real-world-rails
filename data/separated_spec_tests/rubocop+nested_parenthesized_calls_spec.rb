# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NestedParenthesizedCalls do
  subject(:cop) { described_class.new(config) }

  let(:config) do
    RuboCop::Config.new(
      'Style/NestedParenthesizedCalls' => { 'Whitelist' => ['be'] }
    )
  end

  context 'on a non-parenthesized method call' do
    it "doesn't register an offense" 

  end

  context 'on a method call with no arguments' do
    it "doesn't register an offense" 

  end

  context 'on a nested, parenthesized method call' do
    it "doesn't register an offense" 

  end

  context 'on a non-parenthesized call nested in a parenthesized one' do
    context 'with a single argument to the nested call' do
      let(:source) { 'puts(compute something)' }

      it 'registers an offense' 


      it 'auto-corrects by adding parentheses' 

    end

    context 'with multiple arguments to the nested call' do
      it 'registers an offense' 


      it 'auto-corrects by adding parentheses' 

    end
  end

  context 'on a call with no arguments, nested in a parenthesized one' do
    it "doesn't register an offense" 

  end

  context 'on an aref, nested in a parenthesized method call' do
    it "doesn't register an offense" 

  end

  context 'on a deeply nested argument' do
    it "doesn't register an offense" 

  end

  context 'on a whitelisted method' do
    it "doesn't register an offense" 

  end

  context 'on a call to a setter method' do
    it "doesn't register an offense" 

  end
end

