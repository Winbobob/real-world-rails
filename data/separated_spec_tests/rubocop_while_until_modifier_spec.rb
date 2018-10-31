# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::WhileUntilModifier do
  include StatementModifierHelper

  subject(:cop) { described_class.new(config) }

  let(:config) do
    hash = { 'Metrics/LineLength' => { 'Max' => 80 } }
    RuboCop::Config.new(hash)
  end

  it "accepts multiline unless that doesn't fit on one line" 


  it 'accepts multiline unless whose body is more than one line' 


  context 'multiline while that fits on one line' do
    it 'registers an offense' 


    it 'does auto-correction' 

  end

  it "accepts multiline while that doesn't fit on one line" 


  it 'accepts multiline while whose body is more than one line' 


  it 'accepts oneline while when condition has local variable assignment' 


  context 'oneline while when assignment is in body' do
    let(:source) do
      <<-RUBY.strip_indent
        while true
          x = 0
        end
      RUBY
    end

    it 'registers an offense' 


    it 'does auto-correction' 

  end

  context 'multiline until that fits on one line' do
    it 'registers an offense' 


    it 'does auto-correction' 

  end

  it "accepts multiline until that doesn't fit on one line" 


  it 'accepts multiline until whose body is more than one line' 


  it 'accepts an empty condition' 


  it 'accepts modifier while' 


  it 'accepts modifier until' 


  # Regression: https://github.com/bbatsov/rubocop/issues/4006
  context 'when the modifier condition is multiline' do
    it 'registers an offense' 

  end
end

