RSpec.describe RuboCop::Cop::RSpec::Capybara::FeatureMethods, :config do
  subject(:cop) { described_class.new(config) }

  let(:cop_config) { { 'EnabledMethods' => [] } }

  it 'flags violations for `background`' 


  it 'flags violations for `scenario`' 


  it 'flags violations for `xscenario`' 


  it 'flags violations for `given`' 


  it 'flags violations for `given!`' 


  it 'flags violations for `feature`' 


  it 'ignores variables inside examples' 
      it 'is valid code' 

    RUBY
  end

  it 'ignores feature calls outside spec' 


  it 'allows includes before the spec' 


  context 'with configured `EnabledMethods`' do
    let(:cop_config) { { 'EnabledMethods' => %w[feature] } }

    it 'ignores usage of the enabled method' 


    it 'flags other methods' 

  end

  shared_examples 'autocorrect_spec' do |original, corrected|
    original = <<-RUBY
      describe Foo do
        #{original}
      end
    RUBY
    corrected = <<-RUBY
      describe Foo do
        #{corrected}
      end
    RUBY

    include_examples 'autocorrect', original, corrected
  end

  include_examples 'autocorrect_spec', 'background { }',    'before { }'
  include_examples 'autocorrect_spec', 'scenario { }',      'it { }'
  include_examples 'autocorrect_spec', 'xscenario { }',     'xit { }'
  include_examples 'autocorrect_spec', 'given(:foo) { }',   'let(:foo) { }'
  include_examples 'autocorrect_spec', 'given!(:foo) { }',  'let!(:foo) { }'
  include_examples 'autocorrect_spec', 'RSpec.feature { }', 'RSpec.describe { }'
end

