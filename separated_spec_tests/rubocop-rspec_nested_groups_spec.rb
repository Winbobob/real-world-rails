# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::NestedGroups, :config do
  subject(:cop) { described_class.new(config) }

  it 'flags nested contexts' 


  it 'support --auto-gen-config' 


  it 'ignores non-spec context methods' 


  context 'when Max is configured as 2' do
    let(:cop_config) { { 'Max' => '2' } }

    it 'flags two levels of nesting' 

  end

  context 'when configured with MaxNesting' do
    let(:cop_config) { { 'MaxNesting' => '1' } }

    it 'emits a deprecation warning' 

  end
end

