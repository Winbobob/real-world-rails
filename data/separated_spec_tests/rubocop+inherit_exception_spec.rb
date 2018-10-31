# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::InheritException, :config do
  subject(:cop) { described_class.new(config) }

  context 'when class inherits from `Exception`' do
    context 'with enforced style set to `runtime_error`' do
      let(:cop_config) { { 'EnforcedStyle' => 'runtime_error' } }

      it 'registers an offense' 


      it 'auto-corrects' 

    end

    context 'with enforced style set to `standard_error`' do
      let(:cop_config) { { 'EnforcedStyle' => 'standard_error' } }

      it 'registers an offense' 


      it 'auto-corrects' 

    end
  end
end

