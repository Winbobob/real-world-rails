RSpec.describe RuboCop::Cop::RSpec::HookArgument, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  shared_examples 'ignored hooks' do
    it 'ignores :context and :suite' 


    it 'ignores hooks with more than one argument' 


    it 'ignores non-rspec hooks' 

  end

  shared_examples 'hook autocorrect' do |output|
    include_examples 'autocorrect', 'before(:each) { }', output
    include_examples 'autocorrect', 'before(:example) { }', output
    include_examples 'autocorrect', 'before { }', output

    include_examples 'autocorrect', 'config.before(:each) { }',
                     'config.' + output
    include_examples 'autocorrect', 'config.before(:example) { }',
                     'config.' + output
    include_examples 'autocorrect', 'config.before { }',
                     'config.' + output
  end

  shared_examples 'an example hook' do
    include_examples 'ignored hooks'
    include_examples 'detects style', 'before(:each) { foo }', 'each'
    include_examples 'detects style', 'before(:example) { foo }', 'example'
    include_examples 'detects style', 'before { foo }', 'implicit'
  end

  context 'when EnforcedStyle is :implicit' do
    let(:enforced_style) { :implicit }

    it 'detects :each for hooks' 


    it 'detects :example for hooks' 


    it 'does not flag hooks without default scopes' 


    include_examples 'an example hook'
    include_examples 'hook autocorrect', 'before { }'
  end

  context 'when EnforcedStyle is :each' do
    let(:enforced_style) { :each }

    it 'detects :each for hooks' 


    it 'detects :example for hooks' 


    it 'detects hooks without default scopes' 


    include_examples 'an example hook'
    include_examples 'hook autocorrect', 'before(:each) { }'
  end

  context 'when EnforcedStyle is :example' do
    let(:enforced_style) { :example }

    it 'detects :example for hooks' 


    it 'detects :each for hooks' 


    it 'does not flag hooks without default scopes' 


    include_examples 'an example hook'
    include_examples 'hook autocorrect', 'before(:example) { }'
  end
end

