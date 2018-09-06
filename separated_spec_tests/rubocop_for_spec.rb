# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::For, :config do
  subject(:cop) { described_class.new(config) }

  context 'when each is the enforced style' do
    let(:cop_config) { { 'EnforcedStyle' => 'each' } }

    it 'registers an offense for for' 


    it 'registers an offense for opposite + correct style' 


    it 'accepts multiline each' 


    it 'accepts :for' 


    it 'accepts def for' 

  end

  context 'when for is the enforced style' do
    let(:cop_config) { { 'EnforcedStyle' => 'for' } }

    it 'accepts for' 


    it 'registers an offense for multiline each' 


    it 'registers an offense for correct + opposite style' 


    it 'accepts single line each' 


    context 'when using safe navigation operator' do
      let(:ruby_version) { 2.3 }

      it 'does not break' 

    end
  end
end

