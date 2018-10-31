RSpec.describe RuboCop::Cop::RSpec::ExpectChange, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  context 'with EnforcedStyle `method_call`' do
    let(:enforced_style) { 'method_call' }

    it 'finds blocks that contain simple message sending' 


    it 'ignores blocks that cannot be converted to obj/attribute pair' 


    it 'ignores change method of object that happens to receive a block' 


    include_examples(
      'autocorrect',
      'expect(run).to change { User.count }.by(1)',
      'expect(run).to change(User, :count).by(1)'
    )
  end

  context 'with EnforcedStyle `block`' do
    let(:enforced_style) { 'block' }

    it 'finds change matcher without block' 


    it 'finds change matcher when receiver is a variable' 


    it 'ignores methods called change' 


    include_examples(
      'autocorrect',
      'expect(run).to change(User, :count).by(1)',
      'expect(run).to change { User.count }.by(1)'
    )
  end
end

