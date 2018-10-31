# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::InheritException, :config do
  subject(:cop) { described_class.new(config) }

  shared_examples 'registers an offense' do |message|
    it 'registers an offense' 

  end

  shared_examples 'auto-correct' do |expected|
    it 'auto-corrects' 

  end

  context 'when class inherits from `Exception`' do
    let(:source) do
      'class C < Exception; end'
    end

    context 'with enforced style set to `runtime_error`' do
      let(:cop_config) { { 'EnforcedStyle' => 'runtime_error' } }

      it_behaves_like 'registers an offense',
                      'Inherit from `RuntimeError` instead of `Exception`.'

      it_behaves_like 'auto-correct', 'class C < RuntimeError; end'
    end

    context 'with enforced style set to `standard_error`' do
      let(:cop_config) { { 'EnforcedStyle' => 'standard_error' } }

      it_behaves_like 'registers an offense',
                      'Inherit from `StandardError` instead of `Exception`.'

      it_behaves_like 'auto-correct', 'class C < StandardError; end'
    end
  end
end

