RSpec.describe RuboCop::Cop::RSpec::AroundBlock do
  subject(:cop) { described_class.new }

  context 'when no value is yielded' do
    it 'registers an offense' 

  end

  context 'when the hook is scoped with a symbol' do
    it 'registers an offense' 

  end

  context 'when the yielded value is unused' do
    it 'registers an offense' 

  end

  context 'when two values are yielded and the first is unused' do
    it 'registers an offense for the first argument' 

  end

  context 'when the yielded value is referenced but not used' do
    it 'registers an offense' 

  end

  context 'when a method other than #run or #call is called' do
    it 'registers an offense' 

  end

  context 'when #run is called' do
    it 'does not register an offense' 

  end

  context 'when #call is called' do
    it 'does not register an offense' 

  end

  context 'when used as a block arg' do
    it 'does not register an offense' 

  end

  context 'when passed to another method' do
    it 'does not register an offense' 

  end

  context 'when yielded to another block' do
    it 'does not register an offense' 

  end
end

