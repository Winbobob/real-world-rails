# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::MessageExpectation, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is allow' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'allow' }
    end

    it 'flags expect(...).to receive' 


    it 'approves of allow(...).to receive' 


    include_examples 'detects style', 'allow(foo).to receive(:bar)',  'allow'
    include_examples 'detects style', 'expect(foo).to receive(:bar)', 'expect'
  end

  context 'when EnforcedStyle is expect' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'expect' }
    end

    it 'flags allow(...).to receive' 


    it 'approves of expect(...).to receive' 


    include_examples 'detects style', 'expect(foo).to receive(:bar)', 'expect'
    include_examples 'detects style', 'allow(foo).to receive(:bar)',  'allow'
  end
end

