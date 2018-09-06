RSpec.describe RuboCop::Cop::RSpec::FilePath, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense for a bad path' 


  it 'registers an offense for a wrong class but a correct method' 


  it 'registers an offense for a repeated .rb' 


  it 'registers an offense for a file missing a .rb' 


  it 'registers an offense for a wrong class and highlights metadata' 


  it 'registers an offense for a wrong class name' 


  it 'registers an offense for a wrong class name with a symbol argument' 


  it 'registers an offense for a file missing _spec' 


  it 'skips specs that do not describe a class / method' 


  it 'skips specs that do have multiple top level describes' 


  it 'checks class specs' 


  it 'allows different parent directories' 


  it 'handles CamelCaps class names' 


  it 'handles ACRONYMClassNames' 


  it 'handles ALLCAPS class names' 


  it 'handles alphanumeric class names' 


  it 'checks instance methods' 


  it 'checks class methods' 


  it 'allows flat hierarchies for instance methods' 


  it 'allows flat hierarchies for class methods' 


  it 'allows subdirs for instance methods' 


  it 'allows subdirs for class methods' 


  it 'ignores non-alphanumeric characters' 


  it 'allows bang method' 


  it 'allows flexibility with predicates' 


  it 'allows flexibility with operators' 


  context 'when configured with CustomTransform' do
    let(:cop_config) { { 'CustomTransform' => { 'FooFoo' => 'foofoo' } } }

    it 'respects custom module name transformation' 


    it 'ignores routing specs' 

  end

  context 'when configured with IgnoreMethods' do
    let(:cop_config) { { 'IgnoreMethods' => true } }

    it 'does not care about the described method' 

  end
end

