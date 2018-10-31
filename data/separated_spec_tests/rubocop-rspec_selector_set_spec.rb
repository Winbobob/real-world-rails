RSpec.describe RuboCop::RSpec::Language::SelectorSet do
  subject(:selector_set) { described_class.new(%i[foo bar]) }

  it 'composes sets' 


  it 'compares by value' 


  describe '#include?' do
    it 'returns false for selectors not in the set' 


    it 'returns true for selectors in the set' 

  end

  describe '#node_pattern' do
    it 'builds a node pattern' 

  end

  describe '#node_pattern_union' do
    it 'builds a node pattern union' 

  end

  describe '#send_pattern' do
    it 'builds a send matching pattern' 

  end

  describe '#block_pattern' do
    it 'builds a block matching pattern' 

  end
end

