RSpec.describe RuboCop::Cop::RSpec::NotToNot, :config do
  subject(:cop) { described_class.new(config) }

  context 'when EnforcedStyle is `not_to`' do
    let(:cop_config) { { 'EnforcedStyle' => 'not_to' } }

    it 'detects the `to_not` offense' 


    it 'detects no offense when using `not_to`' 


    include_examples 'autocorrect',
                     'it { expect(0).to_not equal 1 }',
                     'it { expect(0).not_to equal 1 }'
  end

  context 'when AcceptedMethod is `to_not`' do
    let(:cop_config) { { 'EnforcedStyle' => 'to_not' } }

    it 'detects the `not_to` offense' 


    it 'detects no offense when using `to_not`' 


    include_examples 'autocorrect',
                     'it { expect(0).not_to equal 1 }',
                     'it { expect(0).to_not equal 1 }'
  end
end

