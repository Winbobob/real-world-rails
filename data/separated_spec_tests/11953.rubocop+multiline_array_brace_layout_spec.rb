# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Layout::MultilineArrayBraceLayout, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnforcedStyle' => 'symmetrical' } }

  it 'ignores implicit arrays' 


  it 'ignores single-line arrays' 


  it 'ignores empty arrays' 


  include_examples 'multiline literal brace layout' do
    let(:open) { '[' }
    let(:close) { ']' }
  end

  include_examples 'multiline literal brace layout method argument' do
    let(:open) { '[' }
    let(:close) { ']' }
  end

  include_examples 'multiline literal brace layout trailing comma' do
    let(:open) { '[' }
    let(:close) { ']' }
  end
end

