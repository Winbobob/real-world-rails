# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NestedModifier do
  subject(:cop) { described_class.new }

  shared_examples 'avoidable' do |keyword|
    it "registers an offense for modifier #{keyword}" 

  end

  shared_examples 'not correctable' do |keyword|
    it "does not auto-correct when #{keyword} is the outer modifier" 


    it "does not auto-correct when #{keyword} is the inner modifier" 

  end

  context 'if' do
    it_behaves_like 'avoidable', 'if'
  end

  context 'unless' do
    it_behaves_like 'avoidable', 'unless'
  end

  it 'auto-corrects if + if' 


  it 'auto-corrects unless + unless' 


  it 'auto-corrects if + unless' 


  it 'auto-corrects unless with a comparison operator + if' 


  it 'auto-corrects unless + if' 


  it 'adds parentheses when needed in auto-correction' 


  it 'does not add redundant parentheses in auto-correction' 


  context 'while' do
    it_behaves_like 'avoidable', 'while'
    it_behaves_like 'not correctable', 'while'
  end

  context 'until' do
    it_behaves_like 'avoidable', 'until'
    it_behaves_like 'not correctable', 'until'
  end

  it 'registers one offense for more than two modifiers' 

end

