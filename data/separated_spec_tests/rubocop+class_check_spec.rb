# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::ClassCheck, :config do
  subject(:cop) { described_class.new(config) }

  context 'when enforced style is is_a?' do
    let(:cop_config) { { 'EnforcedStyle' => 'is_a?' } }

    it 'registers an offense for kind_of?' 


    it 'auto-corrects kind_of? to is_a?' 

  end

  context 'when enforced style is kind_of?' do
    let(:cop_config) { { 'EnforcedStyle' => 'kind_of?' } }

    it 'registers an offense for is_a?' 


    it 'auto-corrects is_a? to kind_of?' 

  end
end

