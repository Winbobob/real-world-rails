# frozen_string_literal: true

RSpec.describe RuboCop::Cop::RSpec::ImplicitExpect, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is is_expected' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'is_expected' }
    end

    it 'flags it { should }' 


    it 'flags it { should_not }' 


    it 'approves of is_expected.to' 


    it 'approves of is_expected.to_not' 


    it 'approves of is_expected.not_to' 


    include_examples 'detects style', 'it { should be_truthy }', 'should'
    include_examples 'autocorrect',
                     'it { should be_truthy }',
                     'it { is_expected.to be_truthy }'

    include_examples 'autocorrect',
                     'it { should_not be_truthy }',
                     'it { is_expected.to_not be_truthy }'
  end

  context 'when EnforcedStyle is should' do
    let(:cop_config) do
      { 'EnforcedStyle' => 'should' }
    end

    it 'flags it { is_expected.to }' 


    it 'flags it { is_expected.to_not }' 


    it 'flags it { is_expected.not_to }' 


    it 'approves of should' 


    it 'approves of should_not' 


    include_examples 'detects style',
                     'it { is_expected.to be_truthy }',
                     'is_expected'

    include_examples 'detects style',
                     'it { should be_truthy }',
                     'should'

    include_examples 'autocorrect',
                     'it { is_expected.to be_truthy }',
                     'it { should be_truthy }'

    include_examples 'autocorrect',
                     'it { is_expected.to_not be_truthy }',
                     'it { should_not be_truthy }'

    include_examples 'autocorrect',
                     'it { is_expected.not_to be_truthy }',
                     'it { should_not be_truthy }'
  end
end

