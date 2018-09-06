RSpec.describe RuboCop::Cop::RSpec::ItBehavesLike, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  context 'when the enforced style is `it_behaves_like`' do
    let(:enforced_style) { :it_behaves_like }

    it 'flags a violation for it_should_behave_like' 


    it 'does not flag a violation for it_behaves_like' 


    include_examples(
      'autocorrect',
      "foo(); it_should_behave_like 'a foo'",
      "foo(); it_behaves_like 'a foo'"
    )
  end

  context 'when the enforced style is `it_should_behave_like`' do
    let(:enforced_style) { :it_should_behave_like }

    it 'flags a violation for it_behaves_like' 


    it 'does not flag a violation for it_behaves_like' 


    include_examples(
      'autocorrect',
      "foo(); it_behaves_like 'a foo'",
      "foo(); it_should_behave_like 'a foo'"
    )
  end
end

