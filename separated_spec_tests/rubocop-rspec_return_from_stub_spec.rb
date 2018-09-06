RSpec.describe RuboCop::Cop::RSpec::ReturnFromStub, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style }
  end

  context 'with EnforcedStyle `and_return`' do
    let(:enforced_style) { 'and_return' }

    it 'finds static values returned from block' 


    it 'finds empty values returned from block' 


    it 'finds array with only static values returned from block' 


    it 'finds hash with only static values returned from block' 


    it 'finds static values in a block when there are chained methods' 


    it 'finds constants returned from block' 


    it 'finds nested constants returned from block' 


    it 'ignores dynamic values returned from block' 


    it 'ignores variables return from block' 


    it 'ignores array with dynamic values returned from block' 


    it 'ignores hash with dynamic values returned from block' 


    it 'ignores block returning string with interpolation' 


    it 'finds concatenated strings with no variables' 


    it 'ignores stubs without return value' 


    it 'handles stubs in a method' 


    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar) { 42 }',
                     'allow(Foo).to receive(:bar).and_return(42)'

    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar) { { foo: 42 } }',
                     'allow(Foo).to receive(:bar).and_return({ foo: 42 })'

    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar).with(1) { 42 }',
                     'allow(Foo).to receive(:bar).with(1).and_return(42)'

    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar) {}',
                     'allow(Foo).to receive(:bar).and_return(nil)'

    original = <<-RUBY
      allow(Foo).to receive(:bar) do
        'You called ' \\
        'me'
      end
    RUBY
    corrected = <<-RUBY
      allow(Foo).to receive(:bar).and_return('You called ' \\
        'me')
    RUBY

    include_examples 'autocorrect', original, corrected
  end

  context 'with EnforcedStyle `block`' do
    let(:enforced_style) { 'block' }

    it 'finds static values returned from method' 


    it 'finds static values returned from chained method' 


    it 'ignores dynamic values returned from method' 


    it 'ignores string with interpolation returned from method' 


    it 'ignores multiple values being returned from method' 


    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar).and_return(42)',
                     'allow(Foo).to receive(:bar) { 42 }'

    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar).with(1).and_return(foo: 42)',
                     'allow(Foo).to receive(:bar).with(1) { { foo: 42 } }'

    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar).and_return({ foo: 42 })',
                     'allow(Foo).to receive(:bar) { { foo: 42 } }'

    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar).and_return(foo: 42)',
                     'allow(Foo).to receive(:bar) { { foo: 42 } }'

    original = <<-RUBY
      allow(Foo).to receive(:bar).and_return(
        a: 42,
        b: 43
      )
    RUBY
    corrected = <<-RUBY # Not perfect, but good enough.
      allow(Foo).to receive(:bar) { { a: 42,
        b: 43 } }
    RUBY

    include_examples 'autocorrect', original, corrected

    include_examples 'autocorrect',
                     'allow(Foo).to receive(:bar).and_return(nil)',
                     'allow(Foo).to receive(:bar) { nil }'

    original = <<-RUBY
      allow(Foo).to receive(:bar).and_return('You called ' \\
        'me')
    RUBY
    corrected = <<-RUBY
      allow(Foo).to receive(:bar) { 'You called ' \\
        'me' }
    RUBY

    include_examples 'autocorrect', original, corrected
  end
end

