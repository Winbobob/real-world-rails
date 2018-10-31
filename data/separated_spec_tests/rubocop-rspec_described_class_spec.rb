RSpec.describe RuboCop::Cop::RSpec::DescribedClass, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  shared_examples 'SkipBlocks enabled' do
    it 'does not flag violations within non-rspec blocks' 

  end

  shared_examples 'SkipBlocks disabled' do
    it 'flags violations within all blocks' 

  end

  context 'when SkipBlocks is `true`' do
    let(:cop_config) { { 'SkipBlocks' => true } }

    include_examples 'SkipBlocks enabled'
  end

  context 'when SkipBlocks anything besides `true`' do
    let(:cop_config) { { 'SkipBlocks' => 'yes' } }

    include_examples 'SkipBlocks disabled'
  end

  context 'when SkipBlocks is not set' do
    let(:cop_config) { {} }

    include_examples 'SkipBlocks disabled'
  end

  context 'when SkipBlocks is `false`' do
    let(:cop_config) { { 'SkipBlocks' => false } }

    include_examples 'SkipBlocks disabled'
  end

  context 'when EnforcedStyle is :described_class' do
    let(:enforced_style) { :described_class }

    it 'checks for the use of the described class' 


    it 'ignores described class as string' 


    it 'ignores describe that do not reference to a class' 


    it 'ignores class if the scope is changing' 


    it 'only takes class from top level describes' 


    it 'ignores subclasses' 


    it 'ignores if namespace is not matching' 


    it 'checks for the use of described class with namespace' 


    it 'does not flag violations within a class scope change' 


    it 'does not flag violations within a hook scope change' 


    it 'checks for the use of described class with module' 


    it 'accepts an empty block' 


    include_examples 'autocorrect',
                     'describe(Foo) { include Foo }',
                     'describe(Foo) { include described_class }'

    include_examples 'autocorrect',
                     'describe(Foo) { subject { Foo.do_action } }',
                     'describe(Foo) { subject { described_class.do_action } }'

    include_examples 'autocorrect',
                     'describe(Foo) { before { Foo.do_action } }',
                     'describe(Foo) { before { described_class.do_action } }'
  end

  context 'when EnforcedStyle is :explicit' do
    let(:enforced_style) { :explicit }

    it 'checks for the use of the described_class' 


    it 'ignores described_class as string' 


    it 'ignores describe that do not reference to a class' 


    it 'does not flag violations within a class scope change' 


    it 'does not flag violations within a hook scope change' 


    include_examples 'autocorrect',
                     'describe(Foo) { include described_class }',
                     'describe(Foo) { include Foo }'

    include_examples 'autocorrect',
                     'describe(Foo) { subject { described_class.do_action } }',
                     'describe(Foo) { subject { Foo.do_action } }'

    include_examples 'autocorrect',
                     'describe(Foo) { before { described_class.do_action } }',
                     'describe(Foo) { before { Foo.do_action } }'

    original = <<-RUBY
      describe(Foo) { include described_class }
      describe(Bar) { include described_class }
    RUBY
    corrected = <<-RUBY
      describe(Foo) { include Foo }
      describe(Bar) { include Bar }
    RUBY

    include_examples 'autocorrect', original, corrected
  end
end

