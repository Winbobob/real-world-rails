# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Security::JSONLoad, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense for JSON.load' 


  it 'registers an offense for JSON.restore' 


  it 'does not register an offense for JSON under another namespace' 


  it 'allows JSON.parse' 


  it 'allows JSON.dump' 


  it 'autocorrects .load to .parse' 

end

