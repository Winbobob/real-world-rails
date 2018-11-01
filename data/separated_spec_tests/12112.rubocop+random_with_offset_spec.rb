# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Style::RandomWithOffset do
  subject(:cop) { described_class.new(config) }

  let(:config) { RuboCop::Config.new }

  it 'registers an offense when using rand(int) + offset' 


  it 'registers an offense when using offset + rand(int)' 


  it 'registers an offense when using rand(int).succ' 


  it 'registers an offense when using rand(int) - offset' 


  it 'registers an offense when using offset - rand(int)' 


  it 'registers an offense when using rand(int).pred' 


  it 'registers an offense when using rand(int).next' 


  it 'registers an offense when using Kernel.rand' 


  it 'registers an offense when using Random.rand' 


  it 'registers an offense when using rand(irange) + offset' 


  it 'registers an offense when using rand(erange) + offset' 


  it 'autocorrects rand(int) + offset' 


  it 'autocorrects offset + rand(int)' 


  it 'autocorrects rand(int) - offset' 


  it 'autocorrects offset - rand(int)' 


  it 'autocorrects rand(int).succ' 


  it 'autocorrects rand(int).pred' 


  it 'autocorrects rand(int).next' 


  it 'autocorrects the use of Random.rand' 


  it 'autocorrects the use of Kernel.rand' 


  it 'autocorrects rand(irange) + offset' 


  it 'autocorrects rand(3range) + offset' 


  it 'autocorrects rand(irange) - offset' 


  it 'autocorrects rand(erange) - offset' 


  it 'autocorrects offset - rand(irange)' 


  it 'autocorrects offset - rand(erange)' 


  it 'autocorrects rand(irange).succ' 


  it 'autocorrects rand(erange).succ' 


  it 'does not register an offense when using range with double dots' 


  it 'does not register an offense when using range with triple dots' 

end

