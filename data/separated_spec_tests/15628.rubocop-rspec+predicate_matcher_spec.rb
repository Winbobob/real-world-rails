RSpec.describe RuboCop::Cop::RSpec::PredicateMatcher, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) do
    { 'EnforcedStyle' => enforced_style,
      'Strict' => strict }
  end

  context 'when enforced style is `inflected`' do
    let(:enforced_style) { 'inflected' }

    shared_examples 'inflected common' do
      it 'registers an offense for a predicate method in actual' 


      it 'registers an offense for a predicate method with argument' 


      it 'registers an offense for a predicate method with a block' 


      it 'accepts a predicate method that is not ckeced true/false' 


      it 'accepts non-predicate method' 


      include_examples 'autocorrect',
                       'expect(foo.empty?).to be_truthy',
                       'expect(foo).to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).not_to be_truthy',
                       'expect(foo).not_to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).to_not be_truthy',
                       'expect(foo).not_to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).to be_falsey',
                       'expect(foo).not_to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).not_to be_falsey',
                       'expect(foo).to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).not_to a_truthy_value',
                       'expect(foo).not_to be_empty'

      include_examples 'autocorrect',
                       'expect(foo.is_a?(Array)).to be_truthy',
                       'expect(foo).to be_a(Array)'

      include_examples 'autocorrect',
                       'expect(foo.instance_of?(Array)).to be_truthy',
                       'expect(foo).to be_an_instance_of(Array)'

      include_examples 'autocorrect',
                       'expect(foo.has_something?).to be_truthy',
                       'expect(foo).to have_something'
      include_examples 'autocorrect',
                       'expect(foo.has_something?).not_to be_truthy',
                       'expect(foo).not_to have_something'
      include_examples 'autocorrect',
                       'expect(foo.include?(something)).to be_truthy',
                       'expect(foo).to include(something)'
      include_examples 'autocorrect',
                       'expect(foo.respond_to?(:bar)).to be_truthy',
                       'expect(foo).to respond_to(:bar)'

      include_examples 'autocorrect',
                       'expect(foo.something?()).to be_truthy',
                       'expect(foo).to be_something()'
      include_examples 'autocorrect',
                       'expect(foo.something? 1, 2).to be_truthy',
                       'expect(foo).to be_something 1, 2'
      include_examples 'autocorrect',
                       'expect(foo.has_key?("foo")).to be_truthy',
                       'expect(foo).to have_key("foo")'
      include_examples 'autocorrect',
                       'expect(foo.something?(1, 2)).to be_truthy',
                       'expect(foo).to be_something(1, 2)'

      include_examples 'autocorrect',
                       'expect(foo.all? { |x| x.present? }).to be_truthy',
                       'expect(foo).to be_all { |x| x.present? }'
      include_examples 'autocorrect',
                       'expect(foo.all?(n) { |x| x.present? }).to be_truthy',
                       'expect(foo).to be_all(n) { |x| x.present? }'
      include_examples 'autocorrect',
                       'expect(foo.all? { present }).to be_truthy',
                       'expect(foo).to be_all { present }'
      include_examples 'autocorrect',
                       'expect(foo.all? { }).to be_truthy',
                       'expect(foo).to be_all { }'
      include_examples 'autocorrect',
                       <<-BEFORE, <<-AFTER
                         expect(foo.all? do |x|
                           x + 1
                           x >= 2
                         end).to be_truthy
                       BEFORE
                         expect(foo).to be_all do |x|
                           x + 1
                           x >= 2
                         end
                       AFTER
      include_examples 'autocorrect',
                       'expect(foo.all? do; end).to be_truthy',
                       'expect(foo).to be_all do; end'
    end

    context 'when strict is true' do
      let(:strict) { true }

      include_examples 'inflected common'

      it 'accepts strict checking boolean matcher' 

    end

    context 'when strict is false' do
      let(:strict) { false }

      include_examples 'inflected common'

      it 'registers an offense for a predicate method in actual' 


      include_examples 'autocorrect',
                       'expect(foo.empty?).to eq(true)',
                       'expect(foo).to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).to eq(false)',
                       'expect(foo).not_to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).to be(true)',
                       'expect(foo).to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).to be(false)',
                       'expect(foo).not_to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).not_to be(true)',
                       'expect(foo).not_to be_empty'
      include_examples 'autocorrect',
                       'expect(foo.empty?).not_to be(false)',
                       'expect(foo).to be_empty'
    end
  end

  context 'when enforced style is `explicit`' do
    let(:enforced_style) { 'explicit' }

    shared_examples 'explicit common' do
      it 'registers an offense for a predicate mather' 


      it 'registers an offense for a predicate mather with argument' 


      it 'registers an offense for a predicate matcher with a block' 


      it 'accepts built in matchers' 


      it 'accepts non-predicate matcher' 

    end

    shared_examples 'explicit autocorrect' do |matcher_true, matcher_false|
      include_examples 'autocorrect',
                       'expect(foo).to be_something',
                       "expect(foo.something?).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).not_to be_something',
                       "expect(foo.something?).to #{matcher_false}"
      include_examples 'autocorrect',
                       'expect(foo).to have_something',
                       "expect(foo.has_something?).to #{matcher_true}"

      include_examples 'autocorrect',
                       'expect(foo).to be_a(Array)',
                       "expect(foo.is_a?(Array)).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).to be_instance_of(Array)',
                       "expect(foo.instance_of?(Array)).to #{matcher_true}"

      include_examples 'autocorrect',
                       'expect(foo).to be_something()',
                       "expect(foo.something?()).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).to be_something(1)',
                       "expect(foo.something?(1)).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).to be_something(1, 2)',
                       "expect(foo.something?(1, 2)).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).to be_something 1, 2',
                       "expect(foo.something? 1, 2).to #{matcher_true}"

      include_examples 'autocorrect',
                       'expect(foo).to be_all { |x| x.present? }',
                       "expect(foo.all? { |x| x.present? }).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).to be_all(n) { |x| x.ok? }',
                       "expect(foo.all?(n) { |x| x.ok? }).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).to be_all { present }',
                       "expect(foo.all? { present }).to #{matcher_true}"
      include_examples 'autocorrect',
                       'expect(foo).to be_all { }',
                       "expect(foo.all? { }).to #{matcher_true}"
      include_examples 'autocorrect',
                       <<-BEFORE, <<-AFTER
                         expect(foo).to be_all do |x|
                           x + 1
                           x >= 2
                         end
                       BEFORE
                         expect(foo.all? do |x|
                           x + 1
                           x >= 2
                         end).to #{matcher_true}
                       AFTER
      include_examples 'autocorrect',
                       'expect(foo).to be_all do; end',
                       "expect(foo.all? do; end).to #{matcher_true}"
    end

    context 'when strict is true' do
      let(:strict) { true }

      include_examples 'explicit common'
      include_examples 'explicit autocorrect', 'be(true)', 'be(false)'
    end

    context 'when strict is false' do
      let(:strict) { false }

      include_examples 'explicit common'
      include_examples 'explicit autocorrect', 'be_truthy', 'be_falsey'
    end
  end
end

