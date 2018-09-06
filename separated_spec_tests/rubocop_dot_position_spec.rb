# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::DotPosition, :config do
  subject(:cop) { described_class.new(config) }

  context 'Leading dots style' do
    let(:cop_config) { { 'EnforcedStyle' => 'leading' } }

    it 'registers an offense for trailing dot in multi-line call' 


    it 'registers an offense for correct + opposite' 


    it 'accepts leading do in multi-line method call' 


    it 'does not err on method call with no dots' 


    it 'does not err on method call without a method name' 


    it 'does not err on method call on same line' 


    it 'auto-corrects trailing dot in multi-line call' 


    it 'auto-corrects trailing dot in multi-line call without selector' 


    it 'auto-corrects correct + opposite style' 


    context 'when there is an intervening line comment' do
      it 'does not register offense' 

    end

    context 'when there is an intervening blank line' do
      it 'does not register offense' 

    end
  end

  context 'Trailing dots style' do
    let(:cop_config) { { 'EnforcedStyle' => 'trailing' } }

    it 'registers an offense for leading dot in multi-line call' 


    it 'accepts trailing dot in multi-line method call' 


    it 'does not err on method call with no dots' 


    it 'does not err on method call without a method name' 


    it 'does not err on method call on same line' 


    it 'does not get confused by several lines of chained methods' 


    it 'auto-corrects leading dot in multi-line call' 


    it 'auto-corrects leading dot in multi-line call without selector' 

  end
end

