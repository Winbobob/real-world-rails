# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::MessageSpies, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is have_received' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'have_received' }
    end

    it 'flags expect(send).to receive' 


    it 'flags expect(lvar).to receive' 


    it 'flags expect(ivar).to receive' 


    it 'flags expect(const).to receive' 


    it 'flags expect(...).not_to receive' 


    it 'flags expect(...).to_not receive' 


    it 'flags expect(...).to receive with' 


    it 'flags expect(...).to receive at_most' 


    it 'approves of expect(...).to have_received' 


    include_examples 'detects style', 'expect(foo).to receive(:bar)', 'receive'

    include_examples 'detects style',
                     'expect(foo).to have_received(:bar)',
                     'have_received'
  end

  context 'when EnforcedStyle is receive' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'receive' }
    end

    it 'flags expect(send).to have_received' 


    it 'flags expect(lvar).to have_received' 


    it 'flags expect(ivar).to have_received' 


    it 'flags expect(const).to have_received' 


    it 'flags expect(...).not_to have_received' 


    it 'flags expect(...).to_not have_received' 


    it 'flags expect(...).to have_received with' 


    it 'flags expect(...).to have_received at_most' 


    it 'approves of expect(...).to receive' 


    include_examples 'detects style', 'expect(foo).to receive(:bar)', 'receive'

    include_examples 'detects style',
                     'expect(foo).to have_received(:bar)',
                     'have_received'
  end
end

