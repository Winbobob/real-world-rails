# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::MultilineMethodDefinitionBraceLayout, :config do # rubocop:disable Metrics/LineLength
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnforcedStyle' => 'symmetrical' } }

  it 'ignores implicit defs' 


  it 'ignores single-line defs' 


  it 'ignores defs without params' 


  include_examples 'multiline literal brace layout' do
    let(:prefix) { 'def foo' }
    let(:suffix) { 'end' }
    let(:open) { '(' }
    let(:close) { ')' }
    let(:multi_prefix) { 'b: ' }
  end
end

