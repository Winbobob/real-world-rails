# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::MultilineMethodCallBraceLayout, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnforcedStyle' => 'symmetrical' } }

  it 'ignores implicit calls' 


  it 'ignores single-line calls' 


  it 'ignores calls without arguments' 


  it 'ignores calls with an empty brace' 


  it 'ignores calls with a multiline empty brace ' 


  include_examples 'multiline literal brace layout' do
    let(:open) { 'foo(' }
    let(:close) { ')' }
  end

  include_examples 'multiline literal brace layout trailing comma' do
    let(:open) { 'foo(' }
    let(:close) { ')' }
  end

  context 'when EnforcedStyle is new_line' do
    let(:cop_config) { { 'EnforcedStyle' => 'new_line' } }

    it 'still ignores single-line calls' 


    it 'ignores single-line calls with multi-line receiver' 


    it 'ignores single-line calls with multi-line receiver with leading dot' 

  end
end

