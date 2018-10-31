# frozen_string_literal: true

RSpec.describe RuboCop::Cop::Security::MarshalLoad, :config do
  subject(:cop) { described_class.new(config) }

  it 'registers an offense for using Marshal.load' 


  it 'registers an offense for using Marshal.restore' 


  it 'does not register an offense for Marshal.dump' 


  it 'does not register an offense Marshal methods under another namespace' 


  it 'allows using dangerous Marshal methods for deep cloning' 

end

