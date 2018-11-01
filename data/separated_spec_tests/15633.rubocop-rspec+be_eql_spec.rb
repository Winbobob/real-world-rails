RSpec.describe RuboCop::Cop::RSpec::BeEql do
  subject(:cop) { described_class.new }

  it 'registers an offense for `eql` when argument is a boolean' 


  it 'registers an offense for `eql` when argument is an integer' 


  it 'registers an offense for `eql` when argument is a float' 


  it 'registers an offense for `eql` when argument is a symbol' 


  it 'registers an offense for `eql` when argument is nil' 


  it 'does not register an offense for `eql` when argument is a string' 


  it 'does not register an offense for `eql` when expectation is negated' 


  include_examples 'autocorrect',
                   'it { expect(foo).to eql(1) }',
                   'it { expect(foo).to be(1) }'
end

