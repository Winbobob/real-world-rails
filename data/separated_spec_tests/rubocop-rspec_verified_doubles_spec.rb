RSpec.describe RuboCop::Cop::RSpec::VerifiedDoubles, :config do
  subject(:cop) { described_class.new(config) }

  it 'finds a `double` instead of an `instance_double`' 


  context 'when configuration does not specify IgnoreSymbolicNames' do
    let(:cop_config) { {} }

    it 'find doubles whose name is a symbol' 


    it 'finds a `spy` instead of an `instance_spy`' 

  end

  context 'when configured to ignore symbolic names' do
    let(:cop_config) { { 'IgnoreSymbolicNames' => true } }

    it 'ignores doubles whose name is a symbol' 


    it 'still flags doubles whose name is a string' 

  end

  it 'ignores doubles without a name' 


  it 'ignores instance_doubles' 

end

