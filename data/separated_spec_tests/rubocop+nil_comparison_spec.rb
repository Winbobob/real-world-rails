# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::NilComparison, :config do
  subject(:cop) { described_class.new(config) }

  context 'configured with predicate preferred' do
    let(:cop_config) { { 'EnforcedStyle' => 'predicate' } }

    it 'registers an offense for == nil' 


    it 'registers an offense for === nil' 


    it 'autocorrects by replacing == nil with .nil?' 


    it 'autocorrects by replacing === nil with .nil?' 

  end

  context 'configured with comparison preferred' do
    let(:cop_config) { { 'EnforcedStyle' => 'comparison' } }

    it 'registers an offense for nil?' 


    it 'autocorrects by replacing.nil? with == nil' 

  end
end

