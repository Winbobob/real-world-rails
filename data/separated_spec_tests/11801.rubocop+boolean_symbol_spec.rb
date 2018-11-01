# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Lint::BooleanSymbol, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense when using `:true`' 


  it 'registers an offense when using `:false`' 


  context 'when using the new hash syntax' do
    it 'registers an offense when using `true:`' 


    it 'registers an offense when using `false:`' 

  end

  it 'does not register an offense when using regular symbol' 


  it 'does not register an offense when using `true`' 


  it 'does not register an offense when using `false`' 

end

